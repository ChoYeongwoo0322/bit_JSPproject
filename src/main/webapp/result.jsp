<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Pack.Authentication" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	/* background: linear-gradient(#ffffff, #9198e5); */
	height: 100vh;
	padding: 0;
}

h1 {
	text-align: center;
}

table {
	margin: 0 auto;
	text-align: center;
	padding: 10px;
}

.tableTitle {
	font-size: 20px;
	font-weight: bold;
}

.tableBody {
	
}
</style>
</head>
<body>
	<h1>결과보기</h1>
	<%
	Authentication aut = new Authentication();
	ResultSet rs = aut.getResult();
	int allCount = aut.allCount();
	%>
	<div>
		<table>
			<thead>
				<tr class="tableTitle">
					<td>가게명</td>
					<td>득표수</td>
					<td>득표율</td>
				</tr>
			</thead>
			<tbody class="tableBody">
				<%
				while (rs.next()) {
					String res_nm = rs.getString("r.res_nm");
					String count = rs.getString("count");
					String rate = rs.getString("rate");
					out.println("<tr>");
					out.println("<td>" + res_nm + "</td>");
					out.println("<td>" + count + "</td>");
					out.println("<td>" + rate + "</td>");
					out.println("</tr>");
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>