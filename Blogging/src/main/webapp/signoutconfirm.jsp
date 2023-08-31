<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signout Confirm</title>
<%@include file="components/all-cdn.jsp"%>
<link rel="icon" type="image/x-icon" href="img-resources/eyeglasses.svg">
</head>
<body style="background-color: #f0f2f5">

<%@include file="components/navbar.jsp"%>
<div class="text-center" style="margin-top: 230px">

<form action="logout">
<h2>Are you sure you want to sign out?</h2>
<button class="btn btn-primary " type="submit" style="font-size: 1.25rem"> Yes, sign out</button></form>
</div>

</body>
</html>