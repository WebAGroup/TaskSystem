using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskSystem.DataAccess;
using System.Web.Security;

namespace TaskSystem
{
    public partial class admin : LoginValidate
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {

                String user = Request.QueryString["user"].ToString();
                Label7.Text = user + ",欢迎你";
            }
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            if (e.Item.Value == "管理学生")
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
                Panel3.Visible = false;
                Panel4.Visible = false;
                Panel5.Visible = false;
                Panel6.Visible = false;
                Panel7.Visible = false;
            }
            else if (Menu1.SelectedValue == "管理教师")
            {
                Panel2.Visible = true;
                Panel1.Visible = false;
                Panel3.Visible = false;
                Panel4.Visible = false;
                Panel5.Visible = false;
                Panel6.Visible = false;
                Panel7.Visible = false;
            }
            else if (Menu1.SelectedValue == "课程")
            {
                Panel3.Visible = true;
                Panel2.Visible = false;
                Panel1.Visible = false;
                Panel4.Visible = false;
                Panel5.Visible = false;
                Panel6.Visible = false;
                Panel7.Visible = false;
            }
            else if (Menu1.SelectedValue == "作业")
            {
                Panel4.Visible = true;
                Panel2.Visible = false;
                Panel3.Visible = false;
                Panel1.Visible = false;
                Panel5.Visible = false;
                Panel6.Visible = false;
                Panel7.Visible = false;
            }
            else if (Menu1.SelectedValue == "问题")
            {
                Panel5.Visible = true;
                Panel2.Visible = false;
                Panel3.Visible = false;
                Panel4.Visible = false;
                Panel1.Visible = false;
                Panel6.Visible = false;
                Panel7.Visible = false;
            }
            else if (Menu1.SelectedValue == "答案")
            {
                Panel6.Visible = true;
                Panel2.Visible = false;
                Panel3.Visible = false;
                Panel4.Visible = false;
                Panel5.Visible = false;
                Panel1.Visible = false;
                Panel7.Visible = false;
            }
            else
            {
                Panel1.Visible = false;
                Panel2.Visible = false;
                Panel3.Visible = false;
                Panel4.Visible = false;
                Panel5.Visible = false;
                Panel6.Visible = false;
                Panel7.Visible = false;
            }

        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
                GridView1.DataSourceID = "";
            GridView1.DataBind();
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {

            GridView1.DataSourceID = "LinqDataSource1";
            GridView1.DataBind();
        }

        protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            GridView1.DataSourceID = "LinqDataSource1";
            GridView1.DataBind();
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
                GridView2.DataSourceID = "";
            GridView2.DataBind();
        }

        protected void DetailsView2_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            GridView2.DataSourceID = "LinqDataSource2";
            GridView2.DataBind();
        }

        protected void DetailsView2_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView2.DataSourceID = "LinqDataSource2";
            GridView2.DataBind();
        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
                GridView3.DataSourceID = "";
            GridView3.DataBind();
        }

        protected void DetailsView3_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            GridView3.DataSourceID = "LinqDataSource3";
            GridView3.DataBind();
        }

        protected void DetailsView3_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView3.DataSourceID = "LinqDataSource3";
            GridView3.DataBind();
        }

        protected void GridView4_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
                GridView4.DataSourceID = "";
            GridView4.DataBind();
        }

        protected void DetailsView4_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            GridView4.DataSourceID = "LinqDataSource4";
            GridView4.DataBind();
        }

        protected void DetailsView4_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView4.DataSourceID = "LinqDataSource4";
            GridView4.DataBind();
        }

        protected void GridView5_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
                GridView5.DataSourceID = "";
            GridView5.DataBind();
        }

        protected void DetailsView5_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            GridView5.DataSourceID = "LinqDataSource5";
            GridView5.DataBind();
        }

        protected void DetailsView5_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView5.DataSourceID = "LinqDataSource5";
            GridView5.DataBind();
        }

        protected void GridView6_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
                GridView6.DataSourceID = "";
            GridView6.DataBind();
        }

        protected void DetailsView7_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            GridView6.DataSourceID = "LinqDataSource6";
            GridView6.DataBind();
        }

        protected void DetailsView7_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {

            GridView6.DataSourceID = "LinqDataSource6";
            GridView6.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)        //注销
        {
            Session["admin"] = null;
            Session.Clear();
            FormsAuthentication.SignOut();
            Response.Redirect("Login.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)           //"修改密码"按钮响应函数
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = false;
            Panel6.Visible = false;
            Panel7.Visible = true;
        }


        //修改密码
        protected void Button8_Click(object sender, EventArgs e)                //更新密码
        {
            AdminManager am = new AdminManager();
            Admin a = (Admin)Session["admin"];
            if (TextBox12.Text.ToString() == a.passwd)          //原密码是否正确
            {
                if (TextBox13.Text.ToString() != null)
                {
                    a.passwd = TextBox14.Text.ToString();
                    if (am.Update(a))                       //更新新密码
                        Response.Write("<Script Language=JavaScript>alert('修改成功，请重新登录！');</Script>");
                }
                else
                    Response.Write("<Script Language=JavaScript>alert('密码不能为空');</Script>");
            }
            else
            {
                Response.Write("<Script Language=JavaScript>alert('原密码错误，请重试！');</Script>");
                TextBox12.Text = "";
            }
        }

        protected void Button9_Click(object sender, EventArgs e)        //取消密码更改
        {
            TextBox12.Text = "";
            Panel7.Visible = false;
        }


        //删除时弹框提示

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)        //Student表删除时弹框提示
        {
            //如果是绑定数据行 
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                {
                    ((LinkButton)e.Row.Cells[5].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除:" + e.Row.Cells[0].Text + "吗?')");
                }
            }

        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)        //teacher表删除时弹框提示
        {
            //如果是绑定数据行 
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                {
                    ((LinkButton)e.Row.Cells[4].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除:" + e.Row.Cells[0].Text + "吗?')");
                }
            }
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)        //Course表删除时弹框提示
        {
            //如果是绑定数据行 
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                {
                    ((LinkButton)e.Row.Cells[6].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除:" + e.Row.Cells[0].Text + "吗?')");
                }
            }
        }

        protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)            //assignment表删除时弹框提示
        {
            //如果是绑定数据行 
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[3].Style.Add("word-break", "break-all");
                if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                {
                    ((LinkButton)e.Row.Cells[9].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除:" + e.Row.Cells[0].Text + "吗?')");
                }
            }

        }

        protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)        //Problem表删除时弹框提示
        {
            //如果是绑定数据行 
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                {
                    ((LinkButton)e.Row.Cells[6].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除:" + e.Row.Cells[0].Text + "吗?')");
                }
            }
        }

        protected void GridView6_RowDataBound(object sender, GridViewRowEventArgs e)        //answer表删除时弹框提示
        {
            //如果是绑定数据行 
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                {
                    ((LinkButton)e.Row.Cells[8].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除:" + e.Row.Cells[0].Text + "吗?')");
                }
            }
        }


        //插入判断
        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)      //student插入判断
        {
            StudentManager stu = new StudentManager();

           if (e.Values["username"] == null || e.Values["passwd"] == null || e.Values["name"] == null || e.Values["major"] == null)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(UpdatePanel1,this.GetType(), "msg1", "alert('插入失败！user表中字段不能为空');", true);
                e.Cancel = true;
                return;
            }
           if (stu.GetStudent(e.Values["username"].ToString()) != null)
            {
              ScriptManager.RegisterClientScriptBlock (UpdatePanel1, this.GetType(), "msg1", "alert('插入失败！user表中usrname字段已存在');", true);
                e.Cancel = true;
                return;
            }
        }

        protected void DetailsView2_ItemInserting(object sender, DetailsViewInsertEventArgs e)      //teacher 插入判断
        {
            TeacherManager teacher = new TeacherManager();
            if (e.Values["username"] == null || e.Values["passwd"] == null || e.Values["name"] == null )
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "msg1", "alert('插入失败！teacher表中字段都不能为空');", true);
                e.Cancel = true;
                return;
            }
            else if (teacher.GetTeacher(e.Values["username"].ToString()) != null)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "msg1", "alert('插入失败！teacher表中该usrname已存在');", true);
                e.Cancel = true;
                return;
            }

        }

        protected void DetailsView3_ItemInserting(object sender, DetailsViewInsertEventArgs e)      //course 插入判断
        {
            CourseManager course = new CourseManager();
            TeacherManager t = new TeacherManager();
            if (e.Values["num"] == null || e.Values["teacher"] == null || e.Values["name"] == null)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "msg1", "alert('插入失败！course表中num,teacher,name字段都不能为空');", true);
                e.Cancel = true;
                return;
            }
            if (course.GetCourseByNum(e.Values["num"].ToString()) != null)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "msg1", "alert('插入失败！course表中num已存在');", true);
                e.Cancel = true;
                return;
            }

            if (t.GetTeacher(e.Values["teacher"].ToString())==null)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "msg1", "alert('插入失败！course表中外键teacher不存在');", true);
                e.Cancel = true;
                return;
            }

        }

        protected void DetailsView4_ItemInserting(object sender, DetailsViewInsertEventArgs e)      //assignment表插入判断
        {
            CourseManager course = new CourseManager();
            if (e.Values["course"] == null || e.Values["major"] == null)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "msg1", "alert('插入失败！assignment表中course,major字段不能为空');", true);
                e.Cancel = true;
                return;
            }

            if (course.GetCourseByNum(e.Values["num"].ToString()) == null)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "msg1", "alert('插入失败！assignment表中外键num不存在');", true);
                e.Cancel = true;
                return;
            }
        }

        protected void DetailsView5_ItemInserting(object sender, DetailsViewInsertEventArgs e)      //Problem表插入判断
        {
            AssignmentManager a = new AssignmentManager();
            if (e.Values["assignment"] == null)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "msg1", "alert('插入失败！Problem表中assignment字段不能为空');", true);
                e.Cancel = true;
                return;

            }
            if (a.GetAssignmentByNum(int.Parse(e.Values["assignment"].ToString())) == null)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "msg1", "alert('插入失败！Problem表中外键assignment字段不存在');", true);
                e.Cancel = true;
                return;
            }
        }

        protected void DetailsView7_ItemInserting(object sender, DetailsViewInsertEventArgs e)         //answer表插入判断
        {
            StudentManager stu = new StudentManager();
            ProblemManager p = new ProblemManager();
            if (e.Values["student"] == null || e.Values["problem"] == null)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "msg1", "alert('插入失败！answer表中Student，prob字段不能为空');", true);
                e.Cancel = true;
                return;
            }
            if (stu.GetStudent(e.Values["student"].ToString()) == null)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "msg1", "alert('插入失败！answer表中外键student字段不存在');", true);
                e.Cancel = true;
                return;
            }
            if(p.GetProblemById(int.Parse(e.Values["problem"].ToString()))==null)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "msg1", "alert('插入失败！answer表中外键problem字段不存在');", true);
                e.Cancel = true;
                return;
            }

        }

      

    }
}