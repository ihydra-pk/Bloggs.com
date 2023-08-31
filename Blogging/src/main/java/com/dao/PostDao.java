package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.utility.Post;


public class PostDao {

	Connection con = null;
	
	public PostDao(Connection con) {
		this.con = con;
	}

	public boolean newpost(Post post) {
		boolean toggle = false;
		try {
			String QUERY = "insert into post(uid, title, content) values (?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(QUERY);
			pstmt.setInt(1, post.getUid());
			pstmt.setString(2, post.getTitle());
			pstmt.setString(3, post.getContent());
			
			int i = pstmt.executeUpdate();
			if(i == 1) {
				toggle = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return toggle;
	}
	
	public List<Post> listAllUsers(){
		String SQL = "Select * from post";
		String SQL1 = "Select firstname, lastname from user where id = ? ";
		List<Post> ls = new ArrayList<>();
		String name;
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL1);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(SQL);
			while(rs.next()) {
				Post po = new Post();
				po.setUid(rs.getInt(2));
				pstmt.setInt(1,rs.getInt(2));
				ResultSet rs1 = pstmt.executeQuery();
				while(rs1.next()) {
				name = rs1.getString(1) + " " + rs1.getString(2);
				po.setUser(name);
				}
				po.setPid(rs.getInt(1));
				po.setTitle(rs.getString(3));
				po.setContent(rs.getString(4));
				po.setDate(null);
				po.setDate(rs.getTimestamp(5));
				ls.add(po);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ls;
	}
	
	public List<Post> listMyPosts(int uid){
		String SQL = "Select * from post where uid =?";
		List<Post> ls = new ArrayList<>();
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1,uid);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Post po = new Post();
				po.setTitle(rs.getString(3));
				po.setContent(rs.getString(4));
				po.setDate(rs.getTimestamp(5));
				po.setPid(rs.getInt(1));
				ls.add(po);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ls;
	}
	
	public Post listPostById(int pid) {
		String SQL = "Select * from post where pid =?";
		String SQL1 = "Select firstname, lastname from user where id = ? ";
		String name;
		Post po = null;
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			PreparedStatement pstmt1 = con.prepareStatement(SQL1);
			pstmt.setInt(1,pid);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				pstmt1.setInt(1,rs.getInt(2));
				po = new Post();
				po.setTitle(rs.getString(3));
				po.setContent(rs.getString(4));
				po.setDate(rs.getTimestamp(5));
				ResultSet rs1 = pstmt1.executeQuery();
				while(rs1.next()) {
				name = rs1.getString(1) + " " + rs1.getString(2);
				po.setUser(name);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return po;
	}
	
	public boolean updatepost(String title, String content, int pid) {
		boolean toggle = false;
		try {
			String QUERY = "update post set title = ?, content = ? where pid = ?";
			PreparedStatement pstmt = con.prepareStatement(QUERY);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, pid);
			int i = pstmt.executeUpdate();
			if(i == 1) {
				toggle = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return toggle;
		
	}
	
	public boolean deletePostById(int pid) {
		boolean toggle = false;
		try {
			String QUERY = "delete from post where pid=?;";
			PreparedStatement pstmt = con.prepareStatement(QUERY);
			pstmt.setInt(1, pid);
			int i = pstmt.executeUpdate();
			if(i == 1) {
				toggle = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return toggle;
	}
	
}
