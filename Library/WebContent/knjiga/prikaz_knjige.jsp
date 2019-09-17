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
			
				<form action="/Library/KnjigaServlet" method = "get">
					<button type="submit" class="btn btn-dark">Prikazi sve knjige u biblioteci</button>
					<input type="hidden" name="hidden" value="show">
				</form>
				
				
				<table class="table" style="margin-top: 20px;"> 
					<thead>
						<th scope="col">#</th>
					    <th scope="col">Naziv knjige</th>
					    <th scope="col">Autor</th>
					    <th scope="col">Datum publikacije</th>
					    <th scope="col">Kolicina</th>
					    <th scope="col">Dostupno primeraka</th>
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
							<th scope="row"><%= rs.getString("book_id") %></th>
							<td><%= rs.getString("name") %></td>
							<td><%= rs.getString("author") %></td>
							<td> <%= rs.getString("published_at") %></td>
							<td> <%= rs.getString("quantity") %></td>
							<td> <%= rs.getString("available") %></td>
					    </tr>
			
					<% 	}
					}%>
				
					</tbody>
				</table>
			</div>
	</body>
</html>