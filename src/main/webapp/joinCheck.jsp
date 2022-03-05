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
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pwd");
		String userName = request.getParameter("name");
		if(!loginManager.isValid(userId, userPw)){
				Authentication aut = new Authentication();
				boolean check = aut.addmember(userId, userPw, userName);
				if(check == true){%>
				<script>
			    alert("<%=userId%>님! 성공적으로 가입되었습니다.");
			    location.href = "index.jsp";
			    </script>
				<%}else{%>
				<script>
				alert("오류로 인해 가입에 실패했습니다.");
				location.href = "join.jsp";
				</script>
				<%}
		}else{%>
		<script>
		alert("아이디가 중복되었습니다.");
		location.href = "join.jsp";
	    </script>
		<%}%>
</body>
</html>