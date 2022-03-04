<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<h1>시간 설정하기</h1>
<% String check = loginManager.getUserID(session);
Authentication aut = new Authentication();
int idx = aut.getUserIdx(check);

Boolean adminCheck = aut.isAdmin(idx);
System.out.println(adminCheck);
%>
 <form method="post" action="adminOk.jsp">
      <input type="time" id="voting-time"
       name="voting-time" value="18:00"
       min="00:00" max="23:59">
       <% if(adminCheck) {%>
      <input type="submit" value="Submit">
      <%}else {%>
       <input type="submit" value="Submit" disabled>
       <% } %>
    </form>
</body>
</html>