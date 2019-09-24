<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="header.html" %>
</head>
	<body>
	<% HttpSession s = request.getSession();
		String poruka = (String)s.getAttribute("Poruka");%> 
		 
		 <div class="container" style="width:70%; text-align:center; margin-top:100px;">
		 	<h1 style="font-size: 3.0rem;">Dobrodosli na moj blog. </h1>
		 	<h2>Potrebno je da se ulogujete.</h2>
		 
		 <form action="UserServlet" method="post">
		 <div class="form-group row">
		 	<label class="col-form-label">Username:</label>
		 	<input type="text" name="name">
		 </div>
		 <div class="form-group row">
		 	<label class="col-form-label">Password:</label>
		 	<input type="text" name="pass">
		 </div>
		 	<br><input class="btn btn-dark" type="submit">
		 	<input type="hidden" name="action" value="login">
		 </form>
		 </div>
		 <% if(poruka!=null){%>
		 <%= poruka %>
		 <%} %>
		 
	</body>
</html>