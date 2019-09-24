<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="blog.*" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="header.html" %>
</head>
<body>
	<%HttpSession s = request.getSession(); %>
	<% 	User u = (User)s.getAttribute("activeUser");
	if(u==null)
	{
		response.sendRedirect("loginPage.jsp");
		return;
	}%>
	<%@ include file="navbar.jsp" %>

	<div class="container" style="width:70%; text-align:center; margin-top:100px;">
	<h1>Promena slike na profilu:</h1>
	<form action="UserServlet" method="post">
		<input type="file" name="photo" size="50">
		<input type="hidden" name="action" value="changePhoto">
		<input type="submit" value="Upload">
	</form>
	</div>
</body>
</html>