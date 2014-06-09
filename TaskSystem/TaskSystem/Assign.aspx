<%@ Page Title="" Language="C#" MasterPageFile="~/MainFrame.master" AutoEventWireup="true" CodeBehind="Assign.aspx.cs" Inherits="TaskSystem.Assign" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/Assignment.css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="AssignTitlePanel" runat="server" class="assignFrame">
        课程：<asp:Label ID="coursenameLabel" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
    作业标题：<asp:TextBox ID="assigntitleTextBox" runat="server"></asp:TextBox>
        <br />
        <br />
    截止日期：<asp:TextBox ID="datelineTextBox" runat="server"></asp:TextBox>
        <br />
        <br />
    作业说明：<asp:TextBox ID="assigndescriTextBox" runat="server" Height="62px" 
            TextMode="MultiLine" Width="238px"></asp:TextBox><br />
        <asp:Button ID="AssignSureButton" runat="server" Text="确定" 
            onclick="AssignSureButton_Click" class="AddButton"/>
        <asp:Button ID="AssignQuitButton" runat="server" Text="取消" 
            onclick="AssignQuitButton_Click" class="DeleteButton"/>
    </asp:Panel><br />
    <asp:Panel ID="ProblemsPanel" runat="server" Visible="False" class="buttonFrame" Height="708px">
    <asp:Button ID="AddPro" runat="server" Text="增加" onclick="AddPro_Click" class="AddButton"/>
    <asp:Button ID="UpdatePro" runat="server" Text="修改" onclick="UpdatePro_Click" class="AddButton"/>
    <asp:Button ID="DeletePro" runat="server" Text="删除" onclick="DeletePro_Click" class="DeleteButton"/>
        <br />
         <p style="text-align: center; color: #0066FF">
        <asp:Label ID="assignmentcourseLabel" runat="server" 
                 style="text-align: center; font-weight: 700;" Text="Label"></asp:Label>
        </p>
        <p style="text-align: left; color: #0066FF">
        <asp:Label ID="assignmentLabel" runat="server" style="text-align: center" Text="Label"></asp:Label>
        </p>
        <br />
        <asp:RadioButtonList ID="SelectProRadioButtonList" runat="server" 
            ondatabinding="Page_Load">
        </asp:RadioButtonList>
        <br />
        <asp:Panel ID="AProPanel" runat="server" class="assignFrame">
            标题：<asp:TextBox ID="AProtitleTextBox" runat="server" Height="29px" TextMode="MultiLine" 
                Width="263px"></asp:TextBox>
            <br />
            <br />
            说明：<asp:TextBox ID="AProdescriTextBox" runat="server" Height="68px" TextMode="MultiLine" 
                Width="262px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="AProSureButton" runat="server"  Text="确定" 
                onclick="AProSureButton_Click" class="AddButton"/>
            <asp:Button ID="AProQuitButton" runat="server" Text="取消" 
                onclick="AProQuitButton_Click" class="DeleteButton"/>
        </asp:Panel>
         <asp:Panel ID="UpdateAProPanel" runat="server" class="assignFrame">
            标题：<asp:TextBox ID="UpdateAProtitleTextBox" runat="server" Height="29px" TextMode="MultiLine" 
                Width="263px"></asp:TextBox>
            <br />
            <br />
            说明：<asp:TextBox ID="UpdateAProdescriTextBox" runat="server" Height="68px" TextMode="MultiLine" 
                Width="262px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="UpdateAProSureButton" runat="server"  Text="确定" 
                 onclick="UpdateAProSureButton_Click" class="AddButton"/>
            <asp:Button ID="UpdateAProQuitButton" runat="server" Text="取消" 
                 onclick="UpdateAProQuitButton_Click" class="DeleteButton"/>
        </asp:Panel>
        <asp:Button ID="ProblemsSaveButton" runat="server" Text="保存" 
            onclick="ProblemsSaveButton_Click" class="AddButton"/>
        <asp:Button ID="ProblemsQuitButton" runat="server" Text="取消" 
            onclick="ProblemsQuitButton_Click" class="DeleteButton"/>
    </asp:Panel>
</asp:Content>
