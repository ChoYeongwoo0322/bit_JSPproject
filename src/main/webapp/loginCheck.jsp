<%@page import="Pack.LoginManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("id");
	String userPw = request.getParameter("pwd");
	System.out.println(userId);
		if(loginManager.isValid(userId, userPw)){
			session.setAttribute("userId", userId);
		        
	        //이미 접속한 아이디인지 체크한다.
	        //out.println(userId);
	        //out.println(loginManager.isUsing(userId));
	        loginManager.printloginUsers();
	        if(loginManager.isUsing(userId)){
		%>
	이미 접속중입니다. 기존의 접속을 종료하시겠습니까?
	<P>
		<a href="disconnect.jsp">예</a> <a href="login.jsp">아니오</a>
		<%
	        }else{
	            loginManager.setSession(session, userId);
	            %>
	             <script>
	            location.href = "index.jsp"
		
	</script>
		<%-- <jsp:forward page="index.jsp">
			<jsp:param value="<%=userId%>" name="userId" />
		</jsp:forward> --%>
		<%	
	        }
		%>
		<%
	    }else{
		%>
		<script>
	            alert("아이디 또는 비밀번호를 잘못 입력했습니다.\n입력하신 내용을 다시 확인해주세요.");
	            location.href = "login.jsp";
	        </script>
		<%
	    }
		%>
</body>
</html>