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


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String pass =  request.getParameter("pass");
		
		
		UserDao dao = new UserDao(MysqlConnec.getConnectionn());
		User user = new User();
		user.setEmail(email);
		user.setPassword(pass);
		
		User userDetails = dao.login(user);
		
		if(userDetails != null){
			HttpSession session = request.getSession();
			session.setAttribute("loggedin-user", userDetails);
			response.sendRedirect("index.jsp");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("login-failed", "Email and Password Does Not Match Try Again...");;
			response.sendRedirect("login.jsp");
		}
		
	}

}
