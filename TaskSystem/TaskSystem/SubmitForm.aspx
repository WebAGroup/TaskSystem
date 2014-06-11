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
    <!--  
        <label id="header_text">上载作业： 第三次作业 客户端技术   </label>
    -->
        <asp:Label ID="header_text" runat="server" Text="上载作业： 第三次作业 客户端技术   "></asp:Label>
    </div>
    <div class="Control1" id="Control1" runat="server">
        <asp:Button ID="back" runat="server" Text="返回" onclick="back_Click"/>
        <asp:Button ID="export" runat="server" Text="作业导出" onclick="export_Click"/>
        <asp:Button ID="submit" runat="server" Text="提交" onclick="submit_Click" />
    </div>

    <div class="homework" id="PlaceHolder1" runat="server">
    </div>

    &nbsp;&nbsp;<!-- <input type="file" runat="Server" id="file" name="file"/> -->
    <asp:Label ID="fileTips" runat="server" Text="添加附件："></asp:Label>
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
