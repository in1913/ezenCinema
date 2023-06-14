package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class MyPageLikeDDL {
	public static Vector <MyPageLikeDTO> selectLikeInit(String userid){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select poster_url, title, title_eng, movie_id from Likes join "
				+ "Movie on Likes.movie_id = Movie.id where Likes.userid = ? "
				+ "and Likes.reviews_num = -1 order by num desc limit 0, 6";
		
		Vector <MyPageLikeDTO> data = new Vector <MyPageLikeDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MyPageLikeDTO dto = new MyPageLikeDTO();
				dto.setPoster_url(rs.getString("poster_url"));
				dto.setTitle(rs.getString("title"));
				dto.setTitle_eng(rs.getString("title_eng"));
				dto.setMovie_id(rs.getString("movie_id"));
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
	
	public static Vector <MyPageLikeDTO> selectLike(String userid, int num){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select poster_url, title, title_eng, movie_id from Likes join "
				+ "Movie on Likes.movie_id = Movie.id where Likes.userid = ? "
				+ "and Likes.reviews_num = -1 order by num desc limit ?, 6";
		
		Vector <MyPageLikeDTO> data = new Vector <MyPageLikeDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setInt(2, num);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MyPageLikeDTO dto = new MyPageLikeDTO();
				dto.setPoster_url(rs.getString("poster_url"));
				dto.setTitle(rs.getString("title"));
				dto.setTitle_eng(rs.getString("title_eng"));
				dto.setMovie_id(rs.getString("movie_id"));
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
	
	public static int LikeCnt(String userid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) as cnt from Likes join "
				+ "Movie on Likes.movie_id = Movie.id where Likes.userid = ? "
				+ "and Likes.reviews_num = -1;";
		
		
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
}
