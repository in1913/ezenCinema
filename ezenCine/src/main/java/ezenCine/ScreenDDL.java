package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class ScreenDDL {
	// 스크린 테이블 전체 접근
	public static Vector<ScreenDTO> selectMovie(String movie_id){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from Screening where movie_id = ?" ;
		Vector<ScreenDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			ps.setString(1, movie_id);
			System.out.println(ps);
			rs = ps.executeQuery();
			while(rs.next()) {
				ScreenDTO dto = new ScreenDTO();
				dto.setMovie_id(rs.getString("movie_id"));
				dto.setDate(rs.getString("movie_id"));
				dto.setTime(rs.getString("time"));
				dto.setTotal_seats(rs.getInt("room_num"));
				dto.setCinema_name(rs.getString("cinema_name"));
				
				data.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(ps != null) ps.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return data;
	}
	
	// 해당 영화 상영중인 영화관 중복제거해서 출력
	public static Vector<ScreenDTO> selectDinsinctCinema(String movie_id){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select movie_id, cinema_name from Screening where movie_id = ? group by cinema_name;" ;
		Vector<ScreenDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			ps.setString(1, movie_id);
			System.out.println(ps);
			rs = ps.executeQuery();
			while(rs.next()) {
				ScreenDTO dto = new ScreenDTO();
				dto.setMovie_id(rs.getString("movie_id"));
				dto.setCinema_name(rs.getString("cinema_name"));
				
				data.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(ps != null) ps.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return data;
	}
	
	// 영화 목록 눌렀을때 현재 상영스케줄 있는지 확인
	public boolean checkMovie(String movie_id){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from Screening where movie_id = ?" ;
		boolean result = false;
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			ps.setString(1, movie_id);
			System.out.println(ps);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(ps != null) ps.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// 해당날짜 상영 하는지 확인
	public boolean checkMovieTime(String movie_id, String date, String cinema_name){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from Screening where movie_id = ? and date = ? and cinema_name = ?" ;
		boolean result = false;
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			ps.setString(1, movie_id);
			ps.setString(2, date);
			ps.setString(3, cinema_name);
			
			System.out.println(ps);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(ps != null) ps.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	// 해당 영화 상영중인 시간/총 좌석수 런타임 출력
	public static Vector<ScreenDTO> showTime(String movie_id, String date, String cinema_name){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from Screening where movie_id = ? and date = ? and cinema_name = ?" ;
		Vector<ScreenDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			ps.setString(1, movie_id);
			ps.setString(2, date);
			ps.setString(3, cinema_name);
			System.out.println(ps);
			rs = ps.executeQuery();
			while(rs.next()) {
				ScreenDTO dto = new ScreenDTO();
				dto.setMovie_id(rs.getString("movie_id"));
				dto.setDate(rs.getString("date"));
				dto.setTime(rs.getString("time"));
				dto.setTotal_seats(rs.getInt("total_seats"));
				dto.setRoom_num(rs.getInt("room_num"));
				dto.setCinema_name(rs.getString("cinema_name"));
				data.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(ps != null) ps.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return data;
	}
	
	// 자리상태 찾기
	public boolean checkSeat(String movie_id, String date, String cinema_name, String time, String seat_num){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select seat_num from Ticketing where movie_id = ? and screen_date = ? and cinema_name = ? and screen_time = ?" ;
		boolean result = false;
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			ps.setString(1, movie_id);
			ps.setString(2, date);
			ps.setString(3, cinema_name);
			ps.setString(4, time);
			System.out.println(ps);
			rs = ps.executeQuery();
			while (rs.next()) {
	            String bookedSeat = rs.getString("seat_num");
	            if (isSeatBooked(bookedSeat, seat_num)) {
	                result = true;
	                break;
	            }
	        }
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(ps != null) ps.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// 좌석 예약 여부 확인
	private boolean isSeatBooked(String bookedSeat, String targetSeat) {
	    String[] bookedSeats = bookedSeat.split(",");
	    
	    for (String seat : bookedSeats) {
	        if (seat.equals(targetSeat)) {
	            return true; 
	        }
	    }
	    
	    return false; 
	}
	
	
	
	// 남은좌석수 불러오기
	public int checkRemainingSeat(String movie_id, String date, String cinema_name, String time) {
	    Connection conn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    String query = "SELECT seat_num FROM Ticketing WHERE movie_id = ? AND screen_date = ? AND cinema_name = ? AND screen_time = ?";
	    int result = 0;

	    try {
	        conn = new DBConnect().getConn();
	        ps = conn.prepareStatement(query);
	        ps.setString(1, movie_id);
	        ps.setString(2, date);
	        ps.setString(3, cinema_name);
	        ps.setString(4, time);
	        System.out.println(ps);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            String seatNums = rs.getString("seat_num");
	            int seatCount = countRemainingSeats(seatNums);
	            result += seatCount;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (conn != null) conn.close();
	            if (ps != null) ps.close();
	            if (rs != null) rs.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return result;
	}

	// 좌석 정보로부터 남은 좌석 수 계산
	public int countRemainingSeats(String seatNums) {
	    int count = 0;
	    String[] seatArray = seatNums.split(",");
	    for (String seat : seatArray) {
	        count += seat.trim().split(" ").length;
	    }
	    return count;
	}
}
