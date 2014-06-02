<%@ Page EnableEventValidation="false" ValidateRequest="false"  Title="" Language="C#" CodeBehind="SubmitForm.aspx.cs" MasterPageFile="~/MainFrame.Master" Inherits="TaskSystem.WebForm1" %>
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
    <div class="Control1" id="Control1" runat="server">
        <asp:Button ID="back" runat="server" Text="返回" onclick="back_Click"/>
        <asp:Button ID="export" runat="server" Text="作业导出" onclick="export_Click"/>
        <asp:Button ID="submit" runat="server" Text="提交" onclick="submit_Click" />
    </div>

    <div class="homework" id="PlaceHolder1" runat="server">
<!-- 
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
 -->
    </div>

    &nbsp;&nbsp;添加附件：<!-- <input type="file" runat="Server" id="file" name="file"/> -->
    <asp:FileUpload ID="FileUpload2" runat="server" />
    <hr />
<!-- 
    <asp:FileUpload ID="FileUpload1" runat="server" />
 -->
    <div class="Control2" id="Control2" runat="server">
        <asp:Button ID="back2" runat="server" Text="返回" onclick="back2_Click" />
        <asp:Button ID="export2" runat="server" Text="作业导出" onclick="export2_Click"/>
        <asp:Button ID="submit2" runat="server" Text="提交" onclick="submit2_Click" />
    </div>

</asp:Content>
