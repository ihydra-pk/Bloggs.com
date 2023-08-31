<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@include file="components/all-cdn.jsp" %>
<link rel="icon" type="image/x-icon" href="img-resources/eyeglasses.svg">
</head>
<body style="background-color: #f0f2f5">

<%@include file="components/navbar.jsp" %>

<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
    <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  </symbol>
  </symbol>
</svg>

<%

String successmsg = (String)session.getAttribute("success-msg");
if(successmsg != null){
%>	
	<div class="alert alert-success d-flex align-items-center" role="alert">
	  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
	  <div>
	    Successfully Registered <a href="login.jsp" class="alert-link">Click Here</a> to Login.
	  </div>
	</div>
<%	
session.removeAttribute("success-msg");
}
String failedmsg = (String)session.getAttribute("failed-msg");
if(failedmsg != null){
%>	
	<div class="alert alert-warning d-flex align-items-center" role="alert">
	  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
	  <div>
	    Something went wrong...
	  </div>
	</div>
	<% 
session.removeAttribute("failed-msg");
}
%>



	<div class="container-fluid">
	<div class="row p-2">
	<div class="col-md-4 offset-md-4">
	<div class="card mt-5">
	<div class="card-body">
	<h1 class="h3 fw-normal mt-2 text-center">Create a new account</h1>
	<h5 class=" mb-3 fw-normal  text-center" style="color: #6067770">It's quick and easy.</h5>
	
 	<form action="register" method="post" >
	<div class="row g-3">
  <div class="col">
    <input type="text" class="form-control" placeholder="First name" aria-label="First name" name="fname" required>

  </div>
  <div class="col ">
    <input type="text" class="form-control" placeholder="Last name" aria-label="Last name" name="lname" required>

  </div>
</div>
<div class="mt-3">
 <input type="email" class="form-control" placeholder="Enter Email Address" aria-label="Email" name="email" required>
</div>	
<div class="mt-3">
 <input type="password" class="form-control " placeholder="Enter New Password" name="pass" >

</div>

<div class="form-check text-start my-3">
      <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault" required>
      <label class="form-check-label" for="flexCheckDefault">
        Accept Terms and Conditions
      </label>
    </div>

<div class="text-center">
<button class="btn btn-success w-100 py-2 mt-3 lg " type="submit" style="font-size: 1.25rem"> Sign Up</button>
</div>
</form>


	
	</div>
	</div>
	</div>
	</div>
	</div>

<script src="components/sandbox.js"></script>
</body>
</html>