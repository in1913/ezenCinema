package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class StoreDDL {
	public static Vector <StoreDTO> selectStore(String category){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from Store where category = ?";
		Vector <StoreDTO> data = new Vector <StoreDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				StoreDTO dto = new StoreDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setDetail(rs.getString("detail"));
				dto.setPhoto_url(rs.getString("photo_url"));
				dto.setCost(rs.getInt("cost"));
				dto.setCategory(rs.getString("category"));
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
	
	public static Vector <StoreDTO> selectStoreMain(String category){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from Store where category = ? limit 0, 3";
		Vector <StoreDTO> data = new Vector <StoreDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, category);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				StoreDTO dto = new StoreDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setDetail(rs.getString("detail"));
				dto.setPhoto_url(rs.getString("photo_url"));
				dto.setCost(rs.getInt("cost"));
				dto.setCategory(rs.getString("category"));
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
	
	public static Vector <StoreDTO> storeDetail(int num){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from Store where num = ?";
		Vector <StoreDTO> data = new Vector <StoreDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				StoreDTO dto = new StoreDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setDetail(rs.getString("detail"));
				dto.setPhoto_url(rs.getString("photo_url"));
				dto.setCost(rs.getInt("cost"));
				dto.setCategory(rs.getString("category"));
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
}
