package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDDL {
	public static boolean insert(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		String sql = "insert into Member (id, snsid, password, username, email, nickname, birthdate, tel, postcode, address, detail_address) "
					+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
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
		
		String sql = "select * from Member where userid = ?";
		
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

}
