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
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pwd");
		
		if(loginManager.isValid(userId, userPw)){
			session.setAttribute("userId", userId);
		        
	        //이미 접속한 아이디인지 체크한다.
	        //out.println(userId);
	        //out.println(loginManager.isUsing(userId));
	        loginManager.printloginUsers();
	        if(loginManager.isUsing(userId)){
		%>
				이미 접속중입니다. 기존의 접속을 종료하시겠습니까?<P>
           			<a href="disconnect.jsp">예 </a>
           			<a href="login.jsp">아니오</a>
		<%
	        }else{
	            loginManager.setSession(session, userId);
	            %>
	    		<jsp:forward page="index.jsp">
	    			<jsp:param value="<%=userId%>" name="userId"/>
	    		</jsp:forward>
	    		<%	
	        }
		%>
		<%
	    }else{
		%>
	        <script>
	            alert("로그인후 이용해 주세요.");
	            location.href = "login.jsp";
	        </script>
		<% 
	    }
		%>
	%>
</body>
</html>