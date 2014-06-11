<%@ Page EnableEventValidation="false" ValidateRequest="false" CodeBehind="StudentMainForm.aspx.cs" Title="" Language="C#" MasterPageFile="~/MainFrame.Master" Inherits="TaskSystem.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/StudentMainForm.css"/>
    <script type="text/javascript" language="javascript" src="js/jquery-1.2.4a.js"></script>
    <script type="text/javascript" language="javascript" src="js/ui.base.min.js"></script>
    <script type="text/javascript" language="javascript" src="js/ui.draggable.min.js"></script>

    <script language="javascript" type="text/javascript">
        $(function () {
            $("#parent").add("#x").css("opacity", 0.7);
            $("#first").draggable({ containment: "parent" }); //只能在父元素中拖拽
            $("#second").draggable({ containment: "parent" }); //只能在父元素中拖拽
            $("#third").draggable({ containment: "parent" }); //只能在父元素中拖拽
        });
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<div id="parent">
    <asp:Label ID="Lable1" runat="server" Text="Label">当前系统时间：</asp:Label>
    <asp:Label ID="SystemTime" runat="server" Text="Label"></asp:Label>
    <!--用于显示时间-->
    <br />
    <br />
    <div id="first">
    <asp:GridView ID="GridView1" runat="server" DataSource="<%# myArray2 %>" 
            CellPadding="4" ForeColor="#333333" GridLines="None" 
            AutoGenerateColumns="False" Caption="最新布置的作业" CaptionAlign="Top">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
                <asp:BoundField DataField="course" HeaderText="课程" ReadOnly="True" 
                    SortExpression="course" />
                <asp:HyperLinkField DataNavigateUrlFields="id,title" 
                    DataNavigateUrlFormatString="SubmitForm.aspx?Assignmentid={0}&amp;AssignmentTitle={1}" 
                    DataTextField="title" HeaderText="标题" />
                <asp:BoundField DataField="start_time" HeaderText="开始时间" ReadOnly="True" 
                    SortExpression="start_time" />
                <asp:BoundField DataField="end_time" HeaderText="到期时间" ReadOnly="True" 
                    SortExpression="end_time" />
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
    </div>
    <br /><br />

    <div id="second">
    <asp:GridView ID="GridView2" DataSource="<%# myArray %>" runat="server" 
            CellPadding="4" ForeColor="#333333" GridLines="None" 
            AutoGenerateColumns="False" Caption="将要到期的作业" CaptionAlign="Top">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
                <asp:BoundField DataField="course" HeaderText="课程" ReadOnly="True" 
                    SortExpression="course" />
                <asp:HyperLinkField DataNavigateUrlFields="id,title" 
                    DataNavigateUrlFormatString="SubmitForm.aspx?Assignmentid={0}&amp;AssignmentTitle={1}" 
                    DataTextField="title" HeaderText="标题" />
                <asp:BoundField DataField="start_time" HeaderText="开始时间" ReadOnly="True" 
                    SortExpression="start_time" />
                <asp:BoundField DataField="end_time" HeaderText="到期时间" ReadOnly="True" 
                    SortExpression="end_time" />
            </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    </div>
    <br /><br />

    <div id="third">
    <asp:GridView ID="GridView3" DataSource="<%# AssignmentList %>" runat="server" 
            CellPadding="4" ForeColor="#333333" GridLines="None" 
            AutoGenerateColumns="False" Caption="全部课程作业" CaptionAlign="Top">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
                <asp:BoundField DataField="course" HeaderText="课程" ReadOnly="True" 
                    SortExpression="course" />
                <asp:HyperLinkField DataNavigateUrlFields="id,title" 
                    DataNavigateUrlFormatString="SubmitForm.aspx?Assignmentid={0}&amp;AssignmentTitle={1}" 
                    DataTextField="title" HeaderText="标题" />
                <asp:BoundField DataField="start_time" HeaderText="开始时间" ReadOnly="True" 
                    SortExpression="start_time" />
                <asp:BoundField DataField="end_time" HeaderText="到期时间" ReadOnly="True" 
                    SortExpression="end_time" />
            </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    </div>
    <br /><br />
</div>
</asp:Content>
