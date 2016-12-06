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
String rfidNum=request.getParameter("rfidNum");
String deviceName=request.getParameter("deviceName");
String deviceNum=request.getParameter("deviceNum");
String identificationNum=request.getParameter("identificationNum");
String location=request.getParameter("location");
String custodian=request.getParameter("custodian");
String responsiblePerson=request.getParameter("responsiblePerson");
out.print(rfidNum+deviceName+deviceNum+identificationNum+location+custodian+responsiblePerson);
Class.forName("com.mysql.jdbc.Driver");
String sql="update rfid set deviceName='"+deviceName+"',deviceNum='"+deviceNum+"',identificationNum='"+identificationNum+"',location='"+location+"',custodian='"+custodian+"',responsiblePerson='"+responsiblePerson+"' "+"where rfidTagId='"+rfidNum+"';";
st.executeUpdate(sql);
//out.print(sql);
conn.close();
st.close();
response.sendRedirect("main.jsp");

%>
<%String name=(String)session.getAttribute("userName"); %>
<% if(name==null) {response.sendRedirect("index.jsp");}
else{out.print("您好"+name+"</br>");}%>
</div>
</body>
</html>