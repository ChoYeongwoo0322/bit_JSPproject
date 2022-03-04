<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SignUp</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	/* font-family: "Noto Sans KR", sans-serif; */
}

a {
	text-decoration: none;
	color: black;
	font-family: 'Jua', sans-serif;
}

/* li {
   list-style: none;
} */
.wrap {
	margin-top: 30px;
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	background: rgba(0, 0, 0, 0);
}

.login {
	width: 500px;
	height: 100%;
	background: white;
	border-radius: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	border: 2px solid #6667AB;
}

h2 {
	color: #6667AB;
	font-size: 2em;
	font-family: 'Jua', sans-serif;
}

h4 {
	font-family: 'Jua', sans-serif;
}

.title {
	margin-top: 20px;
}

.login_sns {
	padding: 20px;
	display: flex;
}

.login_sns li {
	padding: 0px 15px;
}

.login_sns a {
	width: 50px;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 10px;
	border-radius: 50px;
	background: white;
	font-size: 20px;
	box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.4), -3px -3px 5px
		rgba(0, 0, 0, 0.1);
}

.login_id {
	margin-top: 20px;
	margin-bottom: 10px;
	width: 80%;
	text-align: center;
}

.login_id input {
	width: 100%;
	height: 50px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}

.login_pw {
	margin-top: 10px;
	margin-bottom: 10px;
	width: 80%;
	text-align: center;
}

.login_pw input {
	width: 100%;
	height: 50px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}

.login_etc {
	padding: 10px;
	width: 80%;
	font-size: 14px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-weight: bold;
}

.submit {
	margin-top: 15px;
	width: 80%;
}

.submit input {
	width: 100%;
	height: 50px;
	border-radius: 40px;
	font-size: 1.2em;
	border: 2px solid black;
}

.submit input:hover {
	background-color: #6667AB;
	color: white;
}

.reset {
	background-color: white;
	color: black;
	border: 4px solid black;
	border-radius: 30px;
	margin-top: 10px;
	padding: 10px 10px;
	border: 2px solid black;
	outline: none;
}

.reset:hover {
	background-color: #f44336;
	color: white;
}

input {
	cursor: pointer;
	font-family: 'Jua', sans-serif;
}

div {
	font-family: 'Jua', sans-serif;
}

.loginbutton {
	width: 50%;
	margin: 15px;
	background-color: white;
	color: black;
	border: 2px solid black;
	border-radius: 30px;
	margin-top: 10px;
	padding: 10px 10px;
	outline: none;
}

#backdiv:hover {
	background-color: #6667AB;
}

#backid:hover {
	color: white;
}
</style>

</head>

<body>
	<div class="wrap">
		<form action="loginCheck.jsp" method="post">
			<div class="login">
				<h2 class="title">로그인</h2>
				<div class="login_id">
					<h4>ID</h4>
					<input type="text" name="id" id="id" placeholder="사용하실 아이디를 입력해주세요">
				</div>
				<div class="login_pw">
					<h4>Password</h4>
					<input type="password" name="pwd" id="pwd"
						placeholder="비밀번호를 입력해주세요">
				</div>
				<input type="submit" value="로그인" class="loginbutton">
			</div>
		</form>
	</div>
</body>

</html>
