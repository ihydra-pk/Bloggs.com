package com.dao;

import java.sql.*;
import com.utility.User;

public class UserDao {
	
	Connection con = null;
	
	public UserDao(Connection con){
		this.con = con;
	}
	
	public boolean register(User user) {
		boolean toggle = false;
		try {
			String QUERY = "insert into user(firstname, lastname, email, password) values (?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(QUERY);
			pstmt.setString(1, user.getFname());
			pstmt.setString(2, user.getLname());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPassword());
			int i = pstmt.executeUpdate();
			if(i == 1) {
				toggle = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return toggle;
	}
	
	public User login(User user) {
		
		try {
			String QUERY = "Select * from user where email = ? and password = ?";
			PreparedStatement pstmt = con.prepareStatement(QUERY);
			pstmt.setString(1, user.getEmail());
			pstmt.setString(2, user.getPassword());
			ResultSet rs = pstmt.executeQuery();
			user = null;
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setFname(rs.getString("firstname"));
				user.setLname(rs.getString("lastname"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	
	
}
