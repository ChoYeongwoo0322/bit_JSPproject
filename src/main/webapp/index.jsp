<%@page import="java.io.IOException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
PreparedStatement pstmt = null;
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://13.125.251.30:3307/db01?useSSL=false&characterEncoding=UTF-8&serverTimezone=UTC";
con = Driver.getConnection(url, "lion", "1234");
String name_list = "insert into user values(null, ?, )";
pstmt = con.prepareStatement(name_list);
pstmt.setString(1, id);
ResultSet rs = pstmt.executeQuery();
rs.next();

%>
	<%=request.getParameter("id") %>
	
	<%=request.getParameter("pwd")%>
</body>
</html>