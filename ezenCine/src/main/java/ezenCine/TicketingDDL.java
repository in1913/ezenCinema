package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TicketingDDL {
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
