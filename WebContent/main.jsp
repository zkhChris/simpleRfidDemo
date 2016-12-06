<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@ page language="java" import="java.util.*" import="java.sql.*"
	pageEncoding="utf-8"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>RFID</title>
<link rel="stylesheet" type="text/css" href="./common.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./jquery-3.1.1.min.js"></script>
</head>
<body>
	<div id="bg">
		<div id="contain">
			<div id="userInfo">
				<%
					String name = (String) session.getAttribute("userName");
				%>
				<%
					if (name == null) {
						response.sendRedirect("index.jsp");
					} else {
						out.print("您好管理员：" + name + " " + "<a href='quit.jsp'>点击退出</a>");
					}
				%>
			</div>
			<div id="main">
				<div id="legend">
					<%
						String driverName = "com.mysql.jdbc.Driver";
						String db_userName = "root";
						String db_userPass = "1025";
						String db_name = "rfid";
						String db_table = "rfid";
						Class.forName("com.mysql.jdbc.Driver");
						Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid", "root", "1025");
						Statement st = conn.createStatement();
						ResultSet rs = st.executeQuery("select * from rfid");
					%>


				</div>
				<table>
					<tbody>
						<tr>
							<td><input class="button" type="button" id="insert"
								value="设备录入"></td>
						</tr>
						<tr>
							<td><input class="button" type="button" id="select"
								value="设备查询"></td>
						</tr>
						<tr>
							<td><input class="button" type="button" id="require"
								value="设备盘点"></td>
						<tr>
							<td><input class="button" type="button" id="edit"
								value="设备编辑"></td>
						</tr>
						</tr>
					</tbody>

				</table>

			</div>

			<div id="insertMenu">
				<form action="inserServlet.jsp" method="post">
					<fieldset>
						<legend class="legend">设备录入</legend>
						<table>
							<tbody>
								<tr>
									<td><div class="insertlabel">RFID标签号：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="rfidTagId" id="rfidTagId" required>
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">设备名称：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="deviceName" id="deviceName" required>
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">设备型号：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="deviceNum" id="deviceNum" required>
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">出厂编号：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="identificationNum" id="identificationNum" required>
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">存放地点：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="location" id="location" required>
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">保管人：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="custodian" id="custodian" required>
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">责任人：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="responsiblePerson" id="responsiblePerson" required>
										</div></td>
								</tr>
								<tr>
									<td></td>
									<td><div>
											<input class="button" type="submit" id="insertB">
										</div></td>
								</tr>


							</tbody>
							
						</table>
					</fieldset>
				</form>
			</div>

			<div id="showMenu">
				<table class="rfidTable">
            	<p class="legend">从文件中模拟的区域信息</p>
					<tbody>
						<tr>
							<th>RFID标签号</th>
							<th>设备名称</th>
							<th>设备型号</th>
							<th>出厂编号</th>
							<th>存放地点</th>
							<th>保管人</th>
							<th>责任人</th>
						</tr>
						<%
						FileReader reader = new FileReader("G:/Code/rfid/WebContent/pandian.txt");
					    BufferedReader bufferedReader = new BufferedReader(reader);
					    StringBuffer txt = new StringBuffer();
					    String temp = null;
					    while((temp = bufferedReader.readLine()) != null) {
					        out.print(temp);
					    }
						%>
					</tbody>
				</table>

			</div>

			<div id="editMenu">
				<table class="rfidTable">
					<tbody>
						<tr>
							<th>RFID标签号</th>
							<th>设备名称</th>
							<th>设备型号</th>
							<th>出厂编号</th>
							<th>存放地点</th>
							<th>保管人</th>
							<th>责任人</th>
							<th>编辑</th>
							<th>删除</th>
						</tr>
						<%
							while (rs.next()) {
								out.print("<tr>");
								out.print("<td>" + rs.getString("rfidTagId") + "</td>");
								out.print("<td>" + rs.getString("deviceName") + "</td>");
								out.print("<td>" + rs.getString("deviceNum") + "</td>");
								out.print("<td>" + rs.getString("identificationNum") + "</td>");
								out.print("<td>" + rs.getString("location") + "</td>");
								out.print("<td>" + rs.getString("custodian") + "</td>");
								out.print("<td>" + rs.getString("responsiblePerson") + "</td>");
						%>
						<td><a href="Delete.jsp?id=<%=rs.getString("rfidTagId")%>"><input
								type="button" value="删除" class="delete"></a></td>
						<td><input type="button" value="编辑" class="edit"
							id=<%=rs.getString("rfidTagId")%>></td>
						<%
							out.print("</tr>");
							}
						%>
					</tbody>
				</table>
			</div>


			<div id="selectGroup">
				<table>
					<tbody>
						<tr>
							<td><input class="seButt" type="button" id="seleB1"
								value="我所负责的设备"></td>
						</tr>
						<tr>
							<td><input class="seButt" type="button" id="seleB2"
								value="我所管理的设备"></td>
						</tr>
						<tr>
							<td><input class="seButt" type="button" id="seleB3"
								value="存放在A4-1的设备"></td>
						</tr>
						<tr>
							<td><input class="seButt" type="button" id="seleB4"
								value="数量最多的设备"></td>
						</tr>
						<tr>
						</tr>
					</tbody>
				</table>
			</div>
            <div id="select1">
             <table class="rfidTable">
					<tbody>
						<tr>
							<th>RFID标签号</th>
							<th>设备名称</th>
							<th>设备型号</th>
							<th>出厂编号</th>
							<th>存放地点</th>
							<th>保管人</th>
							<th>责任人</th>
						</tr>
						<% Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid", "root", "1025");
						Statement st2 = conn2.createStatement();
						ResultSet rs2 = st2.executeQuery("select * from rfid where custodian="+"'"+name+"';");
						
							while (rs2.next()) {
								out.print("<tr>");
								out.print("<td>" + rs2.getString("rfidTagId") + "</td>");
								out.print("<td>" + rs2.getString("deviceName") + "</td>");
								out.print("<td>" + rs2.getString("deviceNum") + "</td>");
								out.print("<td>" + rs2.getString("identificationNum") + "</td>");
								out.print("<td>" + rs2.getString("location") + "</td>");
								out.print("<td>" + rs2.getString("custodian") + "</td>");
								out.print("<td>" + rs2.getString("responsiblePerson") + "</td></tr>");
								}
							st2.close();
							rs2.close();
							conn2.close();
						%>
						</tbody>
						</table>
            </div>
            <div id="select2">
             <table class="rfidTable">
					<tbody>
						<tr>
							<th>RFID标签号</th>
							<th>设备名称</th>
							<th>设备型号</th>
							<th>出厂编号</th>
							<th>存放地点</th>
							<th>保管人</th>
							<th>责任人</th>
						</tr>
						<% Connection conn3 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid", "root", "1025");
						Statement st3 = conn3.createStatement();
						ResultSet rs3 = st3.executeQuery("select * from rfid where responsiblePerson="+"'"+name+"';");
						
							while (rs3.next()) {
								out.print("<tr>");
								out.print("<td>" + rs3.getString("rfidTagId") + "</td>");
								out.print("<td>" + rs3.getString("deviceName") + "</td>");
								out.print("<td>" + rs3.getString("deviceNum") + "</td>");
								out.print("<td>" + rs3.getString("identificationNum") + "</td>");
								out.print("<td>" + rs3.getString("location") + "</td>");
								out.print("<td>" + rs3.getString("custodian") + "</td>");
								out.print("<td>" + rs3.getString("responsiblePerson") + "</td></tr>");
								}
							st3.close();
							rs3.close();
							conn3.close();
						%>
						</tbody>
						</table>
            </div>
            <div id="select3">
             <table class="rfidTable">
					<tbody>
						<tr>
							<th>RFID标签号</th>
							<th>设备名称</th>
							<th>设备型号</th>
							<th>出厂编号</th>
							<th>存放地点</th>
							<th>保管人</th>
							<th>责任人</th>
						</tr>
						<% Connection conn4 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid", "root", "1025");
						Statement st4 = conn4.createStatement();
						ResultSet rs4 = st4.executeQuery("select * from rfid where location='A4-1';");
						
							while (rs4.next()) {
								out.print("<tr>");
								out.print("<td>" + rs4.getString("rfidTagId") + "</td>");
								out.print("<td>" + rs4.getString("deviceName") + "</td>");
								out.print("<td>" + rs4.getString("deviceNum") + "</td>");
								out.print("<td>" + rs4.getString("identificationNum") + "</td>");
								out.print("<td>" + rs4.getString("location") + "</td>");
								out.print("<td>" + rs4.getString("custodian") + "</td>");
								out.print("<td>" + rs4.getString("responsiblePerson") + "</td></tr>");
								}
							st4.close();
							rs4.close();
							conn4.close();
						%>
						</tbody>
						</table>
            </div>
			<div id="update">
				<form action="update.jsp" method="post">
					<fieldset>
						<legend class="legend">设备编辑</legend>
						<table>
							<tbody>
								<tr>
									<td><div class="insertlabel">原rfid标签号：</div></td>
									<td><div class="insertlabel">
											<input type="text" id="tq" readonly="readonly" name="rfidNum">
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">设备名称：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="deviceName" id="deviceName" required>
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">设备型号：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="deviceNum" id="deviceNum" required>
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">出厂编号：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="identificationNum" id="identificationNum" required>
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">存放地点：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="location" id="location" required>
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">保管人：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="custodian" id="custodian" required>
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">责任人：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="responsiblePerson" id="responsiblePerson" required>
										</div></td>
								</tr>
								<tr>
									<td></td>
									<td><div>
											<input class="button" type="submit" id="insertB">
										</div></td>
								</tr>


							</tbody>
						</table>
					</fieldset>
				</form>
			</div>

		</div>

	</div>
<% 
Class.forName("com.mysql.jdbc.Driver");
Connection conn5 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid", "root", "1025");
Statement st5 = conn5.createStatement();
String sql5="SELECT Count(rfid.deviceNum),rfid.deviceNum FROM rfid  GROUP BY rfid.deviceNum ORDER BY COUNT(rfid.deviceNum) DESC";
ResultSet rs5 = st.executeQuery(sql5);
String count="";
String num="";
if (rs5.next()) {
	count=rs5.getString("Count(rfid.deviceNum)");
	num=rs5.getString("deviceNum");
}
%>
<p id="scount" display="none"><%=count %></p>
<p id="snum" display="none"><%=num %></p>

</body>
<script src="./main.js"></script>
</html>