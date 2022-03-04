<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="Pack.LoginManager"%>
<%@page import="Pack.Authentication" %>
<%@page import="java.util.Calendar"%>
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
	<% request.setCharacterEncoding("UTF-8");%>
	<%
	Calendar cal = Calendar.getInstance();
	long currentTime = cal.getTimeInMillis();
	Authentication autt = new Authentication();
	String voteTime = autt.getVoteTime();
	String dueYear = voteTime.substring(0, 4);
	String dueMonth = voteTime.substring(5, 7);
	String dueDate = voteTime.substring(8, 10);
	String dueHour = voteTime.substring(11, 13);
	String dueMinute = voteTime.substring(14, 16);
	cal.set(Integer.parseInt(dueYear), Integer.parseInt(dueMonth) - 1, Integer.parseInt(dueDate), Integer.parseInt(dueHour),
			Integer.parseInt(dueMinute));
	long tmpTime = cal.getTimeInMillis();
	%>
	<%
	String choice = request.getParameter("rad");
	String check = loginManager.getUserID(session);
	Authentication aut = new Authentication();
	int idx = aut.getUserIdx(check);
	Boolean voteCheck = aut.isVoted(idx);
	if (currentTime - tmpTime < 0) {
		if (check == null) {
			out.println("<html><body><script>");
			out.println("alert('로그인을 하세요');location.href=\"login.jsp\";</script></body></html>");
		} else {
			if (voteCheck) {
		out.println("<html><body><script>");
		out.println("alert('이미 투표를 하셨습니다.'); history.go(-2)</script></body></html>");
		return;
			} else {
		if (aut.setVoted(idx, choice)) {
			out.println("<html><body><script>");
			out.println("alert('투표완료!'); location.href=\"result.jsp\";</script></body></html>");
		} else {
			out.println("<html><body><script>");
			out.println("alert('투표실패'); location.href=\"index.jsp\";</script></body></html>");
		}
			}
		}
	} else {
		out.println("<html><body><script>");
		out.println("alert('투표시간이 지났습니다.');location.href=\"index.jsp\";</script></body></html>");
	}
	%>
</body>
</html>