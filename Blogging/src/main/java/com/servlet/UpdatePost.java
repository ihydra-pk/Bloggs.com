package com.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.MysqlConnec;
import com.dao.PostDao;



@WebServlet("/updatepost")
public class UpdatePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		PostDao dao = new PostDao(MysqlConnec.getConnectionn());
		HttpSession session;
		if(dao.updatepost(title, content, pid)){
			session = request.getSession();
			session.setAttribute("posted", "Your Post Uploaded Successfully");
			response.sendRedirect("index.jsp");
		}else {
			session = request.getSession();
			session.setAttribute("posting", "Something went wrong...");
			response.sendRedirect("new.jsp");
		}
		
	}

}
