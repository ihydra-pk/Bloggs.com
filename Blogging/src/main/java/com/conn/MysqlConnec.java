package com.conn;

import java.sql.*;

public class MysqlConnec {
	
	private static Connection con = null;
	public static Connection getConnectionn() {
		try {
			
			con = DriverManager.getConnection("jdbc:mysql://localhost/Bloggs","root","root");
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	
	
	
}
