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
    public partial class admin : System.Web.UI.Page
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

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["admin"] = null;
            Session.Clear();
            FormsAuthentication.SignOut();
            Response.Redirect("Login.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Panel7.Visible = true;
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            AdminManager am=new AdminManager();
            Admin a=(Admin)Session["admin"];
            if (TextBox12.Text.ToString() == a.passwd)
            {
                if (TextBox13.Text.ToString() != null)
                {
                    a.passwd = TextBox14.Text.ToString();
                    if (am.Update(a))
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

        protected void Button9_Click(object sender, EventArgs e)
        {
            TextBox12.Text="";
            Panel7.Visible = false;
        }



    }
}