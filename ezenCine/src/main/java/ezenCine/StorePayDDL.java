package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StorePayDDL {
	//결제 성공
	public static boolean pay(StorePayDTO dto){
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		String sql = "insert into Store_pay (userid, totalcost, item, count) values (?, ?, ?, ?)";
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getUserid());
			ps.setInt(2, dto.getTotalcost());
			ps.setString(3, dto.getItems());
			ps.setInt(4, dto.getCount());
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
