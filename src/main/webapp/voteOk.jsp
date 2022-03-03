<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
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
	String user_nm="홍길동";
	int user_id=187;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://13.209.35.25:3307/db01?useSSL=false&characterEncoding=UTF-8&serverTimezone=UTC";
		con = DriverManager.getConnection(url, "lion", "1234");
		
		String sql =  "insert into voted values(null,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user_nm);
		pstmt.setInt(2, user_id);
		pstmt.setInt(3, Integer.parseInt(choice));
		pstmt.executeUpdate();
		out.println("voted 테이블에 새로운 레코드를 추가했습니다.");
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