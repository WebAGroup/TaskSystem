using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskSystem.DataAccess;
using System.Collections;

namespace TaskSystem
{
    public partial class WebForm2 : LoginValidate
    {
        Student stu = new Student();
        protected ArrayList myArray = new ArrayList();
        protected ArrayList myArray2 = new ArrayList();
        AssignmentManager AssignmentMan = new AssignmentManager();
        protected List<Assignment> AssignmentList = new List<Assignment>();

        protected void Page_Load(object sender, EventArgs e)
        {
            CourseManager CourseMan = new CourseManager();
            List<Course> CourseList = new List<Course>();

            SystemTime.Text = DateTime.Now.ToLongDateString() + " " + DateTime.Now.ToShortTimeString();
            stu = (Student)Session["student"];
            CourseList = CourseMan.GetCourseForStudent(stu.username);
            Session["CourseList"] = CourseList;
            if (CourseList.Count == 0)
                Response.Redirect("SelectCourse.aspx");

            foreach (Course course in CourseList)
            {
                AssignmentList.AddRange(AssignmentMan.getAssignment(course.num));
            }
            if (!IsPostBack)
            {
                GridView3.DataBind();

                foreach (Assignment assignment in AssignmentList)
                {
                    TimeSpan ts = Convert.ToDateTime(assignment.end_time) - DateTime.Now;
                    if ((assignment.end_time > DateTime.Now) && (ts.Days < 1))
                    {
                        myArray.Add(assignment);
                    }

                    TimeSpan ts2 = DateTime.Now - Convert.ToDateTime(assignment.start_time);
                    if ((assignment.start_time < DateTime.Now) && (ts2.Days < 7))
                    {
                        myArray2.Add(assignment);
                    }
                }
                GridView2.DataBind();
                GridView1.DataBind();
            }
        }
    }
}