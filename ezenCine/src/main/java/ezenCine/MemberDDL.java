package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class MemberDDL {
	public static boolean insert(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		String sql = "insert into Member (id, snsid, password, username, email, nickname, birthdate, tel, postcode, address, detail_address, email_agree, sms_agree, photo) "
					+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getSnsid());
			ps.setString(3, dto.getPassword());
			ps.setString(4, dto.getUsername());
			ps.setString(5, dto.getEmail());
			ps.setString(6, dto.getNickname());
			ps.setString(7, dto.getBirthdate());
			ps.setString(8, dto.getTel());
			ps.setInt(9, dto.getPostcode());
			ps.setString(10, dto.getAddress());
			ps.setString(11, dto.getDetail_address());
			ps.setInt(12, dto.getEmail_agree());
			ps.setInt(13, dto.getSms_agree());
			ps.setString(14, dto.getPhoto());
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
	
	public static boolean checkId(String userid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean result = false;
		
		String sql = "select * from Member where id = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			while(rs.next()) {
				result = true;
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
	
	public static boolean Login(String userid, String userpass) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean result = false;
		
		String sql = "select * from Member where id = ? and password = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1,  userid);
			ps.setString(2, userpass);
			rs = ps.executeQuery();
			while(rs.next()) {
				result = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(ps != null) rs.close();
				if(ps != null) rs.close();
			}catch(SQLException e) {}
		}
		return result;	
	}
	
	public static String checkSnsUser(String snsid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String result = null;
		
		String sql = "select * from Member where snsid = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, snsid);
			rs = ps.executeQuery();
			while(rs.next()) {
				result = rs.getString("id");
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
	
	public static String selectPhotoById(String id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String result = "";
		
		String sql = "select photo from Member where id = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1,  id);
			rs = ps.executeQuery();
			while(rs.next()) {
				result = rs.getString("photo");
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
	
	public static String findID(String username, String useremail) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String result = "";
		
		String sql = "select id from Member where username = ? and email = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1,  username);
			ps.setString(2,  useremail);
			rs = ps.executeQuery();
			while(rs.next()) {
				result = rs.getString("id");
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
	
	public static boolean isMem(String userid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean result = false;
		
		String sql = "select id from Member where id = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1,  userid);
			rs = ps.executeQuery();
			while(rs.next()) {
				result = true;
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
	
	public static boolean updatePW(String userid, String userpass) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		String sql = "update Member set password = ? where id = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1,  userpass);
			ps.setString(2,  userid);
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
	
	public static boolean MatchPw(String userid, String userpass) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String password = "";
		
		String sql = "select password from Member where id = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1,  userid);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				password = rs.getString("password");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(ps != null) ps.close();
			}catch(SQLException e) {}
		}
		
		if(password.equals(userpass)) {
			return true;
		}else {
			return false;
		}
	}
	
	public static Vector <MemberDTO> select(String userid){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from Member where id = ?";
		
		Vector <MemberDTO> data = new Vector <MemberDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
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
				dto.setEmail_agree(rs.getInt("email_agree"));
				dto.setSms_agree(rs.getInt("sms_agree"));
				dto.setPhoto(rs.getString("photo"));
				dto.setLevel(rs.getInt("level"));
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
	
	public static boolean updateProfilePhotoNot(MemberDTO dto, String userid) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		String sql = "";
		
		try {
			conn = new DBConnect().getConn();
			if(dto.getPassword() == null || dto.getPassword().isEmpty()) {
				sql = "update Member set "
						+ "username = ?, nickname = ?, email = ?, tel = ?, postcode = ?, address = ?, detail_address = ?, email_agree = ?, sms_agree = ? "
						+ "where id = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, dto.getUsername());
				ps.setString(2, dto.getNickname());
				ps.setString(3, dto.getEmail());
				ps.setString(4, dto.getTel());
				ps.setInt(5,  dto.getPostcode());
				ps.setString(6, dto.getAddress());
				ps.setString(7,  dto.getDetail_address());
				ps.setInt(8, dto.getEmail_agree());
				ps.setInt(9, dto.getSms_agree());
				ps.setString(10, userid);
			}else {
				sql = "update Member set "
						+ "password = ?, username = ?, nickname = ?, email = ?, tel = ?, postcode = ?, address = ?, detail_address = ?, email_agree = ?, sms_agree = ? "
						+ "where id = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, dto.getPassword());
				ps.setString(2, dto.getUsername());
				ps.setString(3, dto.getNickname());
				ps.setString(4, dto.getEmail());
				ps.setString(5, dto.getTel());
				ps.setInt(6,  dto.getPostcode());
				ps.setString(7, dto.getAddress());
				ps.setString(8,  dto.getDetail_address());
				ps.setInt(9, dto.getEmail_agree());
				ps.setInt(10, dto.getSms_agree());
				ps.setString(11, userid);
			}
			
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
	
	public static boolean updateProfilePhoto(MemberDTO dto, String userid) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		String sql = "";
		
		try {
			conn = new DBConnect().getConn();                              
			if(dto.getPassword() == null || dto.getPassword().isEmpty()) {
				
				sql = "update Member set "
						+ "username = ?, nickname = ?, email = ?, tel = ?, postcode = ?, address = ?, detail_address = ?, photo = ?, email_agree = ?, sms_agree = ? "
						+ "where id = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, dto.getUsername());
				ps.setString(2, dto.getNickname());
				ps.setString(3, dto.getEmail());
				ps.setString(4, dto.getTel());
				ps.setInt(5,  dto.getPostcode());
				ps.setString(6, dto.getAddress());
				ps.setString(7,  dto.getDetail_address());
				ps.setString(8, dto.getPhoto());
				ps.setInt(9, dto.getEmail_agree());
				ps.setInt(10, dto.getSms_agree());
				ps.setString(11, userid);
				
				
			}else {
				sql = "update Member set "
						+ "password = ?, username = ?, nickname = ?, email = ?, tel = ?, postcode = ?, address = ?, detail_address = ?, photo = ?, email_agree = ?, sms_agree = ? "
						+ "where id = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, dto.getPassword());
				ps.setString(2, dto.getUsername());
				ps.setString(3, dto.getNickname());
				ps.setString(4, dto.getEmail());
				ps.setString(5, dto.getTel());
				ps.setInt(6,  dto.getPostcode());
				ps.setString(7, dto.getAddress());
				ps.setString(8,  dto.getDetail_address());
				ps.setString(9, dto.getPhoto());
				ps.setInt(10, dto.getEmail_agree());
				ps.setInt(11, dto.getSms_agree());
				ps.setString(12, userid);
				
			}
			
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
