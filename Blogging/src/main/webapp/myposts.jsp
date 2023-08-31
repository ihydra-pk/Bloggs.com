<%@page import="com.utility.Post"%>
<%@page import="com.conn.MysqlConnec"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Posts</title>
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

<div class="container-fluid mt-5">
<h2 class="text-center mb-3">Dashboard</h2>

<%

PostDao dao = new PostDao(MysqlConnec.getConnectionn());
List<Post> posts = dao.listMyPosts(user1.getId());
for(Post po : posts){
	%>
	<div class="col-md-4 offset-md-2" >
  <div class="card " style="width: 60rem; border-color: #FFFFFF; border-radius: 0;">
    <div class="card-body">
      <div class="row align-items-center">
        <div class="col">
          <h5 class="card-title"><%=po.getTitle() %></h5>
        </div>
        <div class="col-auto">
          <div class="btn-group" role="group" aria-label="Basic mixed styles example">
		<a href="new.jsp?pid=<%=po.getPid() %>" type="submit" class="btn btn-outline-primary">Edit
			Post</a>
			<a class="btn btn-outline-danger" href="deleteconfirm.jsp?pid=<%=po.getPid()%>">Delete</a>
          </div>
        </div>
      </div>
      <h6 class="card-subtitle mb-2 text-muted">Published: <%=po.getDate()%></h6>
    </div>
  </div>
</div>
	
	
	
<% 	
}


%>

</div>

<% 
}
%>


</body>
</html>