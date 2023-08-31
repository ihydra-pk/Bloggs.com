<%@page import="com.utility.User"%>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="bi bi-pencil-square"></i>&nbspBloggs.com</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

			</ul>



			<%
			User user = (User) session.getAttribute("loggedin-user");
			if (user != null) {
			%>

<div class="dropdown div-flex">
  <a class="btn dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
    <%=user.getFname()%>
  </a>

  <ul class="dropdown-menu " aria-labelledby="dropdownMenuLink">
    <li><a class="dropdown-item" href="myposts.jsp">Dashboard</a></li>
  <!--   <li><a class="dropdown-item" href="#">Another action</a></li> -->
    <li><hr class="dropdown-divider"></li>
    <li><a class="dropdown-item" href="signoutconfirm.jsp">Sign Out</a></li>
  </ul>
</div>
			
			<form action="new.jsp" method="post">
			<input type="hidden" value=<%=user.getId()%> name="hd">
		<button type="submit" class="btn btn-outline-primary">Create
			Post</button></form>

		<%
	} else {
	%>

	<div class="div-flex">
		<a href="login.jsp" type="button" class="btn btn-light">Log in</a> 
		<a href="register.jsp" type="button" class="btn btn-outline-primary">Create
			Account</a>

	<%
	}
	%>
	</div>
	</div>
	</div>
</nav>

