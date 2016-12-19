<%@ page language="java" import= "java.util.*" import ="java.sql.*"  pageEncoding ="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="./common.css">
	<script src="./jquery-3.1.1.min.js"></script>
	
	<title>RFID</title>
</head>
<body>
	<div id="bg">
	<div id="contain">

		<div id="leftPit"></div>
		<div id="loginbox">
			<p id="logintitle">RFID管理系统登录</p>
			<form action="loginServlet.jsp" method="post"> 
			<fieldset>
			<legend class="legend">用户登录</legend>
			<table id="loginLabel">
				<tbody>
					<tr><td><div class="label">用户名：</div></td><td><div class="inputText"><input type="text" id="userName" name="userName" placeholder="请输入用户名" required autocomplete="off"></div></td></tr>
					<tr><td><div class="label">密码：</div></td><td><div class="inputText"><input type="password" id="password" name="password" placeholder="请输入密码" required autocomplete="off"></div></td></tr>
					<tr><td></td><td><div id="space"><input class="button"  id="loginB" type="submit" value="登录"></div></td> </tr>
				</tbody>
			</table>
			</fieldset>
			</form>
		</div>

    </div>
	</div>

<script src="./index.js"></script>
</body>
</html>