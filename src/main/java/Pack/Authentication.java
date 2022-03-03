package Pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Authentication {
	
	public String isMember(String id, String pwd)
	{
		String name = null;
		String sql = "select id from user where id=? and pwd=?";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();

			if(rs.next())
			{
				System.out.println(name);
				name = rs.getString(1);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return name;
	}
}