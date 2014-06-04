<%@ Page Title="" Language="C#" MasterPageFile="~/MainFrame.master" AutoEventWireup="true" CodeBehind="Assign.aspx.cs" Inherits="TaskSystem.Assign" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="AssignTitlePanel" runat="server" style="margin-left: 250px" 
        Width="394px" BorderColor="#CCCCCC" BorderStyle="Outset">
    作业标题：<asp:TextBox ID="assigntitleTextBox" runat="server"></asp:TextBox>
        <br />
        <br />
    截止日期：<asp:TextBox ID="datelineTextBox" runat="server"></asp:TextBox>
        <br />
        <br />
    作业说明：<asp:TextBox ID="assigndescriTextBox" runat="server" Height="62px" 
            TextMode="MultiLine" Width="238px"></asp:TextBox><br />
        <asp:Button ID="AssignSureButton" runat="server" Text="确定" 
            style="margin-left: 249px; height: 21px;" 
            onclick="AssignSureButton_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="AssignQuitButton" runat="server" Text="取消" 
            onclick="AssignQuitButton_Click" />
    </asp:Panel><br />
    <asp:Panel ID="ProblemsPanel" runat="server" Visible="False">
    <asp:Button ID="AddPro" runat="server" Text="增加" onclick="AddPro_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="UpdatePro" runat="server" Text="修改" 
            onclick="UpdatePro_Click" />&nbsp;&nbsp;&nbsp;
        <asp:Button ID="DeletePro" runat="server" Text="删除" onclick="DeletePro_Click" />
        <br />
        <asp:RadioButtonList ID="SelectProRadioButtonList" runat="server" 
            ondatabinding="Page_Load">
        </asp:RadioButtonList>
        <br />
        <asp:Panel ID="AProPanel" runat="server" BorderColor="#CCCCCC" Height="189px" 
            style="margin-left: 250px" Width="332px" Visible="False" 
            BorderStyle="Outset">
            标题：<asp:TextBox ID="AProtitleTextBox" runat="server" Height="29px" TextMode="MultiLine" 
                Width="263px"></asp:TextBox>
            <br />
            <br />
            说明：<asp:TextBox ID="AProdescriTextBox" runat="server" Height="68px" TextMode="MultiLine" 
                Width="262px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="AProSureButton" runat="server"  Text="确定" 
                onclick="AProSureButton_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="AProQuitButton" runat="server" Text="取消" 
                onclick="AProQuitButton_Click" />
        </asp:Panel>
         <asp:Panel ID="UpdateAProPanel" runat="server" BorderColor="#CCCCCC" Height="189px" 
            style="margin-left: 250px" Width="332px" Visible="False" 
            BorderStyle="Outset">
            标题：<asp:TextBox ID="UpdateAProtitleTextBox" runat="server" Height="29px" TextMode="MultiLine" 
                Width="263px"></asp:TextBox>
            <br />
            <br />
            说明：<asp:TextBox ID="UpdateAProdescriTextBox" runat="server" Height="68px" TextMode="MultiLine" 
                Width="262px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="UpdateAProSureButton" runat="server"  Text="确定" 
                 onclick="UpdateAProSureButton_Click"/>
             &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="UpdateAProQuitButton" runat="server" Text="取消" 
                 onclick="UpdateAProQuitButton_Click" />
        </asp:Panel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ProblemsSaveButton" runat="server" Text="保存" 
            onclick="ProblemsSaveButton_Click" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="ProblemsQuitButton" runat="server" Text="取消" />
    </asp:Panel>
</asp:Content>
