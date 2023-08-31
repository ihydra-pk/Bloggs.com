package com.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.MysqlConnec;
import com.dao.UserDao;
import com.utility.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String pass =  request.getParameter("pass");
		
		UserDao dao = new UserDao(MysqlConnec.getConnectionn());
		User user = new User(fname, lname, email, pass);
		HttpSession session;
		
		if(dao.register(user)){
			session = request.getSession();
			session.setAttribute("success-msg", "Successfully Registered");
			response.sendRedirect("register.jsp");
		}else {
			session = request.getSession();
			session.setAttribute("failed-msg", "Something went wrong...");
			response.sendRedirect("register.jsp");
		}
		
		
		
		
		
	} 

}
