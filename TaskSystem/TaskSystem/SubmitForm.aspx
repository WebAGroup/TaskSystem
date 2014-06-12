<%@ Page EnableEventValidation="false" ValidateRequest="false"  Title="" Language="C#" CodeBehind="SubmitForm.aspx.cs" MasterPageFile="~/MainFrame.Master" Inherits="TaskSystem.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/Homework_Submit.css"/>
    <link rel="stylesheet" href="kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="kindeditor/plugins/code/prettify.js"></script>
    <script>
        KindEditor.ready(function (K) {
            var editor1 = K.create('textarea[name="TA"]', {
                cssPath: 'kindeditor/plugins/code/prettify.css',
                uploadJson: 'kindeditor/asp.net/upload_json.ashx',
                fileManagerJson: 'kindeditor/asp.net/file_manager_json.ashx',
                allowFileManager: true,
                afterCreate: function () {
                    var self = this;
                    K.ctrl(document, 13, function () {
                        self.sync();
                        K('form[name=form1]')[0].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function () {
                        self.sync();
                        K('form[name=form1]')[0].submit();
                    });
                }
            });
            prettyPrint();
        });
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header">
        <asp:Label ID="header_text" runat="server" Text="上载作业： 第三次作业 客户端技术   "></asp:Label>
    </div>
    <div class="Control1" id="Control1" runat="server">
        <asp:Button ID="back" runat="server" Text="返回" onclick="back_Click"/>
        <asp:Button ID="export" runat="server" Text="作业导出" onclick="export_Click"/>
        <asp:Button ID="submit" runat="server" Text="提交" onclick="submit_Click" />
    </div>

    <div class="homework" id="PlaceHolder1" runat="server">
    </div>

    &nbsp;&nbsp;<!-- <input type="file" runat="Server" id="file" name="file"/> -->
    <asp:Label ID="fileTips" runat="server" Text="添加附件："></asp:Label>
    <asp:FileUpload ID="FileUpload2" runat="server" />
    <hr />
    <div class="Control2" id="Control2" runat="server">
        <asp:Button ID="back2" runat="server" Text="返回" onclick="back2_Click" />
        <asp:Button ID="export2" runat="server" Text="作业导出" onclick="export2_Click"/>
        <asp:Button ID="submit2" runat="server" Text="提交" onclick="submit2_Click" />
    </div>
</asp:Content>
