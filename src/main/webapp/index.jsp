<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Driver"%>
<%@ page import="java.util.Objects"%>
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
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap')
	;

* {
	
}

html {
	background:
		url(https://mblogthumb-phinf.pstatic.net/20141001_67/aibb1233_14121517107871hhG8_JPEG/3.jpg?type=w2)
		no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

body {
	font-family: 'Jua', sans-serif;
}

.wrapper {
	width: 100%;
	padding: 0 2rem;
	text-align: center;
}

.polaroid {
	background: #FAFAFA;
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
	
	<script>
		function doNotReload() {
			if ((event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82))
					|| (event.keyCode == 116)) {
				event.keyCode = 0;
				event.cancelBubble = true;
				event.returnValue = false;
			}
		}
		document.onkeydown = doNotReload;
	</script>
	
	<%
	String sessionCheck = loginManager.getUserID(session);
	Authentication aut = new Authentication();
	%>
		<%
		LoginManager lm = new LoginManager();
		for(int i = 0; i < lm.getUserCount();i++){
		%>
				<Image
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw3iIVG5rP3Yie7zj9wBNf32mJBCGNZdtZOA&usqp=CAU"
					width="30" height="30" alt="" />
		
		<%}%>
	<div class="indextitle">
		<%
		//String userId = request.getParameter("userId");
		String check = loginManager.getUserID(session);
		String idsName = aut.getName(check);
		System.out.println(check + "--" + idsName + "환영합니다.");
		
		if (check == null) {
		%>
		<span> <a href="login.jsp" class="">로그인</a>&nbsp;
		</span> <span> <a href="join.jsp" class="">회원가입</a>&nbsp;
		</span>
		<%
		} else {
			
			int idx = aut.getUserIdx(sessionCheck);

			Boolean adminCheck = aut.isAdmin(idx);
		%>
		<span> 
		<label><%=idsName%>님 환영합니다.</label>&nbsp;
		<a href="logout.jsp" class="">로그아웃</a>&nbsp;
		</span>
		<% if(adminCheck) {%>
		<span> <a href="admin.jsp" class="">시간설정(관리자)</a></span>
		 <%}%>
		<%
		}
		%>
		<%
		if (sessionCheck == null) {
		%>
		<span></span>
		<%
		} else {
		%> 
		<span> <a href="vote.jsp" class="">투표하러가기</a>
		</span>
		<%
		}
		%>
		<span> <a href="result.jsp" class="">투표결과보기</a>
		</span>
		
	</div>
	<div class="wrapper">
		<div class="item" onClick="location.href='https://map.naver.com/v5/search/%ED%95%9C%EB%8F%88%EC%95%A0/place/20767050?c=14140171.8356046,4508331.2158242,15,0,0,0,dh&placePath=%3Fentry%253Dbmp'">
			<div class="polaroid">
				<Image
					src="https://s3-ap-northeast-1.amazonaws.com/dcreviewsresized/300_300_20201012114052523_photo_0f71b8e39c09.jpg"
					width="390" height="220" alt="" />
				<div class="caption">한돈애</div>
			</div>
		</div>
		<div class="item" onClick="location.href='https://map.naver.com/v5/search/%EC%B4%88%EC%84%A0%EA%B3%BC%EC%97%AC%ED%8F%AC/place/13149692?c=14139815.7690813,4508175.0987557,15,0,0,0,dh&placePath=%3Fentry%253Dbmp'">
			<div class="polaroid">
				<Image src="https://t1.daumcdn.net/cfile/blog/99EA533D5D4B6AC520"
					width="390" height="220" alt="" />
				<div class="caption">초선과여포</div>
			</div>
		</div>
		<div class="item" onClick="location.href='https://map.naver.com/v5/entry/place/1417398034?c=14139815.7690813,4508175.0987557,15,0,0,0,dh'">
			<div class="polaroid">
				<Image
					src="http://res.heraldm.com/phpwas/restmb_idxmake.php?idx=507&simg=/content/image/2017/12/20/20171220000900_0.jpg"
					width="390" height="220" alt="" />
				<div class="caption">오늘의통닭</div>
			</div>
		</div>
		<div class="item" onClick="location.href='https://map.naver.com/v5/search/%ED%95%98%EB%82%98%EC%9A%B0%EB%8F%99/place/19712875?c=14139785.0782977,4508260.2353750,15,0,0,0,dh&placePath=%3Fentry%253Dbmp'">
			<div class="polaroid">
				<Image
					src="https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbJBptc%2FbtqBZOcMAkG%2FbLFnAD8z3v3IhBDFymYaCk%2Fimg.jpg"
					width="390" height="220" alt="" />
				<div class="caption">하나우동</div>
			</div>
		</div>
		<div class="item" onClick="location.href='https://map.naver.com/v5/search/%ED%99%94%EB%8F%88/place/1813075055?c=14139788.8631604,4508232.7637271,15,0,0,0,dh&placePath=%3Fentry%253Dbmp'">
			<div class="polaroid">
				<Image
					src="https://ai.esmplus.com/foodjang01/images/221400244_b_1.jpg"
					width="390" height="220" alt="" />
				<div class="caption">화돈</div>
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