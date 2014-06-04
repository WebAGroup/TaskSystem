<%@ Page Title="" Language="C#" MasterPageFile="~/MainFrame.master" AutoEventWireup="true" CodeBehind="Check.aspx.cs" Inherits="TaskSystem.Check" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" style="margin-left: 250px" Height="16px" 
        Width="132px">
    作业学生答案
    </asp:Panel>
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
    <asp:Button ID="CheckSaveButton" runat="server" Text="保存" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="CheckQuitButton" runat="server" Text="取消" />
</asp:Content>
