using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskSystem.DataAccess;

namespace TaskSystem
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        Student stu = new Student();

        protected void Page_Load(object sender, EventArgs e)
        {
            CourseManager CourseMan = new CourseManager();
            List<Course> CourseList = new List<Course>();

            stu = (Student)Session["student"];
            CourseList = CourseMan.GetCourseForStudent(stu.username);
            Session["CourseList"] = CourseList;
            if (CourseList.Count == 0)
                Response.Redirect("SelectCourse.aspx");
        }
    }
}