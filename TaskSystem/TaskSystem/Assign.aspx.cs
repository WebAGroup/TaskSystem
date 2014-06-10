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
        ProblemManager ProMan = new ProblemManager();
        List<Problem> problems = new List<Problem>();

        AssignmentManager assignMan = new AssignmentManager();

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
            //显示课程名
            coursenameLabel.Text = course.name;

            //删除问题时弹窗
            DeletePro.Attributes.Add("onclick", "return confirm('确定要删吗?');");

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

            Assignment assignment = new Assignment();

            string date = datelineTextBox.Text + " 23:59:59";

            //显示课程信息
            assignmentcourseLabel.Text = "课程：" + course.name;
            assignmentLabel.Text = "<br>标题：" + assigntitleTextBox.Text + "<br>截止日期：" + date + "<br>说明：" + assigndescriTextBox.Text;

            //获得课程作业数
            List<Assignment> assignmentnum = assignMan.getAssignment(course.num);

            //添加assignment
            assignment.number = assignmentnum.Count + 1;
            assignment.title = assigntitleTextBox.Text;
            assignment.descrip = assigndescriTextBox.Text;
            assignment.start_time = DateTime.Now;
            assignment.end_time = DateTime.Parse(date);
            assignment.course = course.num;
            assignment.major = "11SE";

            //将作业写入数据库
            assignMan.create(assignment);

            Session["Aassignment"] = assignment;
            Session["problems"] = problems;

        }

        protected void AddPro_Click(object sender, EventArgs e)
        {
            NoProblemLabel.Visible = false;
            AProPanel.Visible = true;
        }

        protected void AProQuitButton_Click(object sender, EventArgs e)
        {
            AProPanel.Visible = false;
        }

        //添加该作业的一个问题
        protected void AProSureButton_Click(object sender, EventArgs e)
        {
            AProPanel.Visible = false;
                
            Assignment assignment = (Assignment)Session["Aassignment"];
            Problem Apro = new Problem();
            problems = (List<Problem>)Session["problems"];

            Apro.title = AProtitleTextBox.Text;
            Apro.descrip = AProdescriTextBox.Text;
            Apro.score = 1.0f;
            Apro.assignment = assignment.id;

            problems.Add(Apro);
            Session["problems"] = problems;

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
            problems = (List<Problem>)Session["problems"];

            int selectindex = int.Parse(SelectProRadioButtonList.SelectedValue);
            UpdateAProtitleTextBox.Text = problems[selectindex].title;
            UpdateAProdescriTextBox.Text = problems[selectindex].descrip;

        }

        //删除问题
        protected void DeletePro_Click(object sender, EventArgs e)
        {
            problems = (List<Problem>)Session["problems"];

            int selectindex = int.Parse(SelectProRadioButtonList.SelectedValue);
            problems.RemoveAt(selectindex);
            Session["problems"] = problems;

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

            problems = (List<Problem>)Session["problems"];
            
            int selectindex = int.Parse(SelectProRadioButtonList.SelectedValue);
            problems[selectindex].title = UpdateAProtitleTextBox.Text;
            problems[selectindex].descrip = UpdateAProdescriTextBox.Text;

            Session["problems"] = problems;

            SelectProRadioButtonList.Items.Clear();

            for (int i = 0; i != problems.Count; i++)
            {
                SelectProRadioButtonList.Items.Add(new ListItem(i + 1 + "." + problems[i].title + "<br>" + problems[i].descrip, i.ToString()));
            }
        }

        //保存此次作业
        protected void ProblemsSaveButton_Click(object sender, EventArgs e)
        {
            //将问题存入数据库
            problems = (List<Problem>)Session["problems"];
            if (problems.Count == 0)
            {
                NoProblemLabel.Visible = true;
            }
            else
            {
                foreach (Problem Apro in problems)
                {
                    ProMan.create(Apro);
                }
                Response.Redirect("AllAssignment.aspx?Coursenum=" + Request.QueryString["Coursenum"]);
            }
        }

        protected void ProblemsQuitButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllAssignment.aspx?Coursenum=" + Request.QueryString["Coursenum"]);
        }
    }
}