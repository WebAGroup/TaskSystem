using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace TaskSystem
{
    public class LoginValidate : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            if (Session.Count == 0)
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}