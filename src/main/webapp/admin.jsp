<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Pack.LoginManager"%>
<%@page import="Pack.Authentication" %>
<%
	LoginManager loginManager = LoginManager.getInstance(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
      <input type="datetime-local" id="voting-time"
       name="voting-time" value="2022-03-04T18:00"
       min="2022-03-04T00:00" max="2022-08-14T00:00">
       <% if(adminCheck) {%>
      <input type="submit" value="Submit">
      <%}else {%>
       <input type="submit" value="Submit" disabled>
       <% } %>
    </form>
</body>
</html>