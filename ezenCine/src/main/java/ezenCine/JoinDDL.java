package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class JoinDDL {
	public static Vector <MyPageDTO> selectByIdOnMyPage(String userid){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		Vector <MyPageDTO> data = new Vector <MyPageDTO> ();
		
		String sql = "select * from Member left join "
				+ "    (select Ticketing.num as ticketing_num, cinema_name, room_num, movie_title, screen_date, screen_time, seat_num, userid, ticket_date, Reviews.num as reviews_num, movie_id, rating, date, member_id, comments from Ticketing join Reviews on Ticketing.userid = Reviews.member_id) "
				+ "    as TicketingAndReviews on Member.id = TicketingAndReviews.member_id where Member.id = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			while(rs.next()) {
				MyPageDTO dto = new MyPageDTO();
				/********** member **********/
				dto.setId(rs.getString("id"));
				dto.setSnsid(rs.getString("snsid"));
				dto.setPassword(rs.getString("password"));
				dto.setUsername(rs.getString("username"));
				dto.setEmail(rs.getString("email"));
				dto.setNickname(rs.getString("nickname"));
				dto.setBirthdate(rs.getString("birthdate"));
				dto.setTel(rs.getString("tel"));
				dto.setPostcode(rs.getInt("postcode"));
				dto.setAddress(rs.getString("address"));
				dto.setDetail_address(rs.getString("detail_address"));
				dto.setEmail_agree(rs.getInt("email_Agree"));
				dto.setSms_agree(rs.getInt("sms_agree"));
				dto.setPhoto(rs.getString("photo"));
				dto.setLevel(rs.getInt("level"));
				
				/*********** ticketing **************/
				dto.setTicketing_num(rs.getInt("ticketing_num"));
				dto.setCinema_name(rs.getString("cinema_name"));
				dto.setRoom_num(rs.getString("room_num"));
				dto.setMovie_title(rs.getString("movie_title"));
				dto.setScreen_date(rs.getString("screen_date"));
				dto.setScreen_time(rs.getString("screen_date"));
				dto.setSeat_num(rs.getString("seat_num"));
				dto.setUserid(rs.getString("userid"));
				dto.setTicket_date(rs.getString("ticket_date"));
				
				/************ reviews ***************/
				dto.setReviews_num(rs.getInt("reviews_num"));
				dto.setMovie_id(rs.getString("movie_id"));
				dto.setRating(rs.getDouble("rating"));
				dto.setDate(rs.getString("date"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setComments(rs.getString("comments"));
				data.add(dto);
			}
		}catch(Exception e){
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

}