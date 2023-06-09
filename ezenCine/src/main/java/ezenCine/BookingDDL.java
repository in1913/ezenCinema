package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class BookingDDL {
	public static Vector <BookingDTO> selectInit(String userid){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select title, poster_url, num as ticket_num, room_num, seat_num, ticket_date, DAYOFWEEK(ticket_date) as ticket_day, screen_date,DAYOFWEEK(screen_date) as screen_day, screen_time "
				+ "from Ticketing join Movie on Ticketing.movie_id = Movie.id where Ticketing.userid = ? "
				+ "and Ticketing.screen_date > curdate() limit 0, 2";
		
		Vector <BookingDTO> data = new Vector <BookingDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			while(rs.next()) {
				BookingDTO dto =new BookingDTO();
				dto.setTitle(rs.getString("title"));
				dto.setPoster_url(rs.getString("poster_url"));
				dto.setTicket_num(rs.getInt("ticket_num"));
				dto.setRoom_num(rs.getString("room_num"));
				dto.setSeat_num(rs.getString("seat_num"));
				dto.setTicket_date(rs.getString("ticket_date"));
				dto.setTicket_day(rs.getInt("ticket_day"));
				dto.setScreen_date(rs.getString("screen_date"));
				dto.setScreen_day(rs.getInt("screen_day"));
				dto.setScreen_time(rs.getString("screen_time"));
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
	
	public static Vector <BookingDTO> select(String userid, int num){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select title, poster_url, num as ticket_num, room_num, seat_num, ticket_date, DAYOFWEEK(ticket_date) as ticket_day, screen_date,DAYOFWEEK(screen_date) as screen_day, screen_time "
				+ "from Ticketing join Movie on Ticketing.movie_id = Movie.id where Ticketing.userid = ? "
				+ "and Ticketing.screen_date > curdate() limit ?, 2";
		
		Vector <BookingDTO> data = new Vector <BookingDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setInt(2, num);
			rs = ps.executeQuery();
			while(rs.next()) {
				BookingDTO dto =new BookingDTO();
				dto.setTitle(rs.getString("title"));
				dto.setPoster_url(rs.getString("poster_url"));
				dto.setTicket_num(rs.getInt("ticket_num"));
				dto.setRoom_num(rs.getString("room_num"));
				dto.setSeat_num(rs.getString("seat_num"));
				dto.setTicket_date(rs.getString("ticket_date"));
				dto.setTicket_day(rs.getInt("ticket_day"));
				dto.setScreen_date(rs.getString("screen_date"));
				dto.setScreen_day(rs.getInt("screen_day"));
				dto.setScreen_time(rs.getString("screen_time"));
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
	
	public static int BookingCnt(String userid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) as cnt from Ticketing join Movie on Ticketing.movie_id = Movie.id where Ticketing.userid = ? and Ticketing.screen_date > curdate();";
		
		
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
