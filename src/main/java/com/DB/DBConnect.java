package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection conn;
	
	private static final String db_url = "jdbc:mysql://localhost:3306/ebooks-web";
	private static final String user = "root";
	private static final String password = "anhlam2003";
	
	public static Connection getConn()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(db_url,user,password);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
