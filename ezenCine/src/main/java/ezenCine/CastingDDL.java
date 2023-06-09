package ezenCine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class CastingDDL {
    public static Vector<CastingDTO> showCasing(String id){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "select * from Casting where movie_id = ?";
        Vector<CastingDTO> data = new Vector<>();
        
        try {
            conn = new DBConnect().getConn();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            
            while(rs.next()) {
                CastingDTO dto = new CastingDTO();
                dto.setNum(rs.getInt("num"));
                dto.setMovie_id(rs.getString("movie_id"));
                dto.setName(rs.getString("name"));
                dto.setName_eng(rs.getString("name_eng"));
                dto.setRole(rs.getString("role"));
                
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