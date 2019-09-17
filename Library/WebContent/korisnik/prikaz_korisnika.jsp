<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*" %>
<%@page import="lib_package.DbHelper" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="../header.html" %>
</head>
<body>
		<%@ include file="../navbar.html" %>
		
		<div class="container" style="width:40%; text-align:center; margin-top:100px;">
		
			<form action="/Library/KorisnikServlet" method = "get">
				<button type="submit" class="btn btn-dark">Prikazi sve aktivne clanove biblioteke</button>
				<input type="hidden" name="hidden" value="show">
			</form>
			
			
			<table class="table" style="margin-top: 20px;"> 
				<thead>
					<th scope="col">#</th>
				    <th scope="col">Ime</th>
				    <th scope="col">Prezime</th>
				    <th scope="col">Email</th>
				</thead>
				 <tbody>
				    
			<%
				if(request.getAttribute("rs") != null)
				{
					ResultSet rs = (ResultSet) request.getAttribute("rs");
				
				
					while(rs.next())
					{
				%>
					<tr>
						<th scope="row"><%= rs.getString("user_id") %></th>
						<td><%= rs.getString("name") %></td>
						<td><%= rs.getString("surname") %></td>
						<td> <%= rs.getString("email") %></td>
				    </tr>
		
				<% 	}
				}%>
			
				</tbody>
			</table>
		</div>
</body>
</html>