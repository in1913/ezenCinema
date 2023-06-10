package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class LikeDDL {
	public static boolean insertLike(String movie_id, int reviews_num, String userid) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		String sql = "insert into Likes (movie_id, reviews_num, userid) "
				+ "values (?, ?, ?)";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, movie_id);
			ps.setInt(2, reviews_num);
			ps.setString(3,  userid);
			flag = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
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
	
	public static boolean updateMovieLike(int likes, String movie_id) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		String sql = "update Movie set likes = ? where id = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, likes);
			ps.setString(2, movie_id);
			flag = ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
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
	
	public static boolean updateReviewsLike(int likes, String movie_id, String userid) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		String sql = "update Reviews set likes = ? where movie_id = ? and member_id = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, likes);
			ps.setString(2, movie_id);
			ps.setString(3, userid);
			flag = ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
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

	public static int selectLikesMovie(String movie_id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) as cnt from Likes where movie_id = ? and reviews_num = -1";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, movie_id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				result = rs.getInt("cnt");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(ps != null) ps.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {}
		}
		
		return result;
	}
	
	public static int selectLikesReviews(String movie_id, int reviews_num) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) as cnt from Likes where movie_id = ? and reviews_num = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, movie_id);
			ps.setInt(2, reviews_num);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				result = rs.getInt("cnt");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(ps != null) ps.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {}
		}
		
		return result;
	}
	
	public static boolean checkMovieLike(String movie_id, String userid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int res = 0;
		String sql = "select count(*) as cnt from Likes where movie_id = ? and reviews_num = -1 and userid = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, movie_id);
			ps.setString(2,  userid);
			rs = ps.executeQuery();
			while(rs.next()) {
				res = rs.getInt("cnt");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(ps != null) ps.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {}
		}
		if(res > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	public static Vector <LikeDTO> checkReviewLike(String movie_id, int reviews_num){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from Likes where movie_id = ? and reviews_num = ?";
		
		Vector <LikeDTO> data = new Vector <LikeDTO> ();
		
		LikeDTO dto = new LikeDTO();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, movie_id);
			ps.setInt(2,  reviews_num);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setMovie_id(rs.getString("movie_id"));
				dto.setReviews_num(rs.getInt("reviews_num"));
				dto.setUserid(rs.getString("userid"));
				data.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(ps != null) ps.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {}
		}
		return data;
	}
	
	public static boolean delete(String movie_id, int reviews_num, String userid) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		String sql = "delete from Likes where movie_id = ? and reviews_num = ? and userid = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, movie_id);
			ps.setInt(2, reviews_num);
			ps.setString(3, userid);
			
			flag = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
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
