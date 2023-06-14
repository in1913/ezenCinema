package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class ShowReviewDDL {
	public static Vector <ShowReviewDTO> selectOne(String movie_id, double rating, String userid, String comments){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select photo, nickname, rating, date, comments, likes, num from Reviews join Member on Reviews.member_id = Member.id where Reviews.movie_id = ? and Reviews.rating = ? and Reviews.member_id = ? and Reviews.comments = ?;";
		
		Vector <ShowReviewDTO> data = new Vector <ShowReviewDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, movie_id);
			ps.setDouble(2, rating);
			ps.setString(3, userid);
			ps.setString(4, comments);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ShowReviewDTO dto =new ShowReviewDTO();
				dto.setPhoto(rs.getString("photo"));
				dto.setNickname(rs.getString("nickname"));
				dto.setRating(rs.getDouble("rating"));
				dto.setDate(rs.getString("date"));
				dto.setComments(rs.getString("comments"));
				dto.setLikes(rs.getInt("likes"));
				dto.setNum(rs.getInt("num"));
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
	
	public static Vector <ShowReviewDTO> selectInit(String movie_id){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select photo, nickname, rating, date, comments, likes, num, member_id from Reviews join Member on Reviews.member_id = Member.id where Reviews.movie_id = ? order by date desc limit 0, 6";
		
		Vector <ShowReviewDTO> data = new Vector <ShowReviewDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, movie_id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ShowReviewDTO dto =new ShowReviewDTO();
				dto.setPhoto(rs.getString("photo"));
				dto.setNickname(rs.getString("nickname"));
				dto.setRating(rs.getDouble("rating"));
				dto.setDate(rs.getString("date"));
				dto.setComments(rs.getString("comments"));
				dto.setLikes(rs.getInt("likes"));
				dto.setNum(rs.getInt("num"));
				dto.setUserid(rs.getString("member_id"));
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
	
	public static Vector <ShowReviewDTO> select(String movie_id, int num){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select photo, nickname, rating, date, comments, likes, num, member_id from Reviews join Member on Reviews.member_id = Member.id where Reviews.movie_id = ? order by date desc limit ?, 6";
		
		Vector <ShowReviewDTO> data = new Vector <ShowReviewDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, movie_id);
			ps.setInt(2, num);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ShowReviewDTO dto =new ShowReviewDTO();
				dto.setPhoto(rs.getString("photo"));
				dto.setNickname(rs.getString("nickname"));
				dto.setRating(rs.getDouble("rating"));
				dto.setDate(rs.getString("date"));
				dto.setComments(rs.getString("comments"));
				dto.setLikes(rs.getInt("likes"));
				dto.setNum(rs.getInt("num"));
				dto.setUserid(rs.getString("member_id"));
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
	
	public static Vector <ShowReviewDTO> selectInitLike(String movie_id){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select photo, nickname, rating, date, comments, likes, num, member_id from Reviews join Member on Reviews.member_id = Member.id where Reviews.movie_id = ? order by likes desc limit 0, 6";
		
		Vector <ShowReviewDTO> data = new Vector <ShowReviewDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, movie_id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ShowReviewDTO dto =new ShowReviewDTO();
				dto.setPhoto(rs.getString("photo"));
				dto.setNickname(rs.getString("nickname"));
				dto.setRating(rs.getDouble("rating"));
				dto.setDate(rs.getString("date"));
				dto.setComments(rs.getString("comments"));
				dto.setLikes(rs.getInt("likes"));
				dto.setNum(rs.getInt("num"));
				dto.setUserid(rs.getString("member_id"));
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
	
	public static Vector <ShowReviewDTO> selectLike(String movie_id, int num){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select photo, nickname, rating, date, comments, likes, num, member_id from Reviews join Member on Reviews.member_id = Member.id where Reviews.movie_id = ? order by likes desc limit ?, 6";
		
		Vector <ShowReviewDTO> data = new Vector <ShowReviewDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, movie_id);
			ps.setInt(2, num);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ShowReviewDTO dto =new ShowReviewDTO();
				dto.setPhoto(rs.getString("photo"));
				dto.setNickname(rs.getString("nickname"));
				dto.setRating(rs.getDouble("rating"));
				dto.setDate(rs.getString("date"));
				dto.setComments(rs.getString("comments"));
				dto.setLikes(rs.getInt("likes"));
				dto.setNum(rs.getInt("num"));
				dto.setUserid(rs.getString("member_id"));
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
	
	public static Vector <ShowReviewDTO> isUserLikeReviewInit(String movie_id, int num){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select photo, nickname, rating, date, comments, likes, num from Reviews join Member on Reviews.member_id = Member.id where Reviews.movie_id = ? order by likes limit ?, 6";
		
		Vector <ShowReviewDTO> data = new Vector <ShowReviewDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, movie_id);
			ps.setInt(2, num);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ShowReviewDTO dto =new ShowReviewDTO();
				dto.setPhoto(rs.getString("photo"));
				dto.setNickname(rs.getString("nickname"));
				dto.setRating(rs.getDouble("rating"));
				dto.setDate(rs.getString("date"));
				dto.setComments(rs.getString("comments"));
				dto.setLikes(rs.getInt("likes"));
				dto.setNum(rs.getInt("num"));
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
	
	public static Vector <ShowReviewDTO> isUserLikeReview(String movie_id, int num){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select photo, nickname, rating, date, comments, likes, num from Reviews join Member on Reviews.member_id = Member.id where Reviews.movie_id = ? order by likes limit ?, 6";
		
		Vector <ShowReviewDTO> data = new Vector <ShowReviewDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, movie_id);
			ps.setInt(2, num);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ShowReviewDTO dto =new ShowReviewDTO();
				dto.setPhoto(rs.getString("photo"));
				dto.setNickname(rs.getString("nickname"));
				dto.setRating(rs.getDouble("rating"));
				dto.setDate(rs.getString("date"));
				dto.setComments(rs.getString("comments"));
				dto.setLikes(rs.getInt("likes"));
				dto.setNum(rs.getInt("num"));
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
	
	public static Vector <ShowReviewDTO> isReviewLike(String movie_id){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select Reviews.num, Likes.userid from Reviews left join Likes on Reviews.num = Likes.reviews_num where Likes.reviews_num > -1 and Reviews.movie_id = ?";
		
		Vector <ShowReviewDTO> data = new Vector <ShowReviewDTO> ();
		
		
		try {
			ShowReviewDTO dto = new ShowReviewDTO();
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, movie_id);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto.setNum(rs.getInt("num"));
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
	
	public static int selectAllNum(String movie_id){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int res = 0;
		
		String sql = "select count(*) as cnt from Reviews join Member on Reviews.member_id = Member.id where Reviews.movie_id = ? order by date desc limit 0, 6";
		
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, movie_id);
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
		return res;
	}
	
	public static Vector <ShowReviewDTO> selectAndUserLike(String movieid){
		Connection conn = null;
		PreparedStatement ps1 = null;
		ResultSet rs1 = null;
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;
		
		String sql = "select Reviews.num, Likes.userid from Reviews left join Likes on Reviews.num = Likes.reviews_num where Likes.reviews_num > -1 and Reviews.movie_id = ?";
		String sql2 = "select photo, nickname, rating, date, comments, likes, num from Reviews join Member on Reviews.member_id = Member.id where Reviews.movie_id = ? order by date desc limit 0, 6";
		
		Vector <ShowReviewDTO> data = new Vector <ShowReviewDTO> ();
		
		
		try {
			ShowReviewDTO dto = new ShowReviewDTO();
			conn = new DBConnect().getConn();
			ps1 = conn.prepareStatement(sql);
			ps1.setString(1, movieid);
			rs1 = ps1.executeQuery();
			while(rs1.next()) {
				dto.setNum(rs1.getInt("num"));
				dto.setUserid(rs1.getString("userid"));
			}
			
			ps2 = conn.prepareStatement(sql2);
			ps2.setString(1, movieid);
			rs2 = ps2.executeQuery();
			while(rs2.next()) {
				dto.setPhoto(rs2.getString("photo"));
				dto.setNickname(rs2.getString("nickname"));
				dto.setRating(rs2.getDouble("rating"));
				dto.setDate(rs2.getString("date"));
				dto.setComments(rs2.getString("comments"));
				dto.setLikes(rs2.getInt("likes"));
				dto.setNum(rs2.getInt("num"));
				data.add(dto);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(ps1 != null) ps1.close();
				if(rs1 != null) rs1.close();				
				if(ps2 != null) ps2.close();
				if(rs2 != null) rs2.close();
			}catch(SQLException e) {}
		}
		return data;
	}
	
	public static Vector <ShowReviewDTO> selectAndUserLikeCur(String movieid){
		Connection conn = null;
		PreparedStatement ps1 = null;
		ResultSet rs1 = null;
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;
		
		String sql = "select Reviews.num, Likes.userid from Reviews left join Likes on Reviews.num = Likes.reviews_num where Likes.reviews_num > -1 and Reviews.movie_id = ?";
		String sql2 = "select photo, nickname, rating, date, comments, likes, num from Reviews join Member on Reviews.member_id = Member.id where Reviews.movie_id = ? order by likes limit 0, 6";
		
		Vector <ShowReviewDTO> data = new Vector <ShowReviewDTO> ();
		
		
		try {
			ShowReviewDTO dto = new ShowReviewDTO();
			conn = new DBConnect().getConn();
			ps1 = conn.prepareStatement(sql);
			ps1.setString(1, movieid);
			rs1 = ps1.executeQuery();
			while(rs1.next()) {
				dto.setNum(rs1.getInt("num"));
				dto.setUserid(rs1.getString("userid"));
			}
			
			ps2 = conn.prepareStatement(sql2);
			ps2.setString(1, movieid);
			rs2 = ps2.executeQuery();
			while(rs2.next()) {
				dto.setPhoto(rs2.getString("photo"));
				dto.setNickname(rs2.getString("nickname"));
				dto.setRating(rs2.getDouble("rating"));
				dto.setDate(rs2.getString("date"));
				dto.setComments(rs2.getString("comments"));
				dto.setLikes(rs2.getInt("likes"));
				dto.setNum(rs2.getInt("num"));
				data.add(dto);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(ps1 != null) ps1.close();
				if(rs1 != null) rs1.close();				
				if(ps2 != null) ps2.close();
				if(rs2 != null) rs2.close();
			}catch(SQLException e) {}
		}
		return data;
	}
	
	
	
}
