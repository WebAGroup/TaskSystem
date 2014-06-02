<%@ Page enableEventValidation="false" Title="" Language="C#" MasterPageFile="~/MainFrame.Master" AutoEventWireup="true" CodeBehind="SelectCourse.aspx.cs" Inherits="TaskSystem.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/Course_Select.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Course">
        <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="False" ForeColor="#0066FF" 
            Text="选择教师："></asp:Label>
        <asp:DropDownList ID="SelectTeachers" runat="server" 
            onselectedindexchanged="SelectTeachers_SelectedIndexChanged" 
            BackColor="White" ForeColor="#0066FF"> 
    </asp:DropDownList>
    &nbsp;
        <asp:Label ID="Label2" runat="server" ForeColor="#0066FF" Text="选择课程："></asp:Label>
        <asp:DropDownList ID="TeacherCourses" runat="server" 
            onselectedindexchanged="TeacherCourses_SelectedIndexChanged" 
            ForeColor="#0066FF">
    </asp:DropDownList>
    <p>
        <textarea rows="15" cols="100" id="ViewCourses" runat="Server" 
            style="background-color: #D9ECFF"></textarea>
    </p>
    <asp:Button ID="submit" runat="server" Text="提交" onclick="submit_Click" 
            Font-Bold="True" ForeColor="#0066FF" />
    <asp:Button ID="reset" runat="server" Text="重置" onclick="reset_Click" 
            Font-Bold="True" ForeColor="#0066FF" />
</div>
</asp:Content>
