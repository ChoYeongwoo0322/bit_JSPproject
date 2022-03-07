<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="Pack.LoginManager"%>
<%@page import="Pack.Authentication" %>
<%@page import="java.time.LocalTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
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
	<%
	request.setCharacterEncoding("UTF-8");
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

	String choice = request.getParameter("rad");
	String check = loginManager.getUserID(session);

	int idx = aut.getUserIdx(check);
	Boolean voteCheck = aut.isVoted(idx);
	if (diff <= 0) {
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