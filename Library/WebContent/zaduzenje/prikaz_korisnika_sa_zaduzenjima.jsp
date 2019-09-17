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
		
		<div class="container" style="width:70%; text-align:center; margin-top:100px;">
		
			<form action="/Library/ZaduzenjeServlet" method = "get">
				<button type="submit" class="btn btn-dark">Prikazi sve aktivne clanove biblioteke sa zaduzenjima</button>
				<input type="hidden" name="hidden" value="show_borrowed">
			</form>
			
			
			<table class="table" style="margin-top: 20px;"> 
				<thead>
					<th scope="col"># pozajmice</th>
					<th scope="col"># korisnika</th>
				    <th scope="col">Ime</th>
				    <th scope="col">Prezime</th>
				    <th scope="col"># knjige</th>
				    <th scope="col">Naslov knjige</th>
				    <th scope="col">Datum pozajmljivanja</th>
				    <th scope="col">Datum povratka</th>
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
						<th scope="row"><%= rs.getString("borrow_id") %></th>
						<td><%= rs.getString("user_id") %></td>
						<td><%= rs.getString("name") %></td>
						<td><%= rs.getString("surname") %></td>
						<td> <%= rs.getString("book_id") %></td>
						<td> <%= rs.getString("book_name") %></td>
						<td> <%= rs.getString("borrowed_at") %></td>
						<td> <%= rs.getString("returned_at") %></td>
				    </tr>
		
				<% 	}
				}%>
			
				</tbody>
			</table>
		</div>
</body>
</html>