package ezenCine;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnect {
	// 필드
		private DataSource dataSource;
		
		// 생성자
		public DBConnect() {
			try {
				// Context, lookup
				Context context = new InitialContext();
				dataSource = (DataSource) context.lookup("java:comp/env/jdbc/ezenCinema");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		// 메소드
		public Connection getConn() {
			Connection conn = null;
			try {
				conn = dataSource.getConnection();
				System.out.println("Oracle 클라우드 서버 mysql DB 접속 성공");
			}catch(Exception e){
				e.printStackTrace();
			}
			return conn;
		}
		
		public static void main(String[] args) {
			DBConnect dbConnect = new DBConnect();
			dbConnect.getConn();
		}
}
