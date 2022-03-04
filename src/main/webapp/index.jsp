<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Driver"%>
<%@ page import="java.util.Objects"%>
<%@ page import="Pack.LoginManager"%>

<%
LoginManager loginManager = LoginManager.getInstance();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap')
	;

body {
	/* background: linear-gradient(#e66465, #9198e5); */
	
}

.wrapper {
	width: 100%;
	padding: 0 2rem;
	text-align: center;
}

.polaroid {
	background: #fff;
	padding: 1rem;
	box-shadow: 0 0.25rem 1rem rgba(0, 0, 0, 0.2);
}

.caption {
	font-size: 1.125rem;
	text-align: center;
	line-height: 2em;
}

.item {
	display: inline-block;
	margin-top: 2rem;
	filter: grayscale(100%);
}

.item .polaroid:before {
	content: "";
	position: absolute;
	z-index: -1;
	transition: all 0.35s;
}

.item:nth-of-type(4n+1) {
	transform: scale(0.8, 0.8) rotate(5deg);
	transition: all 0.35s;
}

.item:nth-of-type(4n+1) .polaroid:before {
	transform: rotate(6deg);
	height: 20%;
	width: 47%;
	bottom: 30px;
	right: 12px;
	box-shadow: 0 2.1rem 2rem rgba(0, 0, 0, 0.4);
}

.item:nth-of-type(4n+2) {
	transform: scale(0.8, 0.8) rotate(-5deg);
	transition: all 0.35s;
}

.item:nth-of-type(4n+2) .polaroid:before {
	transform: rotate(-6deg);
	height: 20%;
	width: 47%;
	bottom: 30px;
	left: 12px;
	box-shadow: 0 2.1rem 2rem rgba(0, 0, 0, 0.4);
}

.item:nth-of-type(4n+4) {
	transform: scale(0.8, 0.8) rotate(3deg);
	transition: all 0.35s;
}

.item:nth-of-type(4n+4) .polaroid:before {
	transform: rotate(4deg);
	height: 20%;
	width: 47%;
	bottom: 30px;
	right: 12px;
	box-shadow: 0 2.1rem 2rem rgba(0, 0, 0, 0.3);
}

.item:nth-of-type(4n+3) {
	transform: scale(0.8, 0.8) rotate(-3deg);
	transition: all 0.35s;
}

.item:nth-of-type(4n+3) .polaroid:before {
	transform: rotate(-4deg);
	height: 20%;
	width: 47%;
	bottom: 30px;
	left: 12px;
	box-shadow: 0 2.1rem 2rem rgba(0, 0, 0, 0.3);
}

.item:hover {
	filter: none;
	transform: scale(1, 1) rotate(0deg) !important;
	transition: all 0.35s;
}

.item:hover .polaroid:before {
	content: "";
	position: absolute;
	z-index: -1;
	transform: rotate(0deg);
	height: 90%;
	width: 90%;
	bottom: 0%;
	right: 5%;
	box-shadow: 0 1rem 3rem rgba(0, 0, 0, 0.2);
	transition: all 0.35s;
}

.indextitle {
	text-align: center;
}

a {
	text-decoration-line: none;
	color: black;
}

.title {
	font-size: 20px;
	font-family: 'Jua', sans-serif;
	margin: 8px;
}
</style>
</head>
<body>
	<div class="indextitle">
		<%
		String userId = request.getParameter("userId");

		String check = loginManager.getUserID(session);
		if (check == null) {
		%>
		<div class="title">
			<p> <a href="login.jsp" class="title">로그인</a>
			</p>
		</div>
		<%
		} else {
		%>
		<div class="title">
			<p> <a href="logout.jsp" class="title">로그아웃</a><br>
			</p>
		</div>
		<%
		}
		%>
		<div class="title">
			<p> <a href="vote.jsp" class="title">투표하러가기</a>
			</p>
		</div>
		<div class="title">
			<p> <a href="join.jsp" class="title">회원가입</a>
			</p>
		</div>

	</div>
	<div class="wrapper">
		<div class="item">
			<div class="polaroid">
				<Image
					src="https://s3-ap-northeast-1.amazonaws.com/dcreviewsresized/300_300_20201012114052523_photo_0f71b8e39c09.jpg"
					width="390" height="220" alt="" />
				<div class="caption">한돈애</div>
			</div>
		</div>
		<div class="item">
			<div class="polaroid">
				<Image src="https://t1.daumcdn.net/cfile/blog/99EA533D5D4B6AC520"
					width="390" height="220" alt="" />
				<div class="caption">초선과여포</div>
			</div>
		</div>
		<div class="item">
			<div class="polaroid">
				<Image
					src="http://res.heraldm.com/phpwas/restmb_idxmake.php?idx=507&simg=/content/image/2017/12/20/20171220000900_0.jpg"
					width="390" height="220" alt="" />
				<div class="caption">오늘의통닭</div>
			</div>
		</div>
		<div class="item">
			<div class="polaroid">
				<Image
					src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbJBptc%2FbtqBZOcMAkG%2FbLFnAD8z3v3IhBDFymYaCk%2Fimg.jpg"
					width="390" height="220" alt="" />
				<div class="caption">하나우동</div>
			</div>
		</div>
		<div class="item">
			<div class="polaroid">
				<Image
					src="https://ai.esmplus.com/foodjang01/images/221400244_b_1.jpg"
					width="390" height="220" alt="" />
				<div class="caption">살로만</div>
			</div>
		</div>
		<!-- <div class="item">
			<div class="polaroid">
				<Image src="/image/mokomoko.gif" width="390" height="220" alt="" />
				<div class="caption">굶기</div>
			</div>
		</div> -->
	</div>
	</div>
</body>
</html>