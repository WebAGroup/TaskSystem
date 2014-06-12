using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskSystem.DataAccess;

namespace TaskSystem
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        CourseManager CourseMan = new CourseManager();
        List<Course> CourseList = new List<Course>();
        TeacherManager TeacherMan = new TeacherManager();
        List<Teacher> TeacherList = new List<Teacher>();
        Student stu = new Student();
        //String SelectedCourses = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            stu = (Student)Session["student"];
            //CourseList = (List<Course>)Session["CourseList"];
            ViewCourses.Value = string.Empty;
            if (!IsPostBack)   //首次加载时
            {
                SelectTeachers.AutoPostBack = true;
                TeacherCourses.AutoPostBack = true;
                initTeachersList();
                ViewCourses.Value = string.Empty;
            }
        }

        protected void initTeachersList()
        {
            SelectTeachers.Items.Clear();
            TeacherList = TeacherMan.GetAllTeacher();
            SelectTeachers.Items.Add("下拉选择");
            foreach (Teacher teacher in TeacherList)
            {
                SelectTeachers.Items.Add(teacher.username);
            }
        }

        protected void reset_Click(object sender, EventArgs e)
        {
            ViewCourses.Value = string.Empty;
            CourseList = (List<Course>)Session["CourseList"];
            CourseList.Clear();
            Session["CourseList"] = CourseList;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            CourseList = CourseMan.GetCourseForStudent(stu.username);
            List<Course> Courses = CourseList = (List<Course>)Session["CourseList"];
            foreach (Course course in Courses)
            {
                CourseMan.ChooseCourse(stu.username, course.num);
            }
            //CourseList.Add()
            
            Response.Redirect("StudentMainForm.aspx");
        }

        //选择老师后的响应
        protected void SelectTeachers_SelectedIndexChanged(object sender, EventArgs e)
        {
            TeacherCourses.Items.Clear();
            string teachername = SelectTeachers.SelectedItem.Text;
            CourseList = CourseMan.GetCourseForTeacher(teachername);
            TeacherCourses.Items.Add("下拉选择");
            foreach (Course course in CourseList)
            {
                TeacherCourses.Items.Add(course.name);
            }
            //CourseList = (List<Course>)Session["CourseList"];
            CourseList.Clear();
            CourseList = (List<Course>)Session["CourseList"];
            if (CourseList != null)
            {
                foreach (Course course in CourseList)
                {
                    ViewCourses.Value += course.name + "(" + course.teacher + ")   ";
                }
            }
        }

        //选择老师对应课程后的响应
        protected void TeacherCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            //SelectedCourses += TeacherCourses.SelectedValue.ToString() + "(" + SelectTeachers.SelectedValue.ToString() + ")    ";
            CourseList = (List<Course>)Session["CourseList"];
            Course co = CourseMan.GetOneCourse(SelectTeachers.SelectedItem.Text, TeacherCourses.SelectedValue.ToString());
            List<string> CourseNum = new List<string>();
            foreach (Course cou in CourseList)
            {
                CourseNum.Add(cou.num);
            }
            if (!CourseNum.Contains(co.num))
            {
                CourseList.Add(co);
            }
            Session["CourseList"] = CourseList;

            foreach (Course course in CourseList)
            {
                ViewCourses.Value += course.name + "(" + course.teacher + ")   ";
            }
        }

        
    }
}