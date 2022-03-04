<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="Pack.LoginManager"%>
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
<% request.setCharacterEncoding("utf-8");%>
	<% 
	String choice = request.getParameter("res_nm");
	String check = loginManager.getUserID(session);
	Connection con=null;
	PreparedStatement pstmt1=null;
	PreparedStatement pstmt2=null;
	PreparedStatement pstmt3=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://13.209.35.25:3307/db01?useSSL=false&characterEncoding=UTF-8&serverTimezone=UTC";
		con = DriverManager.getConnection(url, "lion", "1234");
		String getUserIdx = "select idx from user where id=?";
		pstmt1 = con.prepareStatement(getUserIdx);
		pstmt1.setString(1, check);
		ResultSet rs = pstmt1.executeQuery();
		rs.next();
		
		String getCountVoted = "select count(*) from voted where user_idx=?";
		pstmt2 = con.prepareStatement(getCountVoted);
		pstmt2.setInt(1, rs.getInt(1));
		ResultSet rs2 = pstmt2.executeQuery();
		rs2.next();
		
		if(rs2.getInt(1)>=1){
			out.println ("<html><body><script>");
			out.println ("alert('이미 투표를 하셨습니다.'); history.go(-2)</script></body></html>");
			return;
		}else {
			String setVoted =  "insert into voted values(null,?,?)";
			pstmt3 = con.prepareStatement(setVoted);
			pstmt3.setInt(1, rs.getInt(1));
			pstmt3.setInt(2, Integer.parseInt(choice));
			pstmt3.executeUpdate();
			out.println ("<html><body><script>");
			out.println ("alert('투표완료!'); location.href=\"result.jsp\";</script></body></html>");
		}
		
	}catch(ClassNotFoundException ce){
		System.out.println(ce.getMessage());
	}catch(SQLException se){
		System.out.println(se.getMessage());
	}finally{
		try{
			if(pstmt3!=null) pstmt3.close();
			if(con!=null) con.close();
		}catch(SQLException se){
			System.out.println(se.getMessage());
		}
	}
	%>
</body>
</html>