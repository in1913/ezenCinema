package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class StoreCartDDL {
	
	//장바구니 추가
	public static boolean insertCart(StoreCartDTO dto){
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		String sql = "insert into Store_cart (userid, itemnum, count) values (?, ?, ?)";
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getUserid());
			ps.setInt(2, dto.getItemnum());
			ps.setInt(3, dto.getCount());
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
	
	//사용자의 장바구니 목록
	public static Vector <StoreDTO> selectItemnum(String userid){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from Store where num in (select itemnum from Store_cart where userid = ?)";
		Vector <StoreDTO> data = new Vector <StoreDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				StoreDTO dto = new StoreDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setDetail(rs.getString("detail"));
				dto.setCost(rs.getInt("cost"));
				dto.setPhoto_url(rs.getString("photo_url"));
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
	
	// 장바구니 목록 출력
	public static StoreDTO selectCart(String userid, int num){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from Store where num in (select itemnum from Store_cart where userid = ? and itemnum = ?)";
		StoreDTO dto = new StoreDTO();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setInt(2, num);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setDetail(rs.getString("detail"));
				dto.setCost(rs.getInt("cost"));
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
		
		return dto;
	}
	
	//장바구니 목록
	public static StoreCartDTO selectCartAll(String userid, int itemnum){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		StoreCartDTO dto = new StoreCartDTO();
		
		String sql = "select * from Store_cart where userid = ? and itemnum = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setInt(2, itemnum);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setUserid(rs.getString("userid"));
				dto.setItemnum(rs.getInt("itemnum"));
				dto.setCount(rs.getInt("count"));
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
		
		return dto;
	}
	
	//카트에서 목록 삭제
	public static boolean deleteCart(String userid, int itemnum){
		Connection conn = null;
		PreparedStatement ps = null;
		StoreCartDTO dto = selectCartAll(userid, itemnum);
		
		int flag = 0;
		
		String sql = "delete from Store_cart where userid = ? and itemnum = ?";
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getUserid());
			ps.setInt(2, dto.getItemnum());
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
	//결제페이지에서 삭제
	public static boolean deletePay(String userid, int itemnum){
		Connection conn = null;
		PreparedStatement ps = null;
		StoreCartDTO dto = selectCartAll(userid, itemnum);
		
		int flag = 0;
		
		String sql = "delete from Store_cart where userid = ? and itemnum = ?";
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getUserid());
			ps.setInt(2, dto.getItemnum());
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
	
	//카운트 업데이트
	public static boolean cartUpdate(int count, String userid, int itemnum) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		String sql = "update Store_cart set count = ? where userid = ? and itemnum = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, count);
			ps.setString(2,  userid);
			ps.setInt(3, itemnum);
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
	
	//결제 완료
	public static boolean pay(String userid, int itemnum) {
		Connection conn = null;
		PreparedStatement ps = null;
		int flag = 0;
		
		String sql = "delete from Store_cart where userid = ? and itemnum = ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1,  userid);
			ps.setInt(2, itemnum);
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
