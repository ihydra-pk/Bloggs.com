<%@page import="com.utility.Post"%>
<%@page import="com.conn.MysqlConnec"%>
<%@page import="com.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Post</title>
<%@include file="components/all-cdn.jsp"%>
<link rel="icon" type="image/x-icon" href="img-resources/eyeglasses.svg">
</head>

<style>
</style>
<body style="background-color: #f0f2f5">
<script src="components/sandbox.js"></script>
<%@include file="components/navbar.jsp" %>

<% 
String uid = request.getParameter("hd");
String pid = request.getParameter("pid");
PostDao dao = new PostDao(MysqlConnec.getConnectionn());

%>

<%
if(pid != null){
	Post post = dao.listPostById(Integer.parseInt(pid));
%>	
	<form action="updatepost" method="post">
	<input type="hidden" value=<%=pid %> name="pid">
	<h1 class="text-center">Create Post</h1>
	<div class="col-md-4 offset-md-3">
		<div class="card mt-4" style="width: 45rem;">
			<textarea class="form-control" placeholder="New Post Title Here" 
				style="height: 50px" name="title" required ><%=post.getTitle() %></textarea>
		</div>
	</div>
	<div class="col-md-4 offset-md-3">
		<div class="card mt-2" style="width: 45rem;">
			<textarea class="form-control" minlength="280"
				placeholder="Write Your Post Content Here....."
				style="height: 150px" name="content"  required><%=post.getContent() %></textarea>
		</div>
	</div>
	<div class="col-md-4 offset-md-3 mt-4">
	<button type="submit" class="btn btn-primary">Publish</button>
	<button type="button" class="btn btn-danger" onclick='cleartxt()'>Reset</button>
	</div>
	</form>

<%
}
else{
%>


	<form action="newpost" method="post">
	<input type="hidden" value=<%=uid %> name="hdd">
	<h1 class="text-center">Create Post</h1>
	<div class="col-md-4 offset-md-3">
		<div class="card mt-4" style="width: 45rem;">
			<textarea class="form-control" placeholder="New Post Title Here"
				style="height: 50px" name="title" required ></textarea>
		</div>
	</div>
	<div class="col-md-4 offset-md-3">
		<div class="card mt-2" style="width: 45rem;">
			<textarea class="form-control" minlength="280"
				placeholder="Write Your Post Content Here....."
				style="height: 150px" name="content"  required></textarea>
		</div>
	</div>
	<div class="col-md-4 offset-md-3 mt-4">
	<button type="submit" class="btn btn-primary">Publish</button>
	<button type="button" class="btn btn-danger" onclick='cleartxt()'>Reset</button>
	</div>
	</form>

<%
}
%>

</body>
</html>