<%@ Page EnableEventValidation="false" ValidateRequest="false" Title="" Language="C#" MasterPageFile="~/MainFrame.Master" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="TaskSystem.AddCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/Assignment.css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div style="float:right">
        <asp:Button ID="AddCourseButton" runat="server" Text="添加课程" 
            onclick="AddCourseButton_Click" class="AddCourseButton"/>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="DeleteCourseButton" runat="server" Text="删除课程" 
            onclick="DeleteCourseButton_Click" class="DeleteCourseButton"/>
    </div>
   <br /><br />
    <asp:Panel ID="AddCoursePanel" runat="server" class="assignFrame" 
        Visible="False" style="margin-left: 331px" Width="265px">
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="CoursenumLabel" runat="server" style="color: #FF0000" 
            Text="课程编号不能为空！" Visible="False"></asp:Label>
        <br />
    课程编号:<asp:TextBox ID="cournumTextBox" runat="server"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="CoursenameLabel" runat="server" style="color: #FF0000" 
            Text="课程名不能为空！" Visible="False"></asp:Label>
        <br />
        课程名称:<asp:TextBox ID="cournameTextBox" runat="server"></asp:TextBox>
        <br />
        <br />
        开课时间:<asp:TextBox ID="courstart_timeTextBox" runat="server" TextMode="Date"></asp:TextBox>
        <br />
        <br />
        截课时间:<asp:TextBox ID="courend_timeTextBox" runat="server" TextMode="Date"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="AddCourseSureButton" runat="server" 
            onclick="AddCourseSureButton_Click" Text="确定" class="AddButton"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="AddCourseQuitButton" runat="server" Text="取消" 
            onclick="AddCourseQuitButton_Click" class="DeleteButton"/>
    </asp:Panel>

    <asp:Panel ID="DeletePanel" runat="server" class="assignFrame" Visible="False" 
        style="margin-left: 333px" Width="260px">
    课程编号:<asp:TextBox ID="dcnumTextBox" runat="server" AutoPostBack="True" 
            ontextchanged="dcnumTextBox_TextChanged"></asp:TextBox>
        <br />
        <br />
    课程名称:<asp:TextBox ID="dcnameTextBox" runat="server" AutoPostBack="True" 
            ontextchanged="dcnameTextBox_TextChanged"></asp:TextBox>
        <br />
        <br />
    开课时间:<asp:Label ID="dcstart_timeLabel" runat="server"></asp:Label>
        <br />
        <br />
    截课时间:<asp:Label ID="dcend_timeLabel" runat="server"></asp:Label>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="DeleteCourseSureButton" runat="server" 
            onclick="DeleteCourseSureButton_Click" Text="确定" class="AddButton"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="DeleteCourseQuitButton" runat="server" Text="取消" 
            onclick="DeleteCourseQuitButton_Click" class="DeleteButton"/>
    </asp:Panel>

</asp:Content>
