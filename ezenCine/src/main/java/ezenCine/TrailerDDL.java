package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class TrailerDDL {
	// 트레일러 출력
	public static Vector<TrailerDTO> showTrailer(String id){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from Trailer where movie_id = ?";
		Vector<TrailerDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				TrailerDTO dto = new TrailerDTO();
				dto.setMovie_id(rs.getString("movie_id"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setVodsrc(rs.getString("vodsrc"));
				dto.setVodtitle(rs.getString("vodtitle"));
				data.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(rs != null) rs.close();
				if(ps != null) ps.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return data;
	}
	// 트레일러 갯수 출력
	public static int showTrailerCount(String id){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select count(*) from Trailer where movie_id = ?";
		int count = 0;
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				count = rs.getInt("count(*)");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(rs != null) rs.close();
				if(ps != null) ps.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	// 전체 트레일러 출력
	public static Vector<TrailerDTO> showTrailerAll(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT m.title, t.thumbnail, t.vodsrc, t.vodtitle FROM (SELECT movie_id, thumbnail, vodsrc, vodtitle, ROW_NUMBER() OVER (PARTITION BY movie_id ORDER BY movie_id) AS row_num FROM Trailer) AS t JOIN Movie m ON m.id = t.movie_id WHERE t.row_num = 1;";
		Vector<TrailerDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				TrailerDTO dto = new TrailerDTO();
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setVodsrc(rs.getString("vodsrc"));
				dto.setVodtitle(rs.getString("vodtitle"));
				dto.setTitle(rs.getString("title"));
				data.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(rs != null) rs.close();
				if(ps != null) ps.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return data;
	}
}
