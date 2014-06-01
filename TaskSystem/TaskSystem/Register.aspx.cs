using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskSystem.DataAccess;

namespace TaskSystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected string Action = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request.Form["name"]) && !string.IsNullOrEmpty(Request.Form["password"]))//获取form中的参数
                {
                    string UserName = Request.Form["name"].ToString();
                    string UserPassword = Request.Form["password"].ToString();
                    string Identity = Request["status"];
                    string Major = Request["account"];

                    if (Identity == student.ID)
                    {
                        StudentManager StudentMan = new StudentManager();
                        Student stu = new Student();

                        stu.username = UserName;
                        stu.passwd = UserPassword;
                        stu.name = UserName;
                        if (Major == null)
                        {
                            Major = string.Empty;
                        }
                        stu.major = Major;
                        //stu.grade = string.Empty;
                        StudentMan.AddStudent(stu);
                        Session["student"] = stu;
                        Response.Redirect("StudentMainForm.aspx");
                    }

                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}