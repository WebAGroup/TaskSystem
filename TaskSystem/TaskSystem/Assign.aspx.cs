using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskSystem.DataAccess;

namespace TaskSystem
{
    public partial class Assign : System.Web.UI.Page
    {
        //一次作业，保存在Session中
        Dictionary<Assignment, List<Problem>> OneAssignment = new Dictionary<Assignment, List<Problem>>();

        ProblemManager ProMan = new ProblemManager();
        static List<Problem> problems = new List<Problem>();

        AssignmentManager assignMan = new AssignmentManager();
        static Assignment assignment = new Assignment();
        List<Assignment> assignments = new List<Assignment>();

        Teacher tea = new Teacher();
        CourseManager CourMan = new CourseManager();
        Course course = new Course();

        protected void Page_Load(object sender, EventArgs e)
        {
            //获取课程信息
            tea = (Teacher)Session["teacher"];

            List<Course> courseforteacher = CourMan.GetCourseForTeacher(tea.username);
            foreach (var c in courseforteacher)
            {
                if (c.num == Request.QueryString["Coursenum"])
                {
                    course = c;
                    break;
                }
            }

            coursenameLabel.Text = course.name;
            //Session["assignment"] = OneAssignment;
        }
        protected void AssignQuitButton_Click(object sender, EventArgs e)
        {
            AssignTitlePanel.Visible = false;
        }

        //添加一次作业
        protected void AssignSureButton_Click(object sender, EventArgs e)
        {
            AssignTitlePanel.Visible = false;
            ProblemsPanel.Visible = true;

            string date = datelineTextBox.Text + " 23:59:59";

            //显示课程信息
            assignmentcourseLabel.Text = "课程：" + course.name;
            assignmentLabel.Text = "<br>标题：" + assigntitleTextBox.Text + "<br>截止日期：" + date + "<br>说明：" + assigndescriTextBox.Text;

            //添加assignment
            assignment.title = assigntitleTextBox.Text;
            assignment.descrip = assigndescriTextBox.Text;
            assignment.start_time = DateTime.Now;
            assignment.end_time = DateTime.Parse(date);
            assignment.course = course.num;
            assignment.major = "11SE";
            AssignmentManager am = new AssignmentManager();
            am.create(assignment);

        }

        protected void AddPro_Click(object sender, EventArgs e)
        {
            AProPanel.Visible = true;
        }

        protected void AProQuitButton_Click(object sender, EventArgs e)
        {
            AProPanel.Visible = false;
        }

        //添加该作业的一个问题
        protected void AProSureButton_Click(object sender, EventArgs e)
        {
            ProblemManager pm = new ProblemManager();
            AProPanel.Visible = false;

            Problem Apro = new Problem();
            Apro.title = AProtitleTextBox.Text;
            Apro.descrip = AProdescriTextBox.Text;
            Apro.score = 1.0f;
            Apro.assignment = assignment.id;

            pm.create(Apro);
            problems.Add(Apro);

            //SelectProRadioButtonList.Items.Clear();

            SelectProRadioButtonList.Items.Clear();
            for (int i = 0; i != problems.Count; i++)
            {
                SelectProRadioButtonList.Items.Add(new ListItem(i+1 + "." + problems[i].title + "<br>" + problems[i].descrip, i.ToString()));
            }
        }

        //修改这个问题
        protected void UpdatePro_Click(object sender, EventArgs e)
        {
            UpdateAProPanel.Visible = true;
            int selectindex = int.Parse(SelectProRadioButtonList.SelectedValue);
            UpdateAProtitleTextBox.Text = problems[selectindex].title;
            UpdateAProdescriTextBox.Text = problems[selectindex].descrip;
        }

        protected void DeletePro_Click(object sender, EventArgs e)
        {
            int selectindex = int.Parse(SelectProRadioButtonList.SelectedValue);
            problems.RemoveAt(selectindex);
            SelectProRadioButtonList.Items.Clear();

            for (int i = 0; i != problems.Count; i++)
            {
                SelectProRadioButtonList.Items.Add(new ListItem(i + 1 + "." + problems[i].title + "<br>" + problems[i].descrip, i.ToString()));
            }
        }

        protected void UpdateAProQuitButton_Click(object sender, EventArgs e)
        {
            UpdateAProPanel.Visible = false;
        }

        protected void UpdateAProSureButton_Click(object sender, EventArgs e)
        {
            UpdateAProPanel.Visible = false;
            int selectindex = int.Parse(SelectProRadioButtonList.SelectedValue);
            problems[selectindex].title = UpdateAProtitleTextBox.Text;
            problems[selectindex].descrip = UpdateAProdescriTextBox.Text;

            SelectProRadioButtonList.Items.Clear();

            for (int i = 0; i != problems.Count; i++)
            {
                SelectProRadioButtonList.Items.Add(new ListItem(i + 1 + "." + problems[i].title + "<br>" + problems[i].descrip, i.ToString()));
            }
        }

        //保存此次作业
        protected void ProblemsSaveButton_Click(object sender, EventArgs e)
        {
            //assignMan.create(problems, assignment);
            //assignMan.update(problems, assignment);
            problems.Clear();
            Response.Redirect("AllAssignment.aspx?Coursenum=" + Request.QueryString["Coursenum"]);
        }

        protected void ProblemsQuitButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllAssignment.aspx?Coursenum=" + Request.QueryString["Coursenum"]);
        }
    }
}