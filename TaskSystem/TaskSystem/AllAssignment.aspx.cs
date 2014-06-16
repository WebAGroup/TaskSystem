using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskSystem.DataAccess;

namespace TaskSystem
{
    public partial class AllAssignment : LoginValidate
    {
        Teacher tea = new Teacher();
        Course course = new Course();
        List<Course> courseforteacher;
        CourseManager CourMan = new CourseManager();
        AssignmentManager AssignmentMan = new AssignmentManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Teacher")
            {
                Response.Write("<Script language='javascript'>alert('您无权访问此页面，请重新登录！');window.history.go(-1);</Script>");
                return;
            }

             //获取课程信息
            tea = (Teacher)Session["teacher"];

            courseforteacher = CourMan.GetCourseForTeacher(tea.username);
            Session["courselist"] = courseforteacher;

            foreach (var c in courseforteacher)
            {
                if (c.num == Request.QueryString["Coursenum"])
                {
                    course = c;
                    break;
                }
            }
            allassigncoursenameLabel.Text = course.name;
        }

        protected void AddAssignmentLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Assign.aspx?Coursenum=" + Request.QueryString["Coursenum"]);
        }


        protected void AllAssignmentGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int assignmentid = int.Parse(AllAssignmentGridView.DataKeys[e.RowIndex].Value.ToString());
            AssignmentMan.delete(assignmentid);
        }


    }
}