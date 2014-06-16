using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskSystem.DataAccess;

namespace TaskSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected string Action = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Action"]))//获取form的Action中的参数
                {
                    Action = Request.QueryString["Action"].Trim().ToLower();//去掉空格并变小写
                }
                switch (Action)
                {
                    case "login":
                        if (!string.IsNullOrEmpty(Request.Form["TxtUserName"]) && !string.IsNullOrEmpty(Request.Form["TxtPassword"]))//获取form中的参数
                        {
                            string UserName = Request.Form["TxtUserName"].ToString();
                            string UserPassword = Request.Form["TxtPassword"].ToString();
                            string Identity = Request.Form["DropExpiration"].ToString();
                            StudentManager StudentMan = new StudentManager();
                            TeacherManager TeacherMan = new TeacherManager();
                            AdminManager AdminMan = new AdminManager();

                            try
                            {
                                if (Identity.Equals("student"))
                                {
                                    if (UserPassword != StudentMan.GetStudent(UserName).passwd)
                                    {
                                        Response.Write("<Script Language=JavaScript>alert('密码或用户名错误，请重试！');</Script>");
                                    }
                                    else
                                    {
                                        Session["UserRole"] = "Student";
                                        Session["student"] = StudentMan.GetStudent(UserName);
                                        Response.Redirect("StudentMainForm.aspx");
                                    }
                                }

                                else if (Identity.Equals("teacher"))
                                {
                                    if (UserPassword != TeacherMan.GetTeacher(UserName).passwd)
                                    {
                                        Response.Write("<Script Language=JavaScript>alert('密码或用户名错误，请重试！');</Script>");
                                    }
                                    else
                                    {
                                        Session["UserRole"] = "Teacher";
                                        Session["teacher"] = TeacherMan.GetTeacher(UserName);
                                        Response.Redirect("AddCourse.aspx");
                                    }
                                }

                                else if (Identity.Equals("admin"))
                                {
                                    if (UserPassword != AdminMan.GetAdmin(UserName).passwd)
                                    {
                                        Response.Write("<Script Language=JavaScript>alert('密码或用户名错误，请重试！');</Script>");
                                    }
                                    else
                                    {
                                        Session["UserRole"] = "Admin";
                                        Session["admin"] = AdminMan.GetAdmin(UserName);
                                        Response.Redirect("admin.aspx?user=" + UserName);
                                    }
                                }
                            }
                            catch (System.Exception ex)
                            {
                                Response.Write("<Script Language=JavaScript>alert('错误的身份选择！');</Script>");
                            }

                        }
                        break;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}