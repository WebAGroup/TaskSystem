using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskSystem.DataAccess;

namespace TaskSystem
{
    public partial class Check : LoginValidate
    {
        AnswerManager AnswerMan = new AnswerManager();
        List<Answer> answers = new List<Answer>();
        Answer oneAnswer = new Answer();
        ProblemManager ProMan = new ProblemManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Teacher")
            {
                Response.Write("<Script language='javascript'>alert('您无权访问此页面，请重新登录！');window.history.go(-1);</Script>");
                return;
            }

            //获取answer信息
            string student = Request.QueryString["student"];
            int problem = int.Parse(Request.QueryString["problem"]);

            //显示学生答案
            oneAnswer = AnswerMan.GetOneAnswer(student,problem);
            AnswerLabel.Text = oneAnswer.content;
            scoreLabel.Text = ProMan.GetProblemScore(problem).ToString();

            Session["oneAnswer"] = oneAnswer;
        }

        protected void CheckSaveButton_Click(object sender, EventArgs e)
        {
            if (scoreTextBox.Text == "")
            {
                scoreLabel2.Visible = false;
                scoreLabel1.Visible = true;
            }
            else
            {
                int problem = int.Parse(Request.QueryString["problem"]);
                float actualvalue = float.Parse(scoreTextBox.Text);
                float fullscore = ProMan.GetProblemScore(problem);
                if (actualvalue < 0 || actualvalue > fullscore)
                {
                    scoreLabel1.Visible = false;
                    scoreLabel2.Visible = true;
                }
                else
                {
                    oneAnswer = (Answer)Session["oneAnswer"];
                    oneAnswer.score = float.Parse(scoreTextBox.Text);
                    oneAnswer.comment = commentTextBox.Text;
                    oneAnswer.state = "1";

                    //批改作业
                    answers.Add(oneAnswer);
                    AnswerMan.UpdateAnswer(answers);

                    //获取该问题未批改的所有学生答案
                    List<Answer> nocheckanswers = AnswerMan.GetNoCheckAnswersofApro(int.Parse(Request.QueryString["problem"]));

                    if (nocheckanswers.Count != 0)//若有未批改学生作业，继续批改该题其他学生答案
                        Response.Redirect("Check.aspx?problem=" + nocheckanswers[0].problem + "&student=" + nocheckanswers[0].student);
                    else//若学生作业都批改完成，则跳回该问题查看所有学生成绩
                        Response.Redirect("OneProblem.aspx?problemid=" + Request.QueryString["problem"]);
                }
            }
        }

        protected void CheckQuitButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("OneProblem.aspx?problemid=" + Request.QueryString["problem"]);
        }
    }
}