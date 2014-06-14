using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskSystem.DataAccess;

namespace TaskSystem
{
    public partial class AddCourse : LoginValidate
    {
        CourseManager CourMan = new CourseManager();
       
        Teacher tea = new Teacher();

        protected void Page_Load(object sender, EventArgs e)
        {
            DeleteCourseSureButton.Attributes.Add("onclick", "return confirm('确定要删吗?');");
        }

        protected void AddCourseButton_Click(object sender, EventArgs e)
        {
            DeletePanel.Visible = false;
            AddCoursePanel.Visible = true;
        }

        protected void AddCourseSureButton_Click(object sender, EventArgs e)
        {
            tea = (Teacher)Session["teacher"];
            Course newcourse = new Course();
            if (cournumTextBox.Text == "")
                CoursenumLabel.Visible = true;

            else if (cournameTextBox.Text == "")
            {
                CoursenumLabel.Visible = false;
                CoursenameLabel.Visible = true;
            }
            else 
            {
                newcourse.teacher = tea.username;
                newcourse.name = cournameTextBox.Text;
                newcourse.num = cournumTextBox.Text;
                DateTime start = Convert.ToDateTime(courstart_timeTextBox.Text + " 00:00:00");
                newcourse.start_time = start;
                DateTime end = Convert.ToDateTime(courend_timeTextBox.Text + " 23:59:59");
                newcourse.end_time = end;

                CourMan.AddCourse(newcourse);
                Response.Write("<script>alert('成功添加!');location.href='AddCourse.aspx';</script>");
                //Response.Redirect("AddCourse.aspx");
            }
        }

        protected void AddCourseQuitButton_Click(object sender, EventArgs e)
        {
            AddCoursePanel.Visible = false;
        }

        protected void DeleteCourseButton_Click(object sender, EventArgs e)
        {
            AddCoursePanel.Visible = false;
            DeletePanel.Visible = true;
        }

        protected void DeleteCourseSureButton_Click(object sender, EventArgs e)
        {
            Course deletecourse = (Course)Session["deletecourse"];
            CourMan.DeleteCourse(deletecourse);
            Response.Write("<script>alert('成功删除!');location.href='AddCourse.aspx';</script>"); 
            //Response.Redirect("AddCourse.aspx");
            
        }

        protected void DeleteCourseQuitButton_Click(object sender, EventArgs e)
        {
            DeletePanel.Visible = false;
        }

        protected void dcnameTextBox_TextChanged(object sender, EventArgs e)
        {
            tea = (Teacher)Session["teacher"];
            Course deletecourse = new Course();
            List<Course> courseforteacher = CourMan.GetCourseForTeacher(tea.username);
            foreach (var c in courseforteacher)
            {
                if (c.name == dcnameTextBox.Text.ToString())
                {
                    deletecourse = c;
                    break;
                }
            }
            Session["deletecourse"] = deletecourse;

            dcnumTextBox.Text = deletecourse.num;
            dcstart_timeLabel.Text = deletecourse.start_time.ToString();
            dcend_timeLabel.Text = deletecourse.end_time.ToString();
        }

        protected void dcnumTextBox_TextChanged(object sender, EventArgs e)
        {
            tea = (Teacher)Session["teacher"];
            Course deletecourse = new Course();

            List<Course> courseforteacher = CourMan.GetCourseForTeacher(tea.username);
            foreach (var c in courseforteacher)
            {
                if (c.num == dcnumTextBox.Text.ToString())
                {
                    deletecourse = c;
                    break;
                }
            }
            Session["deletecourse"] = deletecourse;

            dcnameTextBox.Text = deletecourse.name;
            dcstart_timeLabel.Text = deletecourse.start_time.ToString();
            dcend_timeLabel.Text = deletecourse.end_time.ToString();
        }


    }
}