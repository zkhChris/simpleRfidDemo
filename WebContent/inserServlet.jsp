<%@ page language="java" import= "java.util.*" import ="java.sql.*"  pageEncoding ="utf-8" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<% request.setCharacterEncoding("utf-8"); %> 
<html>
<body>

<%
String driverName="com.mysql.jdbc.Driver";
String db_name="rfid";
String db_table="rfid";
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid?useUnicode=true&characterEncoding=UTF-8","root","1025");
Statement st = conn.createStatement(); 
%>
<%

String rfidTagId=request.getParameter("rfidTagId"); 
String deviceName=request.getParameter("deviceName");
String deviceNum=request.getParameter("deviceNum");
String identificationNum=request.getParameter("identificationNum");
String location=request.getParameter("location");
String custodian=request.getParameter("custodian");
String responsiblePerson=request.getParameter("responsiblePerson");
String sql="insert into rfid (rfidTagId,deviceName,deviceNum,identificationNum,location,custodian,responsiblePerson) values ('"+rfidTagId+"','"+deviceName+"','"+deviceNum+"','"+identificationNum+"','"+location+"','"+custodian+"','"+responsiblePerson+"');";
st.executeUpdate(sql);
response.sendRedirect("main.jsp");
%>
</body>
</html>