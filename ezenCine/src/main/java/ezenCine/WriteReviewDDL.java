package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class WriteReviewDDL {
	public static boolean insert(String movie_id,double rating, String userid, String comments) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		String sql = "insert into Reviews (movie_id, rating, member_id, comments) "
				+ "values (?, ?, ?, ?)";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, movie_id);
			ps.setDouble(2, rating);
			ps.setString(3, userid);
			ps.setString(4, comments);
			flag = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if(conn != null) conn.close();
				if(ps != null) ps.close();
			}catch(SQLException e) {}
		}
		if(flag > 0) {
			return true;
		}else {
			return false;
		}
	}
}
