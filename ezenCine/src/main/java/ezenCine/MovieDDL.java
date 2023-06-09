package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class MovieDDL {
	// 영화상세 출력
	public static Vector<MovieDTO> viewMovieDetail(String id){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT M.*, COALESCE(R.avg_rating, 0) AS avg_rating FROM Movie M LEFT JOIN (SELECT movie_id, ROUND(AVG(rating), 2) AS avg_rating FROM Reviews GROUP BY movie_id) R ON M.id = R.movie_id where id = ?";
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
				dto.setAvg_rating(rs.getFloat("avg_rating"));
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
		String query = "SELECT M.*, COALESCE(R.avg_rating, 0) AS avg_rating FROM Movie M LEFT JOIN (SELECT movie_id, ROUND(AVG(rating), 2) AS avg_rating FROM Reviews GROUP BY movie_id) R ON M.id = R.movie_id WHERE CURDATE() BETWEEN open_date AND close_date order by Likes desc limit 0, 4";
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
				dto.setAvg_rating(rs.getFloat("avg_rating"));
				
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
		String query = "SELECT M.*, COALESCE(R.avg_rating, 0) AS avg_rating FROM Movie M LEFT JOIN (SELECT movie_id, ROUND(AVG(rating), 2) AS avg_rating FROM Reviews GROUP BY movie_id) R ON M.id = R.movie_id WHERE CURDATE() BETWEEN open_date AND close_date order by Likes desc";
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
				dto.setAvg_rating(rs.getFloat("avg_rating"));
				
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
		String query = "SELECT M.*, COALESCE(R.avg_rating, 0) AS avg_rating FROM Movie M LEFT JOIN (SELECT movie_id, ROUND(AVG(rating), 2) AS avg_rating FROM Reviews GROUP BY movie_id) R ON M.id = R.movie_id WHERE open_date > CURDATE() order by Likes desc limit 0, 4" ;
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
				dto.setAvg_rating(rs.getFloat("avg_rating"));
				
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
		String query = "SELECT M.*, COALESCE(R.avg_rating, 0) AS avg_rating FROM Movie M LEFT JOIN (SELECT movie_id, ROUND(AVG(rating), 2) AS avg_rating FROM Reviews GROUP BY movie_id) R ON M.id = R.movie_id WHERE open_date > CURDATE() order by Likes desc" ;
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
				dto.setAvg_rating(rs.getFloat("avg_rating"));
				
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
		
	// 메인페이지 & 인기영화 4개만 출력
	public static Vector<MovieDTO> viewMoviePopular(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT M.*, COALESCE(R.avg_rating, 0) AS avg_rating FROM Movie M LEFT JOIN (SELECT movie_id, ROUND(AVG(rating), 2) AS avg_rating FROM Reviews GROUP BY movie_id) R ON M.id = R.movie_id order by Likes desc limit 0, 4" ;
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
				dto.setOpen_date(rs.getString("open_date"));
				dto.setRuntime(rs.getInt("runtime"));
				dto.setAvg_rating(rs.getFloat("avg_rating"));
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
	// 영화 인기순 20개만 출력
	public static Vector<MovieDTO> viewMoviePopularAll(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT M.*, COALESCE(R.avg_rating, 0) AS avg_rating FROM Movie M LEFT JOIN (SELECT movie_id, ROUND(AVG(rating), 2) AS avg_rating FROM Reviews GROUP BY movie_id) R ON M.id = R.movie_id order by Likes desc limit 0, 20" ;
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
				dto.setAvg_rating(rs.getFloat("avg_rating"));
				
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
	
	// 지난 상영작 전체 출력
		public static Vector<MovieDTO> viewMoviePastAll(){
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			String query = "SELECT M.*, COALESCE(R.avg_rating, 0) AS avg_rating FROM Movie M LEFT JOIN (SELECT movie_id, ROUND(AVG(rating), 2) AS avg_rating FROM Reviews GROUP BY movie_id) R ON M.id = R.movie_id WHERE close_date < CURDATE() order by Likes desc" ;
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
					dto.setAvg_rating(rs.getFloat("avg_rating"));
					
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
		String query = "SELECT M.*, COALESCE(R.avg_rating, 0) AS avg_rating FROM Movie M LEFT JOIN (SELECT movie_id, ROUND(AVG(rating), 2) AS avg_rating FROM Reviews GROUP BY movie_id) R ON M.id = R.movie_id WHERE genre='애니메이션' order by Likes desc limit 0, 4" ;
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
				dto.setAvg_rating(rs.getFloat("avg_rating"));
				
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
		String query = "SELECT M.*, COALESCE(R.avg_rating, 0) AS avg_rating FROM Movie M LEFT JOIN (SELECT movie_id, ROUND(AVG(rating), 2) AS avg_rating FROM Reviews GROUP BY movie_id) R ON M.id = R.movie_id WHERE genre='애니메이션' order by Likes desc" ;
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
				dto.setAvg_rating(rs.getFloat("avg_rating"));
				
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
	
	// slide 있는 영화정보만 출력
	public static Vector<MovieDTO> showSlide(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from Movie where slide_url is not null";
		Vector<MovieDTO> data = new Vector<>();
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
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
	
	// 예매율 구하기
	public static float getBookingRate(String movie_id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select Round((select count(*) from Ticketing where movie_id = ? ) / (select count(*) from Ticketing), 3) as ra;";
		float bookingRate = 0;
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			ps.setString(1, movie_id);
			rs = ps.executeQuery();
			while(rs.next()) {
				bookingRate = rs.getFloat("ra");
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
		DecimalFormat df = new DecimalFormat("#.##");
		float rBookingRate = Float.parseFloat(df.format(bookingRate * 100.0));
		return rBookingRate;
	}
	
	// 자동완성용 메소드
	public static Vector <MovieDTO> selectMovieList(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select id, title, title_eng from Movie";
		Vector <MovieDTO> data = new Vector <MovieDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MovieDTO dto = new MovieDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setTitle_eng(rs.getString("title_eng"));
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
	
	// 검색어 받아서 아이디 보내기
	public String searchMovie(String title) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String id = null;
		String query = "select id from Movie where title like ?";
		
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(query);
			ps.setString(1, title + "%");
			rs = ps.executeQuery();
			while(rs.next()) {
				id = rs.getString("id");
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
		
		return id;
	}
}
