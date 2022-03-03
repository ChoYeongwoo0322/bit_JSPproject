<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>

<body>
	<form action="loginCheck.jsp" method="post">
		<label>ID: </label> <input name="id" type="text"><br> 
		<label>PW: </label> <input name="pwd" type="password"><br> 
		<input type="submit" value="로그인">
	</form>
</body>

</html>