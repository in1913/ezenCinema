<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, ezenCine.*"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String sql = "select * from Member";
	
	try{
		conn = new DBConnect().getConn();
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()){
%>
	<p><%=rs.getString("id") %></p>
	<p><%=rs.getString("password") %></p>
	<p><%=rs.getString("username") %></p>
	<p><%=rs.getString("email") %></p>
	<p><%=rs.getString("nickname") %></p>
	<p><%=rs.getString("gender") %></p>
	<p><%=rs.getString("birthdate") %></p>
	<p><%=rs.getString("tel") %></p>
	<p><%=rs.getInt("postcode") %></p>
	<p><%=rs.getString("address") %></p>
	<p><%=rs.getString("detail_address") %></p>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(conn != null) conn.close();
			if(ps != null) ps.close();
			if(rs != null) rs.close();
		}catch(SQLException e){};
	}
%>	
</body>
</html>