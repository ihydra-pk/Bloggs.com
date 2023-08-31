<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Confirm</title>
<%@include file="components/all-cdn.jsp"%>
<link rel="icon" type="image/x-icon" href="img-resources/eyeglasses.svg">
</head>
<body style="background-color: #f0f2f5">
<%@include file="components/navbar.jsp"%>
<div class="text-center" style="margin-top: 230px">
<%
int pid = Integer.parseInt(request.getParameter("pid"));
%>
<form action="deletepost" method="post">
<input type="hidden" value=<%=pid%> name="pid">
<h2>Are you sure you want to delete this article?</h2>
<div style="font-size: 1.25rem">You cannot undo this action...</div><br>
<button class="btn btn-danger " type="submit" style="font-size: 1.25rem"> Delete</button>
<a href="myposts.jsp" class="btn btn-light" style="font-size: 1.25rem" >Dismiss</a>
</form>
</div>

</body>
</html>