<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="TaskSystem.admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>管理员</title>
    <link href="images/校徽.jpg" rel="Shortcut Icon" type="image/x-icon" />
    <link href="css/admin.css" type="text/css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="head">
            <img src="images/head.png" alt="title" width="100%" height="100%" />
        </div>
        <div class="topd">
            <div class="welcome">
                <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>&nbsp<asp:LinkButton
                    ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">注销</asp:LinkButton>&nbsp&nbsp
                <asp:Button ID="Button7" runat="server" Text="修改密码" OnClick="Button7_Click" />
            </div>
        </div>
        <div class="main">
            <div class="ll">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0"
                    width="100%" height="100%">
                    <param name="movie" value="images/flash2500.swf" />
                    <param name="quality" value="high" />
                    <param name="SCALE" value="exactfit" />
                    <embed src="images/flash2500.swf" width="100%" height="100%" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"
                        type="application/x-shockwave-flash" scale="exactfit"></embed>
                </object>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" >
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
           
                    <div class="left">
                        <div class="kb">
                        </div>
                        <div class="lb">
                        </div>
                        <div>
                            <asp:Menu ID="Menu1" runat="server" Font-Size="X-Large" OnMenuItemClick="Menu1_MenuItemClick">
                                <Items>
                                    <asp:MenuItem Text="管理学生" Value="管理学生"></asp:MenuItem>
                                    <asp:MenuItem Text="管理教师" Value="管理教师"></asp:MenuItem>
                                    <asp:MenuItem Text="管理课程" Value="管理课程">
                                        <asp:MenuItem Text="课程" Value="课程"></asp:MenuItem>
                                        <asp:MenuItem Text="作业" Value="作业"></asp:MenuItem>
                                        <asp:MenuItem Text="问题" Value="问题"></asp:MenuItem>
                                        <asp:MenuItem Text="答案" Value="答案"></asp:MenuItem>
                                    </asp:MenuItem>
                                </Items>
                            </asp:Menu>
                        </div>
                    </div>


                    <div class="right">
                        <asp:Panel ID="Panel1" runat="server" Visible="False">
                            <asp:Label ID="Label6" runat="server" Font-Size="Large" ForeColor="#3399FF" Text="学生表管理"></asp:Label><br />
                            <br />
                            账号：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            昵称:
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            专业：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" Text="搜索" />
                            <asp:QueryExtender ID="QueryExtender1" runat="server" TargetControlID="LinqDataSource1">
                                <asp:SearchExpression DataFields="username" SearchType="StartsWith">
                                    <asp:ControlParameter ControlID="TextBox1" />
                                </asp:SearchExpression>
                                <asp:SearchExpression DataFields="name" SearchType="StartsWith">
                                    <asp:ControlParameter ControlID="TextBox2" />
                                </asp:SearchExpression>
                                <asp:SearchExpression DataFields="major" SearchType="StartsWith">
                                    <asp:ControlParameter ControlID="TextBox3" />
                                </asp:SearchExpression>
                            </asp:QueryExtender>
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="username" DataSourceID="LinqDataSource1"
                                OnRowCommand="GridView1_RowCommand" Width="400px" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" onrowdatabound="GridView1_RowDataBound"  >
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="username" HeaderText="账号" ReadOnly="True" SortExpression="username" />
                                    <asp:BoundField DataField="passwd" HeaderText="密码" SortExpression="passwd" />
                                    <asp:BoundField DataField="name" HeaderText="昵称" SortExpression="name" />
                                    <asp:BoundField DataField="major" HeaderText="专业" SortExpression="major" />
                                    <asp:CommandField HeaderText="编辑" ShowEditButton="True" />
                                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                    <asp:ButtonField HeaderText="插入" Text="插入" CommandName="Insert" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <EmptyDataTemplate>
                                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="username"
                                        DataSourceID="LinqDataSource1" DefaultMode="Insert" Height="50px" Width="400px"
                                        OnItemInserted="DetailsView1_ItemInserted" AllowPaging="True" 
                                        OnItemCommand="DetailsView1_ItemCommand" 
                                        oniteminserting="DetailsView1_ItemInserting">
                                        <Fields>
                                            <asp:BoundField DataField="username" HeaderText="username" ReadOnly="True" SortExpression="username" />
                                            <asp:BoundField DataField="passwd" HeaderText="passwd" SortExpression="passwd" />
                                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                            <asp:BoundField DataField="major" HeaderText="major" SortExpression="major" />
                                            <asp:CommandField ShowInsertButton="True" ShowDeleteButton="True" ShowEditButton="True" />
                                        </Fields>
                                    </asp:DetailsView>
                                </EmptyDataTemplate>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="TaskSystem.DataAccess.DataClassesDataContext"
                                EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
                                TableName="Student">
                            </asp:LinqDataSource>
                        </asp:Panel>


                        <asp:Panel ID="Panel2" runat="server" Visible="False">
                            <asp:Label ID="Label5" runat="server" Font-Size="Large" ForeColor="#3399FF" Text="教师表管理"></asp:Label><br />
                            <br />
                            账号：<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            昵称：<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            <asp:Button ID="Button2" runat="server" Text="搜索" />
                            <asp:QueryExtender ID="QueryExtender2" runat="server" TargetControlID="LinqDataSource2">
                                <asp:SearchExpression DataFields="username" SearchType="StartsWith">
                                    <asp:ControlParameter ControlID="TextBox4" />
                                </asp:SearchExpression>
                                <asp:SearchExpression DataFields="name" SearchType="StartsWith">
                                    <asp:ControlParameter ControlID="TextBox5" />
                                </asp:SearchExpression>
                            </asp:QueryExtender>
                            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" Width="400px" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="username" DataSourceID="LinqDataSource2"
                                OnRowCommand="GridView2_RowCommand" CellPadding="4" ForeColor="#333333" 
                                GridLines="None" onrowdatabound="GridView2_RowDataBound">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="username" HeaderText="账号" ReadOnly="True" SortExpression="username" />
                                    <asp:BoundField DataField="passwd" HeaderText="密码" SortExpression="passwd" />
                                    <asp:BoundField DataField="name" HeaderText="昵称" SortExpression="name" />
                                    <asp:CommandField HeaderText="编辑" ShowEditButton="True" />
                                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                    <asp:ButtonField HeaderText="插入" Text="插入" CommandName="Insert" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <EmptyDataTemplate>
                                    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="username"
                                        DataSourceID="LinqDataSource2" DefaultMode="Insert" Height="50px" Width="400px"
                                        OnItemCommand="DetailsView2_ItemCommand" 
                                        OnItemInserted="DetailsView2_ItemInserted" 
                                        oniteminserting="DetailsView2_ItemInserting">
                                        <Fields>
                                            <asp:BoundField DataField="username" HeaderText="username" ReadOnly="True" SortExpression="username" />
                                            <asp:BoundField DataField="passwd" HeaderText="passwd" SortExpression="passwd" />
                                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                            <asp:CommandField ShowInsertButton="True" />
                                        </Fields>
                                    </asp:DetailsView>
                                </EmptyDataTemplate>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="TaskSystem.DataAccess.DataClassesDataContext"
                                EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
                                TableName="Teacher">
                            </asp:LinqDataSource>
                        </asp:Panel>
                        <asp:Panel ID="Panel3" runat="server" Visible="False">
                            <asp:Label ID="Label4" runat="server" Font-Size="Large" ForeColor="#3399FF" Text="课程表管理"></asp:Label><br />
                            <br />
                            教师：<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                            课程名：<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                            <asp:Button ID="Button3" runat="server" Text="搜索" />
                            <asp:QueryExtender ID="QueryExtender3" runat="server" TargetControlID="LinqDataSource3">
                                <asp:SearchExpression DataFields="teacher" SearchType="StartsWith">
                                    <asp:ControlParameter ControlID="TextBox6" />
                                </asp:SearchExpression>
                                <asp:SearchExpression DataFields="name" SearchType="StartsWith">
                                    <asp:ControlParameter ControlID="TextBox7" />
                                </asp:SearchExpression>
                            </asp:QueryExtender>
                            <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="num" DataSourceID="LinqDataSource3"
                                OnRowCommand="GridView3_RowCommand" CellPadding="4" ForeColor="#333333" 
                                GridLines="None" onrowdatabound="GridView3_RowDataBound">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="num" HeaderText="课程号" ReadOnly="True" SortExpression="num" />
                                    <asp:BoundField DataField="teacher" HeaderText="教师账号" SortExpression="teacher" />
                                    <asp:BoundField DataField="name" HeaderText="课程名" SortExpression="name" />
                                    <asp:BoundField DataField="start_time" HeaderText="开始时间" SortExpression="start_time" />
                                    <asp:BoundField DataField="end_time" HeaderText="结束时间" SortExpression="end_time" />
                                    <asp:CommandField HeaderText="编辑" ShowEditButton="True" />
                                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                    <asp:ButtonField HeaderText="插入" Text="插入" CommandName="Insert" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <EmptyDataTemplate>
                                    <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataKeyNames="num"
                                        DataSourceID="LinqDataSource3" DefaultMode="Insert" Height="50px" Width="125px"
                                        OnItemCommand="DetailsView3_ItemCommand" 
                                        OnItemInserted="DetailsView3_ItemInserted" 
                                        oniteminserting="DetailsView3_ItemInserting">
                                        <Fields>
                                            <asp:BoundField DataField="num" HeaderText="num" ReadOnly="True" SortExpression="num" />
                                            <asp:BoundField DataField="teacher" HeaderText="teacher" SortExpression="teacher" />
                                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                            <asp:BoundField DataField="start_time" HeaderText="start_time" SortExpression="start_time" />
                                            <asp:BoundField DataField="end_time" HeaderText="end_time" SortExpression="end_time" />
                                            <asp:CommandField ShowInsertButton="True" />
                                        </Fields>
                                    </asp:DetailsView>
                                </EmptyDataTemplate>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="TaskSystem.DataAccess.DataClassesDataContext"
                                EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
                                TableName="Course">
                            </asp:LinqDataSource>
                        </asp:Panel>
                        <asp:Panel ID="Panel4" runat="server" Visible="False">
                            <asp:Label ID="Label3" runat="server" Font-Size="Large" ForeColor="#3399FF" Text="作业表管理"></asp:Label><br />
                            <br />
                            专业：<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                            <asp:Button ID="Button4" runat="server" Text="搜索" />
                            <asp:QueryExtender ID="QueryExtender4" runat="server" TargetControlID="LinqDataSource4">
                                <asp:SearchExpression DataFields="major" SearchType="StartsWith">
                                    <asp:ControlParameter ControlID="TextBox8" />
                                </asp:SearchExpression>
                            </asp:QueryExtender>
                            <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="LinqDataSource4"
                                OnRowCommand="GridView4_RowCommand" CellPadding="4" ForeColor="#333333" 
                                GridLines="None" onrowdatabound="GridView4_RowDataBound">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="作业ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="id" />
                                    <asp:BoundField DataField="course" HeaderText="课程号" SortExpression="course" />
                                    <asp:BoundField DataField="number" HeaderText="次数" SortExpression="number" />
                                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                                    <asp:BoundField DataField="descrip" HeaderText="描述" SortExpression="descrip" />
                                    <asp:BoundField DataField="start_time" HeaderText="开始时间" SortExpression="start_time" />
                                    <asp:BoundField DataField="end_time" HeaderText="结束时间" SortExpression="end_time" />
                                    <asp:BoundField DataField="major" HeaderText="专业" SortExpression="major" />
                                    <asp:CommandField HeaderText="编辑" ShowEditButton="True" />
                                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                    <asp:ButtonField CommandName="Insert" HeaderText="插入" Text="插入" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <EmptyDataTemplate>
                                    <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" DataKeyNames="id"
                                        DataSourceID="LinqDataSource4" DefaultMode="Insert" Height="50px" Width="125px"
                                        OnItemCommand="DetailsView4_ItemCommand" 
                                        OnItemInserted="DetailsView4_ItemInserted" 
                                        oniteminserting="DetailsView4_ItemInserting">
                                        <Fields>
                                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                                                SortExpression="id" />
                                            <asp:BoundField DataField="course" HeaderText="course" SortExpression="course" />
                                            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                                            <asp:BoundField DataField="descrip" HeaderText="descrip" SortExpression="descrip" />
                                            <asp:BoundField DataField="start_time" HeaderText="start_time" SortExpression="start_time" />
                                            <asp:BoundField DataField="end_time" HeaderText="end_time" SortExpression="end_time" />
                                            <asp:BoundField DataField="major" HeaderText="major" SortExpression="major" />
                                            <asp:BoundField DataField="number" HeaderText="number" 
                                                SortExpression="number" />
                                            <asp:CommandField ShowInsertButton="True" />
                                        </Fields>
                                    </asp:DetailsView>
                                </EmptyDataTemplate>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="TaskSystem.DataAccess.DataClassesDataContext"
                                EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
                                TableName="Assignment">
                            </asp:LinqDataSource>
                        </asp:Panel>
                        <asp:Panel ID="Panel5" runat="server" Visible="False">
                            <asp:Label ID="Label2" runat="server" Font-Size="Large" ForeColor="#3399FF" Text="问题表管理"></asp:Label><br />
                            <br />
                            标题：<asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                            <asp:Button ID="Button5" runat="server" Text="搜索" /><br />
                            <asp:QueryExtender ID="QueryExtender5" runat="server" TargetControlID="LinqDataSource5">
                                <asp:SearchExpression DataFields="title" SearchType="StartsWith">
                                    <asp:ControlParameter ControlID="TextBox9" />
                                </asp:SearchExpression>
                            </asp:QueryExtender>
                            <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="LinqDataSource5"
                                OnRowCommand="GridView5_RowCommand" CellPadding="4" ForeColor="#333333" 
                                GridLines="None" onrowdatabound="GridView5_RowDataBound">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="问题ID" InsertVisible="False" ReadOnly="True"
                                        SortExpression="id" />
                                    <asp:BoundField DataField="assignment" HeaderText="作业ID" SortExpression="assignment" />
                                    <asp:BoundField DataField="title" HeaderText="问题标题" SortExpression="title" />
                                    <asp:BoundField DataField="descrip" HeaderText="问题描述" SortExpression="descrip" />
                                    <asp:BoundField DataField="score" HeaderText="分数" SortExpression="score" />
                                    <asp:CommandField HeaderText="编辑" ShowEditButton="True" />
                                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                    <asp:ButtonField HeaderText="插入" Text="插入" CommandName="Insert" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <EmptyDataTemplate>
                                    <asp:DetailsView ID="DetailsView5" runat="server" AutoGenerateRows="False" DataKeyNames="id"
                                        DataSourceID="LinqDataSource5" DefaultMode="Insert" Height="50px" Width="125px"
                                        OnItemCommand="DetailsView5_ItemCommand" 
                                        OnItemInserted="DetailsView5_ItemInserted" 
                                        oniteminserting="DetailsView5_ItemInserting">
                                        <Fields>
                                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                                                SortExpression="id" />
                                            <asp:BoundField DataField="assignment" HeaderText="assignment" SortExpression="assignment" />
                                            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                                            <asp:BoundField DataField="descrip" HeaderText="descrip" SortExpression="descrip" />
                                            <asp:BoundField DataField="score" HeaderText="score" SortExpression="score" />
                                            <asp:CommandField ShowInsertButton="True" />
                                        </Fields>
                                    </asp:DetailsView>
                                </EmptyDataTemplate>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:LinqDataSource ID="LinqDataSource5" runat="server" ContextTypeName="TaskSystem.DataAccess.DataClassesDataContext"
                                EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
                                TableName="Problem">
                            </asp:LinqDataSource>
                        </asp:Panel>
                        <asp:Panel ID="Panel6" runat="server" Visible="False">
                            <asp:Label ID="Label1" runat="server" Font-Size="Large" ForeColor="#3399FF" Text="答案表管理"></asp:Label><br />
                            <br />
                            学生账号：<asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                           
                            <asp:Button ID="Button6" runat="server" Text="搜索" />
                            <asp:QueryExtender ID="QueryExtender6" runat="server" TargetControlID="LinqDataSource6">
                                <asp:SearchExpression DataFields="student" SearchType="StartsWith">
                                    <asp:ControlParameter ControlID="TextBox10" />
                                </asp:SearchExpression>
                       
                            </asp:QueryExtender>
                            <asp:GridView ID="GridView6" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="student,problem" DataSourceID="LinqDataSource6"
                                OnRowCommand="GridView6_RowCommand" CellPadding="4" ForeColor="#333333" 
                                GridLines="None" onrowdatabound="GridView6_RowDataBound">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="student" HeaderText="学生账号" ReadOnly="True" 
                                        SortExpression="student" />
                                    <asp:BoundField DataField="problem" HeaderText="问题号" ReadOnly="True" 
                                        SortExpression="problem" />
                                    <asp:BoundField DataField="content" HeaderText="内容" 
                                        SortExpression="content" />
                                    <asp:BoundField DataField="score" HeaderText="分数" SortExpression="score" />
                                    <asp:BoundField DataField="comment" HeaderText="评论" 
                                        SortExpression="comment" />
                                    <asp:BoundField DataField="major" HeaderText="专业" SortExpression="major" />
                                    <asp:BoundField DataField="state" HeaderText="状态" SortExpression="state" />
                                    <asp:CommandField HeaderText="编辑" 
                                        ShowEditButton="True" />
                                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                    <asp:ButtonField CommandName="Insert" HeaderText="插入" Text="插入" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <EmptyDataTemplate>
                                    <asp:DetailsView ID="DetailsView7" runat="server" AutoGenerateRows="False" DataKeyNames="student,problem"
                                        DataSourceID="LinqDataSource6" DefaultMode="Insert" Height="50px" Width="125px"
                                        OnItemCommand="DetailsView7_ItemCommand" 
                                        OnItemInserted="DetailsView7_ItemInserted" 
                                        oniteminserting="DetailsView7_ItemInserting">
                                        <Fields>
                                            <asp:BoundField DataField="student" HeaderText="student" ReadOnly="True" SortExpression="student" />
                                            <asp:BoundField DataField="problem" HeaderText="problem" ReadOnly="True" SortExpression="problem" />
                                            <asp:BoundField DataField="content" HeaderText="content" SortExpression="content" />
                                            <asp:BoundField DataField="score" HeaderText="score" SortExpression="score" />
                                            <asp:BoundField DataField="comment" HeaderText="comment" SortExpression="comment" />
                                            <asp:BoundField DataField="major" HeaderText="major" SortExpression="major" />
                                            <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                                            <asp:CommandField ShowInsertButton="True" />
                                        </Fields>
                                    </asp:DetailsView>
                                </EmptyDataTemplate>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:LinqDataSource ID="LinqDataSource6" runat="server" ContextTypeName="TaskSystem.DataAccess.DataClassesDataContext"
                                EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
                                TableName="Answer">
                            </asp:LinqDataSource>
                        </asp:Panel>
                        <asp:Panel ID="Panel7" runat="server" Visible="False">
                            旧的密码：<asp:TextBox ID="TextBox12" runat="server" TextMode="Password"></asp:TextBox><br />
                            新的密码：<asp:TextBox ID="TextBox13" runat="server" TextMode="Password"></asp:TextBox><br />
                            确认密码：<asp:TextBox ID="TextBox14" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次密码不一致"
                                ControlToValidate="TextBox14" ControlToCompare="TextBox13"></asp:CompareValidator>
                            <br />
                            <br />
                            <asp:Button ID="Button8" runat="server" Text="确认" OnClick="Button8_Click" />
                            &nbsp &nbsp
                            <asp:Button ID="Button9" runat="server" Text="取消" OnClick="Button9_Click" />
                        </asp:Panel>
                    </div>
                </ContentTemplate>
                <Triggers >
                <asp:AsyncPostBackTrigger ControlID="Button7" EventName="Click"/>
                </Triggers>
            </asp:UpdatePanel>

            <div class="rr">
            </div>
        </div>
    </div>
    </form>
</body>
</html>

 