<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="Pack.LoginManager"%>
<%@page import="Pack.Authentication" %>
<%
	LoginManager loginManager = LoginManager.getInstance(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
		out.println ("alert('�̹� ��ǥ�� �ϼ̽��ϴ�.'); history.go(-2)</script></body></html>");
		return;
	}else {
		if(aut.setVoted(idx, choice)){
			out.println ("<html><body><script>");
			out.println ("alert('��ǥ�Ϸ�!'); location.href=\"result.jsp\";</script></body></html>");
		}else{
			out.println ("<html><body><script>");
			out.println ("alert('��ǥ����'); location.href=\"index.jsp\";</script></body></html>");
		}
	}
	%>
</body>
</html>