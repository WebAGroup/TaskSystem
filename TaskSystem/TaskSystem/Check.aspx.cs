using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskSystem.DataAccess;

namespace TaskSystem
{
    public partial class Check : System.Web.UI.Page
    {
        AnswerManager AnswerMan = new AnswerManager();
        List<Answer> answers = new List<Answer>();
        Answer oneAnswer = new Answer();

        protected void Page_Load(object sender, EventArgs e)
        {
            //获取answer信息
            string student = Request.QueryString["student"];
            int problem = int.Parse(Request.QueryString["problem"]);
            //显示学生答案
            oneAnswer = AnswerMan.GetOneAnswer(student,problem);
            AnswerLabel.Text = oneAnswer.content;

            Session["oneAnswer"] = oneAnswer;
        }

        protected void CheckSaveButton_Click(object sender, EventArgs e)
        {
            oneAnswer = (Answer)Session["oneAnswer"];
            oneAnswer.score = float.Parse(scoreTextBox.Text);
            oneAnswer.comment = commentTextBox.Text;
            oneAnswer.state = "1";

            //批改作业
            answers.Add(oneAnswer);
            AnswerMan.UpdateAnswer(answers);
            Response.Redirect("OneProblem.aspx?problemid=" + Request.QueryString["problem"]);
        }

        protected void CheckQuitButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("OneProblem.aspx?problemid=" + Request.QueryString["problem"]);
        }
    }
}