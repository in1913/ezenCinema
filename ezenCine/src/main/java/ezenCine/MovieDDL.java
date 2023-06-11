package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class MovieDDL {
	// 영화상세 출력
	public static Vector<MovieDTO> viewMovieDetail(String id){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from Movie where id = ?";
		Vector<MovieDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				MovieDTO dto = new MovieDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setTitle_eng(rs.getString("title_eng"));
				dto.setPoster_url(rs.getString("poster_url"));
				dto.setSlide_url(rs.getString("slide_url"));
				dto.setSummary(rs.getString("summary"));
				dto.setRuntime(rs.getInt("runtime"));
				dto.setOpen_year(rs.getInt("open_year"));
				dto.setOpen_date(rs.getString("open_date"));
				dto.setClose_date(rs.getString("close_date"));
				dto.setAudience(rs.getInt("audience"));
				dto.setNation(rs.getString("nation"));
				dto.setGenre(rs.getString("genre"));
				dto.setCasting(rs.getString("casting"));
				dto.setDirector(rs.getString("director"));
				dto.setLike(rs.getInt("likes"));
				dto.setLimit_age(rs.getInt("age_limit"));
				dto.setReviews_num(rs.getInt("reviews_num"));
				
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
	
	// 현재 상영작 4개만 출력
	public static Vector<MovieDTO> viewMovieNow(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT * FROM Movie WHERE CURDATE() BETWEEN open_date AND close_date order by likes desc limit 0, 4;";
		Vector<MovieDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			System.out.println(ps);
			rs = ps.executeQuery();
			while(rs.next()) {
				MovieDTO dto = new MovieDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setPoster_url(rs.getString("poster_url"));
				dto.setLike(rs.getInt("likes"));
				
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
	
	// 현재 상영작 모두 출력
	public static Vector<MovieDTO> viewMovieNowAll(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT * FROM Movie WHERE CURDATE() BETWEEN open_date AND close_date order by likes desc";
		Vector<MovieDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			System.out.println(ps);
			rs = ps.executeQuery();
			while(rs.next()) {
				MovieDTO dto = new MovieDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setPoster_url(rs.getString("poster_url"));
				dto.setLike(rs.getInt("likes"));
				
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
	
	// 상영예정작 4개만 출력
	public static Vector<MovieDTO> viewMovieExpected(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT * FROM Movie WHERE open_date > CURDATE() order by likes desc limit 0, 4" ;
		Vector<MovieDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			System.out.println(ps);
			rs = ps.executeQuery();
			while(rs.next()) {
				MovieDTO dto = new MovieDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setPoster_url(rs.getString("poster_url"));
				dto.setLike(rs.getInt("likes"));
				
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
	// 상영예정작 전체 출력
	public static Vector<MovieDTO> viewMovieExpectedAll(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT * FROM Movie WHERE open_date > CURDATE() order by likes desc" ;
		Vector<MovieDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			System.out.println(ps);
			rs = ps.executeQuery();
			while(rs.next()) {
				MovieDTO dto = new MovieDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setPoster_url(rs.getString("poster_url"));
				dto.setLike(rs.getInt("likes"));
				
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
		
	// 인기영화 4개만 출력
	public static Vector<MovieDTO> viewMoviePopular(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT * FROM Movie order by likes desc limit 0, 4;" ;
		Vector<MovieDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			System.out.println(ps);
			rs = ps.executeQuery();
			while(rs.next()) {
				MovieDTO dto = new MovieDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setPoster_url(rs.getString("poster_url"));
				dto.setLike(rs.getInt("likes"));
				
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
	// 인기영화 4개만 출력
	public static Vector<MovieDTO> viewMoviePopularAll(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT * FROM Movie order by likes desc" ;
		Vector<MovieDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			System.out.println(ps);
			rs = ps.executeQuery();
			while(rs.next()) {
				MovieDTO dto = new MovieDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setPoster_url(rs.getString("poster_url"));
				dto.setLike(rs.getInt("likes"));
				
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

	// 애니메이션 4개만 출력
	public static Vector<MovieDTO> viewMovieAnimation(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT * FROM Movie where genre='애니메이션' limit 0, 4;" ;
		Vector<MovieDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			System.out.println(ps);
			rs = ps.executeQuery();
			while(rs.next()) {
				MovieDTO dto = new MovieDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setPoster_url(rs.getString("poster_url"));
				dto.setLike(rs.getInt("likes"));
				
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
	// 애니메이션 전체 출력
	public static Vector<MovieDTO> viewMovieAnimationAll(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT * FROM Movie where genre='애니메이션' limit 0, 4;" ;
		Vector<MovieDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			System.out.println(ps);
			rs = ps.executeQuery();
			while(rs.next()) {
				MovieDTO dto = new MovieDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setPoster_url(rs.getString("poster_url"));
				dto.setLike(rs.getInt("likes"));
				
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
	
	// 예매페이지 상영중인 영화목록 출력
	public static Vector<MovieDTO> selectMovie(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT * FROM Movie WHERE CURDATE() BETWEEN open_date AND close_date" ;
		Vector<MovieDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			System.out.println(ps);
			rs = ps.executeQuery();
			while(rs.next()) {
				MovieDTO dto = new MovieDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setLimit_age(rs.getInt("age_limit"));
				
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
	
	// 런타임 보내기
	public static int selectRuntime(String movie_id){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select runtime from Movie where id = ?" ;
		int runtime = 0;
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			ps.setString(1, movie_id);
			System.out.println(ps);
			rs = ps.executeQuery();
			while(rs.next()) {
				runtime = rs.getInt("runtime");
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
		return runtime;
	}
	// 영화 제목만 싹
	public static List<String> selectTitle(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select title from Movie order by title asc" ;
		List<String> movieTitles = new ArrayList<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			System.out.println(ps);
			rs = ps.executeQuery();
			while(rs.next()) {
				String title = rs.getString("title");
	            movieTitles.add(title);
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
		return movieTitles;
	}
}