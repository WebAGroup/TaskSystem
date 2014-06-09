<%@ Page Title="" Language="C#" MasterPageFile="~/MainFrame.master" AutoEventWireup="true" CodeBehind="OneProblem.aspx.cs" Inherits="TaskSystem.OneAssignment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/Assignment.css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        专业：<asp:TextBox ID="majorTextBox" runat="server" Width="81px"></asp:TextBox>
&nbsp;&nbsp;&nbsp; 学生姓名：<asp:TextBox ID="StuNameTextBox" runat="server" Width="81px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp; 状态：<asp:DropDownList ID="StateDropDownList" runat="server">
            <asp:ListItem Value="2">未批改</asp:ListItem>
            <asp:ListItem Value="1">已批改</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="SearchButton" runat="server" Text="查询" class="AddButton"/>
    </p>
    <p>
        <asp:QueryExtender ID="QueryExtender1" runat="server" 
            TargetControlID="LinqDataSource1">
            <asp:SearchExpression DataFields="student" SearchType="Contains">
                <asp:ControlParameter ControlID="StuNameTextBox" />
            </asp:SearchExpression>

            <asp:SearchExpression DataFields="major" SearchType="Contains">
            <asp:ControlParameter ControlID="majorTextBox" />
            </asp:SearchExpression>

            
        </asp:QueryExtender>
    </p>
    <p>
        <asp:GridView ID="OneAssignmentGridView" runat="server" CellPadding="4" 
            ForeColor="#333333" GridLines="None" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="LinqDataSource1" 
            DataKeyNames="student,problem" style="margin-left: 216px; text-align:left" Width="647px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="major" HeaderText="专业" ReadOnly="True" 
                    SortExpression="student" />
                <asp:BoundField DataField="student" HeaderText="学生姓名" ReadOnly="True" 
                    SortExpression="student" />
                <asp:BoundField DataField="score" HeaderText="分数" 
                    SortExpression="score" />
                <asp:HyperLinkField DataNavigateUrlFields="problem,student" 
                    DataNavigateUrlFormatString="Check.aspx?problem={0}&amp;student={1}" HeaderText="操作" 
                    Text="批改" />
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
            EntityTypeName="" 
            TableName="Answer" Where="problem == @problem &amp;&amp; state == @state">
            <WhereParameters>
                <asp:QueryStringParameter Name="problem" QueryStringField="problemid" 
                    Type="Int32" />
                <asp:ControlParameter ControlID="StateDropDownList" Name="state" 
                    PropertyName="SelectedValue" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </p>
</asp:Content>
