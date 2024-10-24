package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	// 기본 생성자
	public DBConnPool() {
		try {
			// 커넥션 풀 얻기
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");
			con = source.getConnection();
			System.out.println("DB 커넥션 풀 연결 성공");
		}catch(Exception e) {
			System.out.println("Exception[DBConnPool] : " + e.getMessage());
			e.printStackTrace();
		}
	}
	// 연결 해제(자원 반납)
	public void close() {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (stmt != null) stmt.close();
			if (con != null) con.close();
			System.out.println("JDBC 자원 해제");
		}catch(Exception e) {
			System.out.println("Exception[close()] : " + e.getMessage());
		}
	}
}
