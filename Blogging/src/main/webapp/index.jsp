<%@page import="com.utility.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.MysqlConnec"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homepage</title>
<%@include file="components/all-cdn.jsp"%>
<link rel="icon" type="image/x-icon" href="img-resources/eyeglasses.svg">
</head>
<body style="background-color: #f0f2f5">

	<%@include file="components/navbar.jsp"%>

<%
User user1 = (User)session.getAttribute("loggedin-user");
if(user1 != null)
{
%>


<% 
}
%>



<div class="container-fluid">

<%

PostDao dao = new PostDao(MysqlConnec.getConnectionn());
List<Post> posts = dao.listAllUsers();

for(Post po : posts){
	%>
	<div class="col-md-4 offset-md-3">
	<div class="card mt-3" style="width: 45rem;">
	  <div class="card-body">
	    <h5 class="card-title"><%=po.getTitle() %></h5>
	    <h6 class="card-subtitle mb-2 text-muted"><%=po.getUser() %></h6>
	    <div class="card-text"><%=po.getContent().substring(0,280)%></div> 
	    <%--  <div class="card-text"><%=po.getContent()%></div> --%>
	    <a href="Blog.jsp?pid=<%=po.getPid() %>" class="card-link">Read more</a>
	    
	  </div>
	</div>
	</div>
	
<% 	
}


%>

</div>




</body>
</html>