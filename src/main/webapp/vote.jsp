<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="Pack.LoginManager"%>
<%@page import="Pack.Authentication"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
<style>
body {
	margin-top: 50px;
}

.rad-label {
	display: flex;
	align-items: center;
	border-radius: 100px;
	padding: 14px 16px;
	margin: 10px 0;
	cursor: pointer;
	transition: .3s;
}

.rad-label:hover, .rad-label:focus-within {
	background: hsla(0, 0%, 80%, .14);
}

.rad-input {
	position: absolute;
	left: 0;
	top: 0;
	width: 1px;
	height: 1px;
	opacity: 0;
	z-index: -1;
}

.rad-design {
	width: 22px;
	height: 22px;
	border-radius: 100px;
	background: linear-gradient(to right bottom, hsl(154, 97%, 62%),
		hsl(225, 97%, 62%));
	position: relative;
}

.rad-design::before {
	content: '';
	display: inline-block;
	width: inherit;
	height: inherit;
	border-radius: inherit;
	background: hsl(0, 0%, 90%);
	transform: scale(1.1);
	transition: .3s;
}

.rad-input:checked+.rad-design::before {
	transform: scale(0);
}

.rad-text {
	color: hsl(0, 0%, 60%);
	margin-left: 14px;
	letter-spacing: 3px;
	text-transform: uppercase;
	font-size: 18px;
	font-weight: 900;
	transition: .3s;
}

.rad-input:checked ~.rad-text {
	color: hsl(0, 0%, 40%);
}

.voteBody {
	margin: 0 auto;
	width: 40%;
}

body {
	text-align: center;
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
</style>
</head>
<body>
	 <% 
	 Authentication aut = new Authentication();
	 LocalTime now = LocalTime.now();
	 String voteTime = aut.getVoteTime();
	 SimpleDateFormat f = new SimpleDateFormat("HH:mm", Locale.KOREA);
	 int newCurrentTime = now.getHour()+9;
	 if(newCurrentTime>24){
		 newCurrentTime = newCurrentTime%24;
	 }
	 Date currentTime = f.parse(newCurrentTime+":"+now.getMinute());
	 Date tmpTime = f.parse(voteTime); 
	 long diff = currentTime.getTime() - tmpTime.getTime();
	 %>
	 <h1>매일<%= voteTime %> 까지 투표 가능</h1>
	 <h2 id="clock" style="color:black;">clock</h2>
	<script type="text/javascript" src="clock.js?v=<%=System.currentTimeMillis() %>"></script>
	<form method="post" action="voteOk.jsp">
		<div class="voteBody">
			<label class="rad-label"> <input type="radio"
				class="rad-input" name="rad" id="han" value="1" checked="checked">
				<span class="rad-design"></span> <span class="rad-text">한돈애</span>
			</label> <label class="rad-label"> <input type="radio"
				class="rad-input" name="rad" id="cho" value="2"> <span
				class="rad-design"></span> <span class="rad-text">오늘통닭</span>
			</label> <label class="rad-label"> <input type="radio"
				class="rad-input" name="rad" id="tong" value="3"> <span
				class="rad-design"></span> <span class="rad-text">화돈</span>
			</label> <label class="rad-label"> <input type="radio"
				class="rad-input" name="rad" id="tong" value="4"> <span
				class="rad-design"></span> <span class="rad-text">하나우동</span>
			</label> <label class="rad-label"> <input type="radio"
				class="rad-input" name="rad" id="sal" value="5"> <span
				class="rad-design"></span> <span class="rad-text">초선과여포</span>
			</label>
		</div>

		<%
		if (diff>0) {
		%>
		<div>
			<p style="color: red">* 투표가 마감되었습니다 *</p>
		</div>
		<%
		} else {
		%>
		<div>
			<button class="learn-more">
				<span class="circle" aria-hidden="true"> <span
					class="icon arrow"></span>
				</span> <span class="button-text">투표하기</span>
			</button>
		</div>
		<%
		}
		%>
	</form>
	<br>
	<button class="learn-more" onclick="window.location.href='index.jsp'">
		<span class="circle" aria-hidden="true"> <span
			class="icon arrow"></span>
		</span> <span class="button-text">Main</span>
	</button>

</body>
</html>