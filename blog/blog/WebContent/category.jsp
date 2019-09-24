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
		ArrayList<Post> lp = (ArrayList<Post>)s.getAttribute("lpcat");
	if(u==null)
	{
		response.sendRedirect("loginPage.jsp");
		return;
	}%>
	<%@ include file="navbar.jsp" %>
	<div class="container" style="width:70%; text-align:center; margin-top:100px;">
	<%if(lp!=null){
		System.out.println("LP nije null: "+lp.size());
	for(i=0;i<lp.size();i++) {%>
	<div style="background: #d1d1d1; margin-top: 15px;">
		<div class="row">
			<div class="col-sm-5"><h1><a href="PostServlet?postID=<%=lp.get(i).getId() %>"><%=lp.get(i).getTitle()%></a></h1></div>
			<div class="col-sm-3" style="display: flex;justify-content: center;align-items: center;">Objavljeno: <%=lp.get(i).getDate() %></div>
			<div class="col-sm-2" style="display: flex;justify-content: center;align-items: center;"> Reputacija: <%=lp.get(i).getReputation() %></div>
			<div class="col-sm-1" style="display: flex;justify-content: center;align-items: center;">
				<% if(lp.get(i).getAuthorID()==u.getId()) %>
				<a href="#"><span class="glyphicon glyphicon-trash"></span></a>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12" style="background: #ffffff"><%= lp.get(i).getContent() %></div>
		</div>
	</div>
	<hr>
	<%}} %>
	</div>
</body>
</html>