<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TaskSystem.Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户注册</title>
    <link rel="stylesheet" href="css/Register.css" />
    <script id="jquery_183" type="text/javascript" class="library"
	    src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/RegJS.js"></script>
</head>
<body>
	<div id="top">
		<h1>用户注册</h1>
	</div>
	<div class="form-bak">
		<form method="post" runat="Server" onsubmit="adaptValue();">
			<div class="left">
				<div class="line" id="line_account">
					<div class="info">
						<strong>年级专业</strong> <span class="tips">学生或班主任填写</span>
					</div>
					<div class="input">
						<input type="text" name="account" id="account"
							onblur="v_account();" onkeyup="v_account();" />
						<div class="none">
							<span></span>
						</div>
					</div>
				</div>
				<div class="line" id="line_name">
					<div class="info">
						<strong>用户名</strong> <span class="tips">只能由数字、文字或下划线组成<br />最多32个字符
						</span>
					</div>
					<div class="input">
						<input type="text" name="name" id="name" onblur="v_name();"
							onkeyup="v_name();" />
						<div class="none">
							<span></span>
						</div>
					</div>
				</div>
				<div class="line" id="line_password">
					<div class="info">
						<strong>密码</strong> <span class="tips">6至16个字符</span>
					</div>
					<div class="input">
						<input type="password" name="password" id="password"
							onblur="v_password();" onkeyup="v_password();" />
						<div class="none">
							<span></span>
						</div>
					</div>
				</div>
				<div class="line" id="line_repeat">
					<div class="info">
						<strong>确认密码</strong> <span class="tips">再次输入密码</span>
					</div>
					<div class="input">
						<input type="password" name="repeat" id="repeat"
							onblur="v_repeat();" onkeyup="v_repeat();" />
						<div class="none">
							<span></span>
						</div>
					</div>
				</div>
			</div>
			<div class="right">
				<input type="submit" id="submit" value="完成注册" disabled="disabled" />
				<div class="readagreement-wrap" onclick="onReadAgreementClick();">
					<input type="checkbox" name="agree" id="agree"
						onchange="v_submitbutton();" /> 同意《<a id="readagreement"
						href="#agreement" onclick="showAgreement();" title="查看用户使用协议">用户使用协议</a>》
				</div>
				<div>
					已经拥有账号，<a href="Login.aspx">直接登录</a>
				</div>
				<div class="selectIdentity">
					身份：
                    <asp:RadioButton ID="student" Text="学生" runat="Server" GroupName="status"/>&nbsp;
                    <asp:RadioButton ID="teacher" Text="教师" runat="Server" GroupName="status" 
                        Checked="True"/>
                </div>
			</div>
		</form>
	</div>
	<div id="agreement" class="agreement" style="display: none;">
		<h1>用户使用协议</h1>
		<textarea rows="10" cols="80">这里显示的是用户使用协议的详细内容</textarea><br/>
		<input type="button" value="同意" onclick="agree();" /> <a href="#"
			class="backtotop">返回顶部</a>
	</div>
</body>
</html>


<div style="text-align: center; clear: both">
	<p>适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗.</p>
</div>