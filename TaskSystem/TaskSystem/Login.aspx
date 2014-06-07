<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TaskSystem.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="Server">
        <title>用户登录</title>
        <link href="css/Default.css" type="text/css" rel="stylesheet"/>
        <link href="css/xtree.css" type="text/css" rel="stylesheet"/>
        <link href="css/User_Login.css" type="text/css" rel="stylesheet"/>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
        <meta content="MSHTML 6.00.6000.16674" name="GENERATOR"/>
    </head>
    <body id="userlogin_body">
        <div>
            <center>
            <asp:Image ID="Image2" runat="server" Height="62px" ImageUrl="~/images/LoginHeader.png" Width="600px" />
            </center>
        </div>
    <form id="login" name="login" action="?Action=Login" runat="server" method="post">
        <div id="user_login">
        <dl>
            <dd id="user_top">
                <ul>
                    <li class="user_top_l"></li>
                    <li class="user_top_c"></li>
                    <li class="user_top_r"></li>
                </ul>
            </dd>
            <dd id="user_main"/>
            <ul>
    <li class="user_main_l"></li>
    <li class="user_main_c">
    <div class="user_main_box">
    
    <ul>
      <li class="user_main_text">用户名： </li>
      <li class="user_main_input">
        <input class="TxtUserNameCssClass" id="TxtUserName" maxlength="20" name="TxtUserName"/> 
      </li>
    </ul>
    <ul>
      <li class="user_main_text">密 码： </li>
      <li class="user_main_input">
        <input class="TxtPasswordCssClass" id="TxtPassword" type="password" name="TxtPassword"/> 
      </li>
    </ul>
    <ul>
      <li class="user_main_text">身份： </li>
      <li class="user_main_input">
        <select id="DropExpiration" name="DropExpiration"> 
            <option value="student">学生</option> 
            <option value="teacher">教师</option> 
            <option value="admin">管理员</option>
        </select> 
        <a href="Register.aspx">注册</a> 
      </li>
    </ul>
  </div>
 </li>
    <li class="user_main_r">
    <input class="IbtnEnterCssClass" id="IbtnEnter" style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px" 
    type="image" src="images/user_botton.gif" name="IbtnEnter" onclick="document.login.submit()"/> 
    </li>
  </ul>
    <dd id="user_bottom">
  <ul>
    <li class="user_bottom_l"></li>
    <li class="user_bottom_c">
    </li>
    <li class="user_bottom_r"></li>
  </ul>
  </dd>
  </dl>
  </div>
  <span id="ValrUserName" style="DISPLAY: none; COLOR: red"></span>
  <span id="ValrPassword" style="DISPLAY: none; COLOR: red"></span>
  <span id="ValrValidateCode" style="DISPLAY: none; COLOR: red"></span>
    <div id="ValidationSummary1" style="DISPLAY: none; COLOR: red">
    </div>

    <div></div>

    </form>
    </body>
</html>

