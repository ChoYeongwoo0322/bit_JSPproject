<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background: linear-gradient(#ffffff, #9198e5);
	height: 100vh;
	padding: 0;
}

h1 {
	text-align: center;
}

table {
	margin: 0 auto;
	text-align: center;
	width: 50%;
	border:
}
</style>
</head>
<body>
	<h1>결과보기</h1>
	<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://13.209.35.25:3307/db01?useSSL=false&characterEncoding=UTF-8&serverTimezone=UTC";
	con = DriverManager.getConnection(url, "lion", "1234");
	String sql = "select u.idx, u.id, u.pwd, u.email, u.phone, u.sysdate, r.regionNm as region from user u"
			+ " inner join region r on u.region = r.regionPk";
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	%>
	<div>
		<table>
			<thead>
				<tr id=\"test\">
					<td>등수</td>
					<td>가게명</td>
					<td>투표율</td>
				</tr>
			</thead>
			<tbody>
				<%
				while (rs.next()) {
					String idx = rs.getString("idx");
					String id = rs.getString("id");
					String pwd = rs.getString("pwd");
					out.println("<tr>");
					out.println("<td>" + id + "</td>");
					out.println("<td>" + pwd + "</td>");
					out.println("<td>" + "삭제" + "</td>");
					out.println("</tr>");
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>