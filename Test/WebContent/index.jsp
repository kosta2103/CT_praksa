<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="java.util.ArrayList"%>
 <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<form action="/Test/TestServlet" method = "get">
		<!-- 	Ime <input name="name" type="text">
			Prezime <input name="surname" type="text"> -->
			<button type="submit">Prikaz</button>
		</form>
		
		<%
			if(request.getAttribute("data") != null)
			{
				ResultSet rs = (ResultSet) request.getAttribute("data");
				
				while(rs.next())
				{
					out.print("<li>"+ rs.getString("name") + " " + rs.getString("surname") + "</li>");	
				}
				
			}
		%>
		
		
		
</body>
</html>