<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
//session을 확~~~끊어 버린다. 이시점에 LoginManager의 valueUnbound()가 호출된다.
	session.invalidate();
	response.sendRedirect("index.jsp");
%>