package Pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectionProvider {
	
	public static Connection getConnection()
	{
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://13.209.35.25:3307/db01?useSSL=false&characterEncoding=UTF-8&serverTimezone=UTC";
			conn = DriverManager.getConnection(url, "lion", "1234");
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public static void close(ResultSet rs, Statement stmt, Connection conn)
	{
		try {
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
	}
}