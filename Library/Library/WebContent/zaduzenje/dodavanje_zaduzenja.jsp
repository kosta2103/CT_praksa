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
			<form action="/Library/ZaduzenjeServlet" method = "post">
				<div class="form-group row">
				    <label class="col-sm-2 col-form-label">ID korisnika</label>
				    <div class="col-sm-10">
				      <input type="number" class="form-control" name="user_id" placeholder="ID korniska" required>
				    </div>
			  	</div>
			  	
			  	<div class="form-group row">
				    <label class="col-sm-2 col-form-label">ID knjige</label>
				    <div class="col-sm-10">
				      <input type="number" class="form-control" name="book_id" placeholder="ID knjige" required>
				    </div>
			  	</div>
	
			    <div class="form-group row">
				    <label class="col-sm-2 col-form-label">Datum pozajmljivanja</label>
				    <div class="col-sm-10">
				      <input type="datetime-local" class="form-control" name="borrowed_at" placeholder="Datum pozajmljivanja" required>
				    </div>
		  		</div>
	
	
				<div class="form-group row">
				    <label class="col-sm-2 col-form-label">Datum povratka</label>
				    <div class="col-sm-10">
				      <input type="datetime-local" class="form-control" name="returned_at" placeholder="Datum povratka">
				    </div>
			  	</div>
			  	
				<input type="hidden" name="hidden" value="add">
				<button class="btn btn-dark" type="submit">Dodaj zaduzenje</button>
			</form>
		</div>
</body>
</html>