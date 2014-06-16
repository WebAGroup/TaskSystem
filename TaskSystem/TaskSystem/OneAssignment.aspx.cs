﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskSystem.DataAccess;

namespace TaskSystem
{
    public partial class OneProblem : LoginValidate
    {
        ProblemManager ProMan = new ProblemManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Teacher")
            {
                Response.Write("<Script language='javascript'>alert('您无权访问此页面，请重新登录！');window.history.go(-1);</Script>");
                return;
            }

            AssignmentnumLabel.Text = Request.QueryString["Assignmentnum"].ToString();
        }

        protected void AddProLinkButton_Click(object sender, EventArgs e)
        {
            CheckAccessoryPanel.Visible = false;
            AProPanel.Visible = true;
        }

        protected void AProQuitButton_Click(object sender, EventArgs e)
        {
            AProPanel.Visible = false;
        }

        protected void AProSureButton_Click(object sender, EventArgs e)
        {
            Problem Apro = new Problem();
            Apro.assignment = int.Parse(Request.QueryString["Assignmentid"].ToString());
            Apro.title = AProtitleTextBox.Text;
            Apro.descrip = AProdescriTextBox.Text;
            Apro.score = float.Parse(scoreTextBox.Text);

            ProMan.create(Apro);
            Response.Redirect("OneAssignment.aspx?Assignmentid=" + Request.QueryString["Assignmentid"] + "&Assignmentnum=" + Request.QueryString["Assignmentnum"]);
        }


        protected void OneProblemGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int problemid = int.Parse(OneProblemGridView.DataKeys[e.RowIndex].Value.ToString());
            ProMan.DeleteProblem(problemid);
        }

        protected void CheckAccessoryLinkButton_Click(object sender, EventArgs e)
        {
            AProPanel.Visible = false;
            CheckAccessoryPanel.Visible = true;
        }

        protected void CloseLinkButton_Click(object sender, EventArgs e)
        {
            CheckAccessoryPanel.Visible = false;
        }
    }
}