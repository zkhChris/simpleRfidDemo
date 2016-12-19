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
			<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn5 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid", "root", "1025");
				Statement st5 = conn5.createStatement();
				String sql5 = "SELECT Count(rfid.deviceNum),rfid.deviceNum FROM rfid  GROUP BY rfid.deviceNum ORDER BY COUNT(rfid.deviceNum) DESC";
				ResultSet rs5 = st5.executeQuery(sql5);
				String count = "";
				String num = "";
				if (rs5.next()) {
					count = rs5.getString("Count(rfid.deviceNum)");
					num = rs5.getString("deviceNum");
				}
			%>
			<p id="scount" class="noDisplay"><%=count%></p>
			<p id="snum" class="noDisplay"><%=num%></p>

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
				<%
					Connection conn10 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid", "root", "1025");
					Statement st10 = conn10.createStatement();
					ResultSet rs10 = st10.executeQuery("select distinct deviceName from rfid order by deviceName asc");
					String deviceName = "";
					while (rs10.next()) {
						deviceName += rs10.getString("deviceName") + ",";
					}
					//out.print(deviceName);
					conn10.close();
					st10.close();
					rs10.close();
				%>
				<%
					Connection conn11 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid", "root", "1025");
					Statement st11 = conn11.createStatement();
					ResultSet rs11 = st11.executeQuery("select distinct rfidTagId from rfid order by rfidTagId asc");
					String tagId = "";
					while (rs11.next()) {
						tagId += rs11.getString("rfidTagId") + ",";
					}
					//out.print(tagId);
					conn11.close();
					st11.close();
					rs11.close();
				%>
				<%
					Connection conn12 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid", "root", "1025");
					Statement st12 = conn12.createStatement();
					ResultSet rs12 = st12.executeQuery("select distinct deviceNum from rfid order by deviceNum asc");
					String deviceNum = "";
					int w1 = 0;
					while (rs12.next()) {
						deviceNum += rs12.getString("deviceNum") + ",";
						w1++;
					}
					//out.print(deviceNum);
					conn12.close();
					st12.close();
					rs12.close();
				%>
				<%
					Connection conn13 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid", "root", "1025");
					Statement st13 = conn13.createStatement();
					ResultSet rs13 = st13
							.executeQuery("select distinct identificationNum from rfid order by identificationNum asc");
					String identy = "";
					while (rs13.next()) {
						identy += rs13.getString("identificationNum") + ",";
					}
					//out.print(identy);
					conn13.close();
					st13.close();
					rs13.close();
				%>
				<%
					Connection conn14 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid", "root", "1025");
					Statement st14 = conn14.createStatement();
					ResultSet rs14 = st14.executeQuery("select distinct location from rfid order by location asc");
					String loc = "";
					int q = 0;
					while (rs14.next()) {
						loc += rs14.getString("location") + ",";
						q++;
					}
					//out.print(loc);
					conn14.close();
					st14.close();
					rs14.close();
				%>
				<%
					Connection conn15 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid", "root", "1025");
					Statement st15 = conn15.createStatement();
					ResultSet rs15 = st15.executeQuery("select distinct custodian from rfid order by custodian asc");
					String custodian = "";
					int w2 = 0;
					while (rs15.next()) {
						w2++;
						custodian += rs15.getString("custodian") + ",";
					}
					//out.print(custodian);
					conn15.close();
					st15.close();
					rs15.close();
				%>
				<%
					Connection conn16 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid", "root", "1025");
					Statement st16 = conn16.createStatement();
					ResultSet rs16 = st16
							.executeQuery("select distinct responsiblePerson from rfid order by responsiblePerson asc");
					String responsiblePerson = "";
					while (rs16.next()) {
						responsiblePerson += rs16.getString("responsiblePerson") + ",";
					}
					//out.print(responsiblePerson);
					conn16.close();
					st16.close();
					rs16.close();
				%>
				<%
					Connection conn17 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/rfid", "root", "1025");
					Statement st17 = conn17.createStatement();
					ResultSet rs17 = st17.executeQuery("select buyTime from rfid order by buyTime asc");
					String lastB = "";
					while (rs17.next()) {
						lastB = rs17.getString("buyTime");
					}
					//out.print(responsiblePerson);
					conn17.close();
					st17.close();
					rs17.close();
				%>
				<script>
				var t1="<%=tagId%>".split(",");
				t1.pop();
				var t2="<%=deviceName%>".split(",");
				t2.pop();
				var t3="<%=deviceNum%>".split(",");
				t3.pop();
				var t4="<%=identy%>".split(",");
				t4.pop();
				var t5="<%=loc%>".split(",");
				t5.pop();
				var t6="<%=custodian%>".split(",");
				t6.pop();
				var t7="<%=responsiblePerson%>".split(",");
				t7.pop();
				</script>
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
						<tr>
							<td><input class="button" type="button" id="tongji"
								value="统计"></td>
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
											<input type="text" name="rfidTagId" id="rfidTagId" required
												autocomplete="off">
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">设备名称：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="deviceName" id="deviceName" required
												autocomplete="off">
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">设备型号：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="deviceNum" id="deviceNum" required
												autocomplete="off">
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">出厂编号：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="identificationNum"
												id="identificationNum" required autocomplete="off">
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">存放地点：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="location" id="location" required
												autocomplete="off">
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">保管人：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="custodian" id="custodian" required
												autocomplete="off">
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">责任人：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="responsiblePerson"
												id="responsiblePerson" required autocomplete="off">
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
							while ((temp = bufferedReader.readLine()) != null) {
								out.print(temp);
							}
							bufferedReader.close();
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
							String f[][] = new String[50][50];
							int i = 1;
							while (rs.next()) {
								f[i][1] = rs.getString("rfidTagId");
								f[i][2] = rs.getString("deviceName");
								f[i][3] = rs.getString("deviceNum");
								f[i][4] = rs.getString("identificationNum");
								f[i][5] = rs.getString("location");
								f[i][6] = rs.getString("custodian");
								f[i][7] = rs.getString("responsiblePerson");
								out.print("<tr>");
								out.print("<td>" + rs.getString("rfidTagId") + "</td>");
								out.print("<td>" + rs.getString("deviceName") + "</td>");
								out.print("<td>" + rs.getString("deviceNum") + "</td>");
								out.print("<td>" + rs.getString("identificationNum") + "</td>");
								out.print("<td>" + rs.getString("location") + "</td>");
								out.print("<td>" + rs.getString("custodian") + "</td>");
								out.print("<td>" + rs.getString("responsiblePerson") + "</td>");
								i++;
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
			<script>
						var info=function(tagid,devicename,devicenum,identinum,location,custodian,respon){
							this.tagid=tagid;
							this.devicename=devicename;
							this.devicenum=devicenum;
							this.identy=identinum;
							this.location=location;
							this.custodian=custodian;
							this.respon=respon;
						};
						var num=<%=i - 1%>;
						var arr=new Array();
					<%for (int p = 1; p < i; p++) {%>
							var s=new info("<%=f[p][1]%>","<%=f[p][2]%>","<%=f[p][3]%>","<%=f[p][4]%>","<%=f[p][5]%>","<%=f[p][6]%>","<%=f[p][7]%>
				");
				arr.push(s);
			<%}%>
				console.log(arr);
			</script>

			<div id="selectGroup">
				<table>
					<p id="selecLa">查询</p>
					<tbody>
						<tr>
							<td><div class="insertlabel bre">查询项目：</div></td>
							<td><select class="inputlabel bre" id="s1">
									<option>--请选择--</option>
									<option value="RFID标签号">RFID标签号</option>
									<option value="设备名称">设备名称</option>
									<option value="设备型号">设备型号</option>
									<option value="出厂编号">出厂编号</option>
									<option value="存放地点">存放地点</option>
									<option value="保管人">保管人</option>
									<option value="责任人">责任人</option>
							</select></td>
						</tr>



						<tr>
							<td><div class="insertlabel bre">查询值：</div></td>
							<td><div id="seleTar">
									<input type="text" class="inputlabel bre" datalist="">
								</div></td>
						</tr>

						<tr>
							<td></td>
							<td><button class="button" id="selectButtont">查询</button></td>
						</tr>
					</tbody>

				</table>
			</div>
			<div id="showSelectMenu"></div>
			<div id="count" class="noDisplay">
				<table class="rfidTable">
					<tbody>
						<tr>
							<th>关键词</th>
							<th>数值</th>
						</tr>
						<tr>
							<td>库存数</td>
							<td><%=i - 1%></td>
						</tr>
						<tr>
							<td>存放地点数</td>
							<td><%=q%></td>
						</tr>
						<tr>
							<td>不同的设备型号</td>
							<td><%=w1%></td>
						</tr>
						<tr>
							<td>管理员数</td>
							<td><%=w2%></td>
						</tr>
						<tr>
							<td>库存最多的型号</td>
							<td><%=num%></td>
						</tr>
						<tr>
							<td>它的数目是</td>
							<td><%=count%></td>
						</tr>
						<tr>
							<td>最后一次购买日期</td>
							<td><%=lastB%></td>
						</tr>
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
											<input type="text" name="deviceName" id="deviceName" required
												autocomplete="off">
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">设备型号：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="deviceNum" id="deviceNum" required
												autocomplete="off">
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">出厂编号：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="identificationNum"
												id="identificationNum" required autocomplete="off">
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">存放地点：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="location" id="location" required
												autocomplete="off">
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">保管人：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="custodian" id="custodian" required
												autocomplete="off">
										</div></td>
								</tr>
								<tr>
									<td><div class="insertlabel">责任人：</div></td>
									<td><div class="inputlabel">
											<input type="text" name="responsiblePerson"
												id="responsiblePerson" required autocomplete="off">
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

</body>
<script src="./main.js"></script>
</html>