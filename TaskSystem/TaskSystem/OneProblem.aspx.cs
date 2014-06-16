using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskSystem
{
    public partial class OneAssignment : LoginValidate
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Teacher")
            {
                Response.Write("<Script language='javascript'>alert('您无权访问此页面，请重新登录！');window.history.go(-1);</Script>");
                return;
            }
        }
    }
}