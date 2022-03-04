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
	int user_idx=187;
	String check = loginManager.getUserID(session);
	Connection con=null;
	PreparedStatement pstmt=null;
	PreparedStatement pstmt1=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://13.209.35.25:3307/db01?useSSL=false&characterEncoding=UTF-8&serverTimezone=UTC";
		con = DriverManager.getConnection(url, "lion", "1234");
		String sql1 = "select idx from user where id=?";
		pstmt1 = con.prepareStatement(sql1);
		pstmt1.setString(1, check);
		ResultSet rs = pstmt1.executeQuery();
		rs.next();
		String sql =  "insert into voted values(null,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, rs.getInt(1));
		pstmt.setInt(2, Integer.parseInt(choice));
		pstmt.executeUpdate();
		out.println("투표완료!");
	}catch(ClassNotFoundException ce){
		System.out.println(ce.getMessage());
	}catch(SQLException se){
		System.out.println(se.getMessage());
	}finally{
		try{
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}catch(SQLException se){
			System.out.println(se.getMessage());
		}
	}
	%>
</body>
</html>