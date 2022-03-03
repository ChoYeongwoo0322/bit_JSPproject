<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
</head>
<body>
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
				for="tong">오늘의 통닭</label>
		</div>
		<div>
			<input type="radio" id="tong" name="res_nm" value="4"> <label
				for="tong">하나우동</label>
		</div>
		<div>
			<input type="radio" id="sal" name="res_nm" value="5"> <label
				for="sal">살로만</label>
		</div>
		<div>
			<input type="submit" value="투표">
		</div>
	</form>
	
</body>
</html>