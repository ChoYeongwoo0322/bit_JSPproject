<%@page import="Pack.Authentication"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println(id + " " + pwd);
		Authentication at = new Authentication();
		String name = at.isMember(id, pwd);
		
		
		if(name != null)
		{ 
			session.setAttribute("member", "ok");
			System.out.println(name);
			%>
			<jsp:forward page="index.jsp">
				<jsp:param value="<%=name%>" name="name"/>
			</jsp:forward>
			<%		
		}
		else
		{
			response.sendRedirect("login.jsp");	
		}
	%>
</body>
</html>