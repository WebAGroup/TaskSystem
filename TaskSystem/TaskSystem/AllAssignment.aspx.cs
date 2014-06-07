using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskSystem.DataAccess;

namespace TaskSystem
{
    public partial class AllAssignment : System.Web.UI.Page
    {
        Teacher tea = new Teacher();
        Course course = new Course();
        List<Course> courseforteacher;
        CourseManager CourMan = new CourseManager();
        AssignmentManager AssignmentMan = new AssignmentManager();

        protected void Page_Load(object sender, EventArgs e)
        {
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