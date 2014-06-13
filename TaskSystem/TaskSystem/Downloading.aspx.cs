using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace TaskSystem
{
    public partial class Downloading : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strfid = Request.QueryString[0].ToString();
            if (File.Exists(strfid))
            {
                FileInfo DownloadFile = new FileInfo(strfid);
                System.Web.HttpContext.Current.Response.Clear();
                System.Web.HttpContext.Current.Response.ClearHeaders();
                System.Web.HttpContext.Current.Response.Buffer = false;
                System.Web.HttpContext.Current.Response.ContentType = "application/octet-stream";
                System.Web.HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(DownloadFile.Name, System.Text.Encoding.UTF8));
                System.Web.HttpContext.Current.Response.AppendHeader("Content-Length", DownloadFile.FullName.Length.ToString());
                System.Web.HttpContext.Current.Response.WriteFile(DownloadFile.FullName);
                System.Web.HttpContext.Current.Response.Flush();
            }
            else
            {
                throw new Exception("提示:下载失败,找不到该文件");
            } 
        }
    }
}