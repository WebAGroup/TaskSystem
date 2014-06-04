using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskSystem.DataAccess;

namespace TaskSystem
{
    public partial class MainFrame : System.Web.UI.MasterPage
    {
        Student stu = new Student();
        Teacher tea = new Teacher();
        //bool firstNodeExpandFlag = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 0)
            {   
                Response.Redirect("Login.aspx");
                //Response.Write("<Script Language=JavaScript>alert('会话已过期，请重新登录！');</Script>");
            }
            else
            {
                foreach (string str in Session.Keys)
                {
                    if (str.Equals("student"))
                    {
                        stu = (Student)Session["student"];
                        welcome.Text = "欢迎" + stu.username;
                        initTreeView();
                    }
                    else if (str.Equals("teacher"))
                    {
                        tea = (Teacher)Session["teacher"];
                        welcome.Text = "欢迎您，" + tea.username;
                        initTeacherTreeView();
                    }
                }
                
            }

            
        }

        protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
        {
            
        }

        protected void log_out_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
        }

        protected void initTeacherTreeView()
        {
            CourseManager CourseMan = new CourseManager();
            List<Course> CourseList = new List<Course>();
            CourseList = CourseMan.GetCourseForTeacher(tea.username);

            TreeView1.Nodes.Clear();
            TreeNode mycourse = new TreeNode();
            mycourse.Text = "我的课程";
            mycourse.NavigateUrl = "AddCourse.aspx";

            //设置TreeView的节点，未截止的课程
            foreach (Course course in CourseList)
            {
                if (DateTime.Now < course.end_time)
                {
                    TreeNode node = new TreeNode();
                    node.Text = course.name;
                    node.NavigateUrl = "AllAssignment.aspx?Coursenum=" + course.num;
                    mycourse.ChildNodes.Add(node);
                }
            }
            TreeView1.Nodes.Add(mycourse);
            TreeView1.ExpandAll();

        }

        protected void initTreeView()
        {
            CourseManager CourseMan = new CourseManager();
            AssignmentManager assignmentMan = new AssignmentManager();
            List<Course> CourseList = new List<Course>();
            List<Assignment> assignmentList = new List<Assignment>();
            
            TreeView1.Nodes.Clear();
            CourseList = CourseMan.GetCourseForStudent(stu.username);
            //设置TreeView的节点，包括课程和相应作业
            foreach (Course course in CourseList)
            {
                TreeNode node = new TreeNode();
                node.Text = course.name;
                TreeView1.Nodes.Add(node);

                assignmentList = assignmentMan.getAssignment(course.num);
                foreach (Assignment assignment in assignmentList)
                {
                    //未截止
                    if (DateTime.Now < assignment.end_time)
                    {
                        TreeNode NodeChild = new TreeNode();
                        NodeChild.Text = assignment.title;
                        node.ChildNodes.Add(NodeChild);
                        NodeChild.NavigateUrl = "SubmitForm.aspx?AssignmentId=" + assignment.id;
                    }
                }
/*
                TreeView1.Nodes[0].Expanded = firstNodeExpandFlag;
                TreeView1.Nodes[0].Select();
*/
            }

        }

        protected void TreeView1_SelectedNodeChanged1(object sender, EventArgs e)
        {
            TreeView1.SelectedNode.SelectAction = System.Web.UI.WebControls.TreeNodeSelectAction.Expand;
        }


    }
}