<%@ Page Title="" Language="C#" MasterPageFile="~/MainFrame.master" AutoEventWireup="true" CodeBehind="AllAssignment.aspx.cs" Inherits="TaskSystem.AllAssignment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/Assignment.css"/>
</asp:Content>

<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div class="title">
        [
        <asp:Label ID="allassigncoursenameLabel" runat="server" 
            style="font-weight: 700" Text="Label"></asp:Label>
        ]所有作业
    </div>
    
    <p style="text-align: center; color: #0066FF">
        <asp:GridView ID="AllAssignmentGridView" runat="server" CellPadding="4" ForeColor="#333333" 
            GridLines="None" AllowPaging="True" AutoGenerateColumns="False" 
            DataSourceID="LinqDataSource1" DataKeyNames="id" 
            onrowdeleting="AllAssignmentGridView_RowDeleting" 
            style="margin-left: 326px; text-align:center" Width="477px"  >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="number" HeaderText="次数" ReadOnly="True" 
                    SortExpression="number" />
                <asp:HyperLinkField DataNavigateUrlFields="id,number" 
                    DataNavigateUrlFormatString="OneAssignment.aspx?Assignmentid={0}&amp;Assignmentnum={1}" 
                    DataTextField="title" HeaderText="标题" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" OnClientClick="return confirm('确定要删除该次作业吗？')" Text="删除" ></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
            EntityTypeName="" TableName="Assignment" 
            Where="course == @course" EnableDelete="True">
            <WhereParameters>
                <asp:QueryStringParameter Name="course" QueryStringField="Coursenum" 
                    Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </p>
    <div class="linkButton">
    <asp:LinkButton ID="AddAssignmentLinkButton" runat="server" 
            onclick="AddAssignmentLinkButton_Click">添加作业</asp:LinkButton>
    </div>
</asp:Content>
