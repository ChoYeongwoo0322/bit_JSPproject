<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="Pack.LoginManager"%>
<%@page import="Pack.Authentication" %>
<%
	LoginManager loginManager = LoginManager.getInstance(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");%>
	<% 
	String choice = request.getParameter("res_nm");
	String check = loginManager.getUserID(session);

	Authentication aut = new Authentication();
	int idx = aut.getUserIdx(check);
	
	Boolean voteCheck = aut.isVoted(idx);
	
	if(voteCheck){
		out.println ("<html><body><script>");
		out.println ("alert('이미 투표를 하셨습니다.'); history.go(-2)</script></body></html>");
		return;
	}else {
		if(aut.setVoted(idx, choice)){
			out.println ("<html><body><script>");
			out.println ("alert('투표완료!'); location.href=\"result.jsp\";</script></body></html>");
		}else{
			out.println ("<html><body><script>");
			out.println ("alert('투표실패'); location.href=\"index.jsp\";</script></body></html>");
		}
	}
	%>
</body>
</html>