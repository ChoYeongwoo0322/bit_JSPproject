<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Pack.Authentication" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String selectTime = request.getParameter("voting-time");
	System.out.println(selectTime);
	Authentication aut = new Authentication();
	Boolean voteCheck = aut.setTime(selectTime);
	
	if(voteCheck) {
		out.println ("<html><body><script>");
		out.println ("alert('시간설정이 완료되었습니다.');location.href=\"index.jsp\";</script></body></html>");
	}
	%>
</body>
</html>