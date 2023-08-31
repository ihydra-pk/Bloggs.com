<%@page import="com.conn.MysqlConnec"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.utility.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="components/all-cdn.jsp"%>
</head>
<body style="background-color: #f0f2f5">
<%@include file="components/navbar.jsp"%>

<%

int pid = Integer.parseInt(request.getParameter("pid"));
PostDao dao = new PostDao(MysqlConnec.getConnectionn());
Post post = dao.listPostById(pid);
%>

	<div class="col-md-4 offset-md-3">
	<div class="card mt-5" style="width: 45rem;">
	  <div class="card-body">
	    <h5 class="card-title"><%=post.getTitle() %></h5>
	    <h6 class="card-subtitle mb-2 text-muted"><%=post.getUser() %></h6>
	    <h6 class="card-subtitle mb-2 text-muted"><%=post.getDate() %></h6>
	     <%-- <div class="card-text"><%=po.getContent().substring(0,360)%></div> --%>
	     <div class="card-text"><%=post.getContent()%></div>
	    
	  </div>
	</div>
	</div>

</body>
</html>