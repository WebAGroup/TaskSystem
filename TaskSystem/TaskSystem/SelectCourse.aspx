﻿<%@ Page enableEventValidation="false" Title="" Language="C#" MasterPageFile="~/MainFrame.Master" AutoEventWireup="true" CodeBehind="SelectCourse.aspx.cs" Inherits="TaskSystem.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/Course_Select.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Course">
    选择教师：<asp:DropDownList ID="SelectTeachers" runat="server" 
            onselectedindexchanged="SelectTeachers_SelectedIndexChanged"> 
    </asp:DropDownList>
    选择课程：<asp:DropDownList ID="TeacherCourses" runat="server" 
            onselectedindexchanged="TeacherCourses_SelectedIndexChanged">
    </asp:DropDownList>
    <p>
        <asp:Label ID="LabelCourses" runat="server" Text="已选课程:"></asp:Label>
    </p>
    <p>
        <textarea rows="15" cols="100" id="ViewCourses" runat="Server"></textarea>
    </p>
    <asp:Button ID="submit" runat="server" Text="提交" onclick="submit_Click" />
    <asp:Button ID="reset" runat="server" Text="重置" onclick="reset_Click" />
</div>
</asp:Content>
