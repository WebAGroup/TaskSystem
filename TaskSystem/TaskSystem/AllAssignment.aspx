﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MainFrame.master" AutoEventWireup="true" CodeBehind="AllAssignment.aspx.cs" Inherits="TaskSystem.AllAssignment" %>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <p style="text-align: right; color: #0066FF">
        [
        <asp:Label ID="allassigncoursenameLabel" runat="server" 
            style="font-weight: 700" Text="Label"></asp:Label>
        ]所有作业&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:LinkButton ID="AddAssignmentLinkButton" runat="server" 
            onclick="AddAssignmentLinkButton_Click">添加作业</asp:LinkButton>
    </p>
    <p style="text-align: center; color: #0066FF">
        <asp:GridView ID="AllAssignmentGridView" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None" AllowPaging="True" AutoGenerateColumns="False" 
            DataSourceID="LinqDataSource1"  >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="次数" ReadOnly="True" 
                    SortExpression="id" />
                <asp:HyperLinkField DataNavigateUrlFields="id" 
                    DataNavigateUrlFormatString="OneAssignment.aspx?Assignmentnum={0}" 
                    DataTextField="title" HeaderText="标题" />
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
            EntityTypeName="" Select="new (id, title)" TableName="Assignment" 
            Where="course == @course">
            <WhereParameters>
                <asp:QueryStringParameter Name="course" QueryStringField="Coursenum" 
                    Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </p>
</asp:Content>
