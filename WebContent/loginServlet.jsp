<%@ page language="java" import="java.util.*" import="java.sql.*"
	pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="com.mysql.jdbc.Driver"%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="./common.css">
<title>Logining</title>
</head>
<body>
	<div id="bg">
		<div id="contain">

			<div id="loginbox">
				<p id="logintitle">Login</p>
				<form action="loginServlet.jsp" method="post">
					<fieldset>
						<legend class="legend">用户登录</legend>
						<div class="legend">

							<%
								request.setCharacterEncoding("utf-8");
								String name = request.getParameter("userName");
								String passw = request.getParameter("password");
							%>
							<%
								String driverName = "com.mysql.jdbc.Driver";
								String db_userName = "root";
								String db_userPass = "1025";
								Class.forName("com.mysql.jdbc.Driver");
								Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid", "root", "1025");
								Statement st = conn.createStatement();
								String sql = "select * from user where userName='" + name + "' and userPwd = '" + passw
										+ "'";
								ResultSet rs = st.executeQuery(sql);
								if (rs.next()) {
									response.sendRedirect("main.jsp");
									session.setAttribute("userName", name);
								} else
								//否则登录失败
								{
									out.println("<center><h2>用户名不存在或密码错误！</h2>" + "</h2></br>"
											+ "<a href='index.jsp'>点击重新登陆</a></center>");
								}
								rs.close();
								st.close();
								conn.close();
							%>
						</div>

					</fieldset>
				</form>
			</div>

		</div>
	</div>



</body>
</html>