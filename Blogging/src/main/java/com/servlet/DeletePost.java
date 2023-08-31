package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.MysqlConnec;
import com.dao.PostDao;


@WebServlet("/deletepost")
public class DeletePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("pid"));
		PostDao dao = new PostDao(MysqlConnec.getConnectionn());
		if(dao.deletePostById(pid)){
			response.sendRedirect("myposts.jsp");
		}else {
			response.sendRedirect("deleteconfirm.jsp");
		}
	}

}
