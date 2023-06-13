package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class MovieListDDL {
	public static Vector <MovieListDTO> selectMovieList(){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select id, title, title_eng from Movie";
		Vector <MovieListDTO> data = new Vector <MovieListDTO> ();
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MovieListDTO dto = new MovieListDTO();
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
}
