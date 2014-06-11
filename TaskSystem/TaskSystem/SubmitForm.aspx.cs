using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskSystem.DataAccess;
using System.IO;

namespace TaskSystem
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        List<Answer> AnswerList = new List<Answer>();
        List<Problem> ProblemList = new List<Problem>();
        Accessory accessory = new Accessory();
        AccessoryManager AccessoryMan = new AccessoryManager();
        AnswerManager AnswerMan = new AnswerManager();
        Student stu = new Student();
        String id = string.Empty;
        bool submitFlag = true;

        protected void Page_Load(object sender, EventArgs e)
        {
            //获取作业id
            id = Request.QueryString["AssignmentId"];
            header_text.Text = Request.QueryString["AssignmentTitle"];
            ProblemManager ProblemMan = new ProblemManager();
            
            stu = (Student)Session["student"];
            ProblemList = ProblemMan.GetProblem(System.Int32.Parse(id));

            if (ProblemList.Count != 0)
            {
                //动态创建问题及回答区域
                //加载上次答案
                AnswerList = AnswerMan.GetAnswerList(stu.username, System.Int32.Parse(id));
                accessory = AccessoryMan.GetAccessory(stu.username, System.Int32.Parse(id));

                for (int i = 0; i < ProblemList.Count; i++)
                {
                    string pro = "<p>" + ProblemList[i].title + "</p>";
                    Control ct = ParseControl(pro);
                    PlaceHolder1.Controls.Add(ct);

                    string an = "<p><textarea cols='120' rows='15' name='TA' id='TA" + i + "'></textarea></p>";

                    //加载已有答案
                    if (AnswerList != null)
                    {
                        an = "<p><textarea cols='120' rows='15' name='TA' id='TA" + i + "'>" + AnswerList[i].content + "</textarea></p>";
                        submitFlag = false;
                    }

                    Control ct2 = ParseControl(an);
                    PlaceHolder1.Controls.Add(ct2);
                }

                /*加载已有附件
                if (accessory != null)
                {
                    Request.Files.
                }
                */
            }
            else
            {
                header_text.Text = "   逗你玩呢，哈哈哈哈。";
                submit.Enabled = false;
                submit2.Enabled = false;
                export.Enabled = false;
                export2.Enabled = false;
                fileTips.Enabled = false;
                FileUpload2.Enabled = false;
            }
            
        }

        protected void back2_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentMainForm.aspx");
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentMainForm.aspx");
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string[] content = Request.Form.GetValues("TA");
            for (int i = 0; i < ProblemList.Count; i++)
            {
                Answer answer = new Answer();
                answer.content = content[i];
                answer.student = stu.username;
                answer.problem = ProblemList[i].id;
                answer.score = (float)0.0;
                answer.comment = "no comment";
                answer.major = stu.major;
                answer.state = "2";
                if (AnswerList == null)
                {
                    AnswerList = new List<Answer>();
                }
                AnswerList.Add(answer);
            }

            if (submitFlag)
            {
                AnswerMan.AddAnswer(AnswerList);
                
                //string filePath = System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName;
                string filePath = FileUpload2.PostedFile.FileName;
                if (accessory == null)
                {
                    accessory = new Accessory();
                }
                accessory.adress = filePath;
                accessory.assignment = System.Int32.Parse(id);
                accessory.student = stu.username;
                AccessoryMan.Create(accessory);
            }
            else
            {
                AnswerMan.UpdateAnswer(AnswerList);
                //accessory = AccessoryMan.GetAccessory(stu.username, System.Int32.Parse(id));
            }
            Response.Redirect("StudentMainForm.aspx");
        }

        protected void submit2_Click(object sender, EventArgs e)
        {
            submit_Click(sender, e);
        }

        protected void export_Click(object sender, EventArgs e)
        {
            //Response.Write("<Script Language=JavaScript>alert('请先提交然后再点导出！');</Script>");
            Random rd = new Random();
            string fileName = DateTime.Now.ToString("yyyyMMddhhmm") + rd.Next() + ".doc";
            //存储路径
            string path = Server.MapPath(fileName);
            //创建字符输出流
            StreamWriter sw = new StreamWriter(path, true, System.Text.UnicodeEncoding.UTF8);

            string str = string.Empty;
            int len = Request.Form.GetValues("TA").Length;
            string[] content = Request.Form.GetValues("TA");
            //导出为word文档格式
            for (int i = 0; i < ProblemList.Count; i++)
            {
                str += ProblemList[i].title + "\r\n";
                Answer answer = new Answer();
                //Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "myJS3", "content=document.getElementById('TA" + i + "').value", true); 
                Response.Write("<Script Language=JavaScript>content=document.getElementById('TA" + i + "').value;</Script>");
                answer.content = content[i];
                AnswerList.Add(answer);
                str += AnswerList[i].content + "\r\n";
            }

            //写入
            sw.Write(str);
            sw.Close();
            Response.Clear();
            Response.Buffer = true;
            this.EnableViewState = false;
            Response.Charset = "utf-8";
            Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8));
            Response.ContentType = "application/octet-stream";
            Response.WriteFile(path);
            Response.Flush();
            Response.Close();
            Response.End();
        }

        protected void export2_Click(object sender, EventArgs e)
        {
            export_Click(sender, e);
        }

    }
}