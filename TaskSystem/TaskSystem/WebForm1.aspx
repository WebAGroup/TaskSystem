<%@ Page Title="" Language="C#" MasterPageFile="~/MainFrame.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TaskSystem.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="js/nicEdit.js"></script>
    <script type="text/javascript">
        bkLib.onDomLoaded(function () { nicEditors.allTextAreas() });
    </script>
    <link rel="stylesheet" href="css/Homework_Submit.css"/>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">
        <label id="header_text">上载作业： 第三次作业 客户端技术  </label>
    </div>
    <div class="Control1">
        <button onclick="" id="back">返回</button>
        <button onclick="" id="save">保存为草稿</button>
        <input type="submit" value="提交" name="submit" id="submit"/>
    </div>

    <div class="homework">
        <p>1. Web是一种典型的分布式应用框架,请叙述服务器端动态Web页面的工作原理</p>
        <p>
            <textarea name="area1" cols="120" rows="15"></textarea>
        </p>
        <hr />
        <p>2. C#数据类型分为哪两大类,请叙述这两类数据的区别</p>
        <p>
            <textarea name="area2" cols="120" rows="15"></textarea>
        </p>
        <hr />
        <p>3. ASP.NET基本内置对象包括哪些,请分别综述其功能</p>
        <p>
            <textarea name="area3" cols="120" rows="15"></textarea>
        </p>
    </div>

    &nbsp;&nbsp;添加附件：<input type="file"/>
    <hr />

    <div class="Control2">
        <button onclick="" id="back2">返回</button>
        <button onclick="" id="save2">保存为草稿</button>
        <input type="submit" value="提交" name="submit2" id="submit2"/>
    </div>

</asp:Content>
