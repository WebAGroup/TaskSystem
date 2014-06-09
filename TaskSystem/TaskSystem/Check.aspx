<%@ Page Title="" Language="C#" MasterPageFile="~/MainFrame.master" AutoEventWireup="true" CodeBehind="Check.aspx.cs" Inherits="TaskSystem.Check" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/Assignment.css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:Label ID="AnswerLabel" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <br />
    评分：<asp:TextBox ID="scoreTextBox" runat="server" Width="98px"></asp:TextBox>
    <br />
    <br />
    评语： 
    <asp:TextBox ID="commentTextBox" runat="server" Height="66px" TextMode="MultiLine" 
        Width="291px"></asp:TextBox>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="CheckSaveButton" runat="server" Text="保存" 
        onclick="CheckSaveButton_Click" class="AddButton"/>
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="CheckQuitButton" runat="server" Text="取消" 
        onclick="CheckQuitButton_Click" class="DeleteButton"/>
</asp:Content>
