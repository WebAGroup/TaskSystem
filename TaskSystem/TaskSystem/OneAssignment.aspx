<%@ Page Title="" Language="C#" MasterPageFile="~/MainFrame.master" AutoEventWireup="true" CodeBehind="OneAssignment.aspx.cs" Inherits="TaskSystem.OneAssignment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        专业：<asp:TextBox ID="TextBox1" runat="server" Width="81px"></asp:TextBox>
&nbsp;&nbsp;&nbsp; 学生姓名：<asp:TextBox ID="StuNameTextBox" runat="server" Width="81px"></asp:TextBox>
&nbsp;&nbsp;&nbsp; 次数：<asp:DropDownList ID="NumDropDownList" runat="server">
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp; 状态：<asp:DropDownList ID="StateDropDownList" runat="server">
            <asp:ListItem>已批改</asp:ListItem>
            <asp:ListItem>未批改</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="SearchButton" runat="server" Text="查询" />
    </p>
    <p>
        <asp:GridView ID="OneAssignmentGridView" runat="server" CellPadding="4" 
            ForeColor="#333333" GridLines="None" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="LinqDataSource1">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                    SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" ReadOnly="True" 
                    SortExpression="title" />
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
            EntityTypeName="" Select="new (id, title)" TableName="Assignment">
        </asp:LinqDataSource>
    </p>
</asp:Content>
