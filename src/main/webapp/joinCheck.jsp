<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Pack.LoginManager"%>
<%@ page import="Pack.Authentication"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<%
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pwd");
		String userName = request.getParameter("name");
		if(!loginManager.isValid(userId, userPw)){
			System.out.println("test");
			Authentication aut = new Authentication();
			boolean check = aut.addmember(userId, userPw, userName);
			if(check == true){
				out.println ("<html><body><script>");
				out.println ("alert('" + userId + "님! 성공적으로 가입되었습니다.'); history.go(-2)</script></body></html>");
			}else{
			out.println ("<html><body><script>");
			out.println ("alert('오류로 인해 가입에 실패했습니다.'); history.go(-2)</script></body></html>");
			}
		}else{
			out.println ("<html><body><script>");
			out.println ("alert('아이디가 중복되었습니다.'); history.go(-1)</script></body></html>");
		}
		
	%>
</body>
</html>