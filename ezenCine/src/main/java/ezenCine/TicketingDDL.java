
package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

public class TicketingDDL {
	public static Vector <TicketingDTO> selectBooking(String userid){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from Ticketing where userid = ? and screen_date > curdate()";
		
		Vector <TicketingDTO> data = new Vector <TicketingDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			while(rs.next()) {
				TicketingDTO dto = new TicketingDTO();
				dto.setNum(rs.getInt("num"));
				dto.setCinema_name(rs.getString("cinema_name"));
				dto.setRoom_num(rs.getString("room_num"));
				dto.setScreen_date(rs.getString("screen_date"));
				dto.setScreen_time(rs.getString("screen_time"));
				dto.setSeat_num(rs.getString("seat_num"));
				dto.setMovie_id(rs.getString("movie_num"));
				dto.setTicket_date(rs.getString("Ticket_date"));
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
	

	// 예매하기
	public boolean ticketing(TicketingDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		
		try {
			conn = new DBConnect().getConn();
			String query = "INSERT INTO Ticketing (cinema_name, room_num, screen_date, screen_time, seat_num, movie_id, userid, cost) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getCinema_name());
			pstmt.setString(2, dto.getRoom_num());
			pstmt.setString(3, dto.getScreen_date());
			pstmt.setString(4, dto.getScreen_time());
			pstmt.setString(5, dto.getSeat_num());
			pstmt.setString(6, dto.getMovie_id());
			pstmt.setString(7, dto.getUser_id());
			pstmt.setString(8, dto.getCost());
			System.out.println(pstmt);
			flag = pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				
			}
		}
		if(flag > 0) {  
			System.out.println("예매 성공");
			return true;
		}else {			
			System.out.println("예매 실패");
			return false;
		}
	}
}

