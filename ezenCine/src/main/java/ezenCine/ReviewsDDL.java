package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

public class ReviewsDDL {
	public static Vector <ReviewsDTO> selectInit(String userid){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select Reviews.*, title, poster_url from Reviews left join Movie on Reviews.movie_id = Movie.id where Reviews.member_id = ? order by num desc limit 0, 2";
		
		Vector <ReviewsDTO> data = new Vector <ReviewsDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ReviewsDTO dto =new ReviewsDTO();
				dto.setNum(rs.getInt("num"));
				dto.setMovie_id(rs.getString("movie_id"));
				dto.setRating(rs.getDouble("rating"));
				dto.setDate(rs.getString("date"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setComments(rs.getString("comments"));
				dto.setTitle(rs.getString("title"));
				dto.setPoster_url(rs.getString("poster_url"));
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
	
	public static Vector <ReviewsDTO> select(String userid, int num){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select Reviews.*, title, poster_url from Reviews left join Movie on Reviews.movie_id = Movie.id where Reviews.member_id = ? order by num desc limit ?, 2";
		
		Vector <ReviewsDTO> data = new Vector <ReviewsDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setInt(2,  num);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ReviewsDTO dto =new ReviewsDTO();
				dto.setNum(rs.getInt("num"));
				dto.setMovie_id(rs.getString("movie_id"));
				dto.setRating(rs.getDouble("rating"));
				dto.setDate(rs.getString("date"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setComments(rs.getString("comments"));
				dto.setTitle(rs.getString("title"));
				dto.setPoster_url(rs.getString("poster_url"));
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
	
	public static int ReviewsCnt(String userid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) as cnt from Reviews left join Movie on Reviews.movie_id = Movie.id where Reviews.member_id = ?";
		
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
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
	
	public static int getDateDiff(String userid, String movie_id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date currentTime = new Date();
		String today = format.format(currentTime);
		int diff = 0;
		
		String sql = "select datediff((select date from Reviews where member_id = ? and movie_id = ?), ?) as diff";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setString(2, movie_id);
			ps.setString(3, today);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				diff = rs.getInt("diff");
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
		return Math.abs(diff);
	}
}
