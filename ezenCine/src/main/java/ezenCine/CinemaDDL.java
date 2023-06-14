package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class CinemaDDL {
	// 예매페이지 극장 출력
	public static Vector<CinemaDTO> selectCinema(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT * FROM Cinema" ;
		Vector<CinemaDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			System.out.println(ps);
			rs = ps.executeQuery();
			while(rs.next()) {
				CinemaDTO dto = new CinemaDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				
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
}
