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
	<div id="bar"><div id="barfont">实验室RFID管理系统</div><div style="float=left" id="user">登录</div></div>
	<div id="contain">

		
		<div id="loginbox">
			<p id="logintitle">Login</p>
			<form action="loginServlet.jsp" method="post"> 
			
		
			<table id="loginLabel">
				<tbody>
					<tr><div class="logT">用户名：</div></tr>
					<tr><div class="inputText"><input type="text" id="userName" name="userName" placeholder="请输入用户名" required autocomplete="off"></div></tr>
					<tr><div class="logT" >密码：</div></tr>
					<tr><div class="inputText"><input type="password" id="password" name="password" placeholder="请输入密码" required autocomplete="off"></div></tr>
					<tr><input class="loginBut"  id="loginB" type="submit" value="login"></div></tr>
				</tbody>
			</table>
			
			</form>
		</div>

    </div>
	</div>

<script src="./index.js"></script>
</body>
</html>