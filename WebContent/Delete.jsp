<%@ page language="java" import= "java.util.*" import ="java.sql.*"  pageEncoding ="utf-8" %>
<%@ page import="com.mysql.jdbc.Driver" %>

<html>
<body>
<div id="loginLabel">
<%
String driverName="com.mysql.jdbc.Driver";
String db_userName="root";
String db_userPass="1025";
String db_name="rfid";
String db_table="rfid";
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid","root","1025");
Statement st = conn.createStatement(); 
String rname=request.getParameter("id");
%>
<%String name=(String)session.getAttribute("userName"); %>
<% if(name==null) {response.sendRedirect("index.jsp");}
else{out.print("您好"+name+"</br>");}%>
</div>
<% String sql="delete from rfid where rfidTagId='"+rname+"';";
st.executeUpdate(sql);
conn.close();
st.close();
response.sendRedirect("main.jsp");
%>
</body>
</html>