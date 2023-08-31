<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@include file="components/all-cdn.jsp" %>
<link rel="icon" type="image/x-icon" href="img-resources/eyeglasses.svg">
</head>

<style>
html,
body {
  height: 100%;
}

.form-signin {
  max-width: 330px;
  padding: 1rem;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

</style>
<body style="background-color: #f0f2f5">

<%@include file="components/navbar.jsp" %>

<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  
  <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  </symbol>
</svg>
<%

String loginmsg = (String)session.getAttribute("login-failed");
if(loginmsg != null){
%>
	<div class="alert alert-danger d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div>
     <%= loginmsg %>
  </div>
</div>
<%	
session.removeAttribute("login-failed");
}
%>
	<div class="container-fluid">
	<div class="row p-2">
	<div class="col-md-4 offset-md-4">
	<div class="card mt-5">
	<div class="card-body">
<main class="form-signin w-100 m-auto ">	
  
    
    <h1 class="h3 mb-3 fw-normal mt-5">Please sign in</h1>
    
	<form action="login" method="post">
    <div class="form-floating">
      <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name = "email">
      <label for="floatingInput">Email address</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name = "pass">
      <label for="floatingPassword">Password</label>
    </div>

    
    <button class="btn btn-primary w-100 py-2" type="submit">Sign in</button>
    <p class="mt-4 mb-3 text-body-secondary">&copy;Bloggs.com 2017–2023</p>
  </form>
</main>
</div></div></div></div>
</div>
</body>
</html>