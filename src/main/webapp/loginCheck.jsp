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
		
		Authentication at = new Authentication();
		String user_id = at.isMember(id, pwd);
		
		if(user_id != null)
		{ 
			session.setAttribute("id", id);
			%>
			<jsp:forward page="index.jsp">
				<jsp:param value="<%=user_id%>" name="name"/>
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