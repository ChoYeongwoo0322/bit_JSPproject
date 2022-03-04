package Pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Authentication {
	public Boolean isMember(String id, String pwd)
	{
		Boolean isCheck = null;
		
		String sql = "SELECT exists (select * from user where id=? and pwd=?) as isMember;";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();

			if(rs.next())
			{
				isCheck = rs.getBoolean(1);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return isCheck;
	}
	
	public Boolean addmember(String id, String pwd, String name) {
		String sql = "insert into user values(null, ?, ?, sysdate(), ?, null);";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			int rs = pstmt.executeUpdate();

			if(rs>=1)
			{
				return true;
			}


		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return false;
	}
	
	public ResultSet getResult() {
		String sql = "select r.res_nm, count(v.res) as count, count(v.res)/count(v.id) as rate from voted v" + " join result r on r.id = v.res"
				+ " group by v.res;";

		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt1 = conn.prepareStatement(sql);

			ResultSet rs = pstmt1.executeQuery();			
			return rs;
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	public int allCount() {
		String sql = "select count(*) as total from voted;";
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				return rs.getInt(1);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return 0;
	}
	
	public int getUserIdx(String idx) {
		String sql = "select idx from user where id=?;";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				return rs.getInt(1);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return 0;
	}
	
	public Boolean isVoted(int idx) {
		Boolean isCheck = null;
		String sql = "select exists(select * from voted where user_idx = ?) as isVoted;";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			ResultSet rs = pstmt.executeQuery();

			if(rs.next())
			{
				isCheck = rs.getBoolean(1);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return isCheck;
	}
	public Boolean setVoted(int idx, String choice) {
		String sql =  "insert into voted values(null,?,?)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setInt(2, Integer.parseInt(choice));
			
			int result = pstmt.executeUpdate();

			if(result == 1)
			{
				return true;
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return false;
	}
}