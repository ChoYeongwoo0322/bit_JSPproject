<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%@page import="java.util.Calendar"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
</head>
<body>
	<h3>투표 종료 시간 2022.03.04 18:00 P.M</h3>
	<%
 	Calendar c = Calendar.getInstance();
	int hour = c.get(Calendar.HOUR_OF_DAY);
	int minute = c.get(Calendar.MINUTE);
	int second = c.get(Calendar.SECOND);
	
	Calendar cal = Calendar.getInstance();
	long currentTime = cal.getTimeInMillis();
	cal.set(2022, Calendar.MARCH, 4, 18, 0); 
	long tmpTime = cal.getTimeInMillis();
	%>
	현재시간은
	<%=hour%>시
	<%=minute%>분
	<%=second%>초입니다.
	<form method="post" action="voteOk.jsp">
		<div>
			<input type="radio" id="han" name="res_nm" value="1" checked>
			<label for="han">한돈애</label>
		</div>
		<div>
			<input type="radio" id="cho" name="res_nm" value="2"> <label
				for="cho">초선과 여포</label>
		</div>
		<div>
			<input type="radio" id="tong" name="res_nm" value="3"> <label
				for="tong">오늘통닭</label>
		</div>
		<div>
			<input type="radio" id="tong" name="res_nm" value="4"> <label
				for="tong">하나우동</label>
		</div>
		<div>
			<input type="radio" id="sal" name="res_nm" value="5"> <label
				for="sal">화돈</label>
		</div>
		<%if(currentTime - tmpTime > 0 ){ %>
		<div>
			<input type="submit" value="투표" disabled>
		</div>
		<%} else { %>
		<div>
			<input type="submit" value="투표">
		</div>
		<%} %>
	</form>

</body>
</html>