package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class MyPageStoreDDL {
	public static Vector <MyPageStoreDTO> selectInit(String userid){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select Store.num as item_num, title, detail, photo_url, cost, category, "
				+ "    Store_pay.num as buy_num, userid, totalcost, item, count, pdate "
				+ "from Store_pay LEFT JOIN Store on Store_pay.item = Store.num where Store_pay.userid = ?"
				+ " ORDER BY pdate DESC limit 0, 2";
		
		Vector <MyPageStoreDTO> data = new Vector <MyPageStoreDTO> ();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			while(rs.next()) {
				MyPageStoreDTO dto = new MyPageStoreDTO();
				dto.setItem_num(rs.getInt("item_num"));
				dto.setTitle(rs.getString("title"));
				dto.setDetail(rs.getString("detail"));
				dto.setPhoto_url(rs.getString("photo_url"));
				dto.setCost(rs.getInt("cost"));
				dto.setCategory(rs.getString("category"));
				dto.setBuy_num(rs.getInt("buy_num"));
				dto.setUserid(rs.getString("userid"));
				dto.setTotalcost(rs.getInt("totalcost"));
				dto.setItem(rs.getString("item"));
				dto.setCount(rs.getInt("count"));
				dto.setPdate(rs.getString("pdate"));
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
	
	public static Vector <MyPageStoreDTO> selectLimit(String userid, int num){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select Store.num as item_num, title, detail, photo_url, cost, category, "
				+ "    Store_pay.num as buy_num, userid, totalcost, item, count, pdate "
				+ "from Store_pay LEFT JOIN Store on Store_pay.item = Store.num where Store_pay.userid = ?"
				+ " ORDER BY pdate DESC limit ?, 2";
		
		Vector <MyPageStoreDTO> data = new Vector <MyPageStoreDTO> ();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setInt(2, num);
			rs = ps.executeQuery();
			while(rs.next()) {
				MyPageStoreDTO dto = new MyPageStoreDTO();
				dto.setItem_num(rs.getInt("item_num"));
				dto.setTitle(rs.getString("title"));
				dto.setDetail(rs.getString("detail"));
				dto.setPhoto_url(rs.getString("photo_url"));
				dto.setCost(rs.getInt("cost"));
				dto.setCategory(rs.getString("category"));
				dto.setBuy_num(rs.getInt("buy_num"));
				dto.setUserid(rs.getString("userid"));
				dto.setTotalcost(rs.getInt("totalcost"));
				dto.setItem(rs.getString("item"));
				dto.setCount(rs.getInt("count"));
				dto.setPdate(rs.getString("pdate"));
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
	
	public static int selectCnt(String userid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select count(*) as cnt from Store_pay LEFT JOIN Store on Store_pay.item = Store.num where Store_pay.userid = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			while(rs.next()) {
				result = rs.getInt("cnt");
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
