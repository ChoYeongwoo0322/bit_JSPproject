<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Pack.Authentication"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="chart.css">
<link rel="stylesheet"
	href="https://cdn.rawgit.com/theus/chart.css/v1.0.0/dist/chart.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap')
	;

body {
	/* background: linear-gradient(#ffffff, #9198e5); */
	height: 100vh;
	padding: 0;
	font-family: 'Jua', sans-serif;
}

h1 {
	margin: 0;
	text-align: center;	
}

.btns {
	text-align: center;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
	border-radius: 30px;
}

.button1 {
	background-color: white;
	color: black;
	border: 2px solid #4CAF50;
	font-family: 'Jua', sans-serif;
}

.button1:hover {
	background-color: #4CAF50;
	color: white;
}

.screen {
	margin-top: 100px;
}

.backtoMain {
	text-decoration-line: none;
	color: black;
}

.seconddiv {
	width: 500px;
}

/* 버튼 */
@import url("https://fonts.googleapis.com/css?family=Mukta:700");

button {
	position: relative;
	display: inline-block;
	cursor: pointer;
	outline: none;
	border: 0;
	vertical-align: middle;
	text-decoration: none;
	background: transparent;
	padding: 0;
	font-size: inherit;
	font-family: inherit;
}

button.learn-more {
	width: 12rem;
	height: auto;
}

button.learn-more .circle {
	transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
	position: relative;
	display: block;
	margin: 0;
	width: 3rem;
	height: 3rem;
	background: #282936;
	border-radius: 1.625rem;
}

button.learn-more .circle .icon {
	transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
	position: absolute;
	top: 0;
	bottom: 0;
	margin: auto;
	background: #fff;
}

button.learn-more .circle .icon.arrow {
	transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
	left: 0.625rem;
	width: 1.125rem;
	height: 0.125rem;
	background: none;
}

button.learn-more .circle .icon.arrow::before {
	position: absolute;
	content: "";
	top: -0.25rem;
	right: 0.0625rem;
	width: 0.625rem;
	height: 0.625rem;
	border-top: 0.125rem solid #fff;
	border-right: 0.125rem solid #fff;
	transform: rotate(45deg);
}

button.learn-more .button-text {
	transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	padding: 0.75rem 0;
	margin: 0 0 0 1.85rem;
	color: #282936;
	font-weight: 700;
	line-height: 1.6;
	text-align: center;
	text-transform: uppercase;
}

button:hover .circle {
	width: 100%;
}

button:hover .circle .icon.arrow {
	background: #fff;
	transform: translate(1rem, 0);
}

button:hover .button-text {
	color: #fff;
}
div.charts {
    font-size: 20px;
}
</style>
</head>
<body>
	<div class="screen">
		<h1>결과보기</h1>
		<%
		Authentication aut = new Authentication();
		ResultSet rs = aut.getResult();
		int allCount = aut.allCount();
		%>

		<div class="charts" style="width:30%; margin:0 auto;">
			<p>
				투표 참여 인원 :
				<%=allCount%>
				명
			</p>
			<%
			while (rs.next()) {
				String res_nm = rs.getString("r.res_nm");
				String count = rs.getString("count");
				double rate = (((double) Integer.parseInt(count) / allCount));
				int rateValue = (int) Math.round(rate * 100);
				out.println("<span>" + res_nm + "(" + count + "명" + ")" + "</span>");
				out.println("<div class=\"charts__chart chart--blue chart--p" + rateValue + "\" + data-percent></div>");
			}
			%>
		</div>

		<div class="btns">
			<a href="result.jsp"><button class="button button1">reload</button></a><br>
			<button class="learn-more" onclick="window.location.href='index.jsp'">
				<span class="circle" aria-hidden="true"> <span
					class="icon arrow"></span>
				</span> <span class="button-text">Main</span>
			</button>
		</div>

	</div>

</body>
</html>