<%@ Page Title="" Language="C#" MasterPageFile="~/MainFrame.Master" AutoEventWireup="true" CodeBehind="OneAssignment.aspx.cs" Inherits="TaskSystem.OneProblem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/Assignment.css"/>
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="title">
        [
        作业<asp:Label ID="AssignmentnumLabel" runat="server" 
            style="font-weight: 700" Text="Label"></asp:Label>
        ]问题列表
    </div>

    <asp:GridView ID="OneProblemGridView" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None" style="text-align: left; margin-left: 270px;" 
        DataKeyNames="id" onrowdeleting="OneProblemGridView_RowDeleting" 
        Width="619px" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="title" HeaderText="标题" 
                SortExpression="title" ReadOnly="True" />
            <asp:BoundField DataField="descrip" HeaderText="说明" ReadOnly="True" 
                SortExpression="descrip" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                        CommandName="Delete" OnClientClick="return confirm('确定要删除该问题吗？')" Text="删除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
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

    <div class="AccessorylinkButton">
    <asp:LinkButton ID="CheckAccessoryLinkButton" runat="server" 
            onclick="CheckAccessoryLinkButton_Click">查看所有附件</asp:LinkButton>
    </div>

    <div class="linkButton">
    <asp:LinkButton ID="AddProLinkButton" runat="server" 
            onclick="AddProLinkButton_Click" >添加问题</asp:LinkButton>
    </div>


    <br />


    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="TaskSystem.DataAccess.DataClassesDataContext" 
        EntityTypeName="" TableName="Problem" Where="assignment == @assignment" 
        EnableDelete="True">
        <WhereParameters>
            <asp:QueryStringParameter Name="assignment" QueryStringField="Assignmentid" 
                Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>

    <asp:Panel ID="CheckAccessoryPanel" runat="server" Visible="False">
     <asp:GridView ID="AccessoryGridView" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="student,assignment" 
        DataSourceID="LinqDataSource2" ForeColor="#333333" GridLines="None" 
        Visible="False" AllowPaging="True" style="margin-left: 320px" Width="530px" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="student" HeaderText="student" ReadOnly="True" 
                SortExpression="student" />

            <asp:TemplateField HeaderText="文件">
                    <ItemTemplate>
                      <a href='<%#Eval("adress") %>' target="_blank">下载</a>
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
    <asp:LinqDataSource ID="LinqDataSource2" runat="server" 
        ContextTypeName="TaskSystem.DataAccess.DataClassesDataContext" 
        EntityTypeName="" TableName="Accessory" Where="assignment == @assignment">
        <WhereParameters>
            <asp:QueryStringParameter Name="assignment" QueryStringField="Assignmentid" 
                Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
        <div class="linkButton">
            <asp:LinkButton ID="CloseLinkButton" runat="server">关闭</asp:LinkButton>
        </div>
    </asp:Panel>
    &nbsp;<br />
        <asp:Panel ID="AProPanel" runat="server" Visible="False" class="assignFrame">
            <br />
            分值：<asp:TextBox ID="scoreTextBox" runat="server" Width="58px"></asp:TextBox>
            <br />
            <br />
            标题：<asp:TextBox ID="AProtitleTextBox" runat="server" Height="29px" 
                TextMode="MultiLine" Width="263px"></asp:TextBox>
            <br />
            <br />
            说明：<asp:TextBox ID="AProdescriTextBox" runat="server" Height="68px" 
                TextMode="MultiLine" Width="262px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="AProSureButton" runat="server"  Text="确定" 
                onclick="AProSureButton_Click" class="AddButton"/>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="AProQuitButton" runat="server" Text="取消" 
                onclick="AProQuitButton_Click" class="DeleteButton"/>
        </asp:Panel>
         </asp:Content>
