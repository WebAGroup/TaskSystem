<%@ Page Title="" Language="C#" MasterPageFile="~/MainFrame.Master" AutoEventWireup="true" CodeBehind="OneAssignment.aspx.cs" Inherits="TaskSystem.OneProblem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <p style="text-align: right; color: #0066FF">
        [
        作业<asp:Label ID="AssignmentnumLabel" runat="server" 
            style="font-weight: 700" Text="Label"></asp:Label>
        ]问题列表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:LinkButton ID="AddProLinkButton" runat="server" 
            onclick="AddProLinkButton_Click" >添加问题</asp:LinkButton>
    </p>
    <asp:GridView ID="OneProblemGridView" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None" style="text-align: left; margin-left: 270px;" 
        DataKeyNames="id" onrowdeleting="OneProblemGridView_RowDeleting" 
        Width="619px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="title" HeaderText="标题" 
                SortExpression="title" ReadOnly="True" />
            <asp:BoundField DataField="descrip" HeaderText="说明" ReadOnly="True" 
                SortExpression="descrip" />
            <asp:ButtonField CommandName="Delete" HeaderText="操作" ShowHeader="True" 
                Text="删除" />
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="OneProblem.aspx?problemid={0}" 
                Text="查看" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="TaskSystem.DataAccess.DataClassesDataContext" 
        EntityTypeName="" TableName="Problem" Where="assignment == @assignment" 
        EnableDelete="True">
        <WhereParameters>
            <asp:QueryStringParameter Name="assignment" QueryStringField="Assignmentid" 
                Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
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
         </asp:Content>
