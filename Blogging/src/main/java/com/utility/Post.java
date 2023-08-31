package com.utility;

import java.util.Date;

public class Post {
	
	private int pid;
	private int uid;
	private String title;
	private String content;
	private Date date;
	private String user;
	
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Post(int uid, String title, String content) {
		super();
		this.uid = uid;
		this.title = title;
		this.content = content;
		
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
