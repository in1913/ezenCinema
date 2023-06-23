package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetIpDDL {
	public static boolean insert(GetIpDTO dto) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		String sql = "insert into User_ip (userid, ip, browser, os, web_type) values "
				+ "(?, ?, ?, ?, ?)";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getUserid());
			ps.setString(2,  dto.getIp());
			ps.setString(3, dto.getBrowser());
			ps.setString(4,  dto.getOs());
			ps.setString(5,  dto.getWeb_type());
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
