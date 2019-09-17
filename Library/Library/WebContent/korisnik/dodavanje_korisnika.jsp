<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../header.html" %>
</head>
<body>
	<%@ include file="../navbar.html" %>
	
	<div class="container" style="width:40%; text-align:center; margin-top:100px;">
		<form action="../KorisnikServlet" method = "post">
			<div class="form-group row">
			    <label class="col-sm-2 col-form-label">Ime</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="name" placeholder="Ime" required>
			    </div>
		  	</div>
		  	
		  	<div class="form-group row">
			    <label class="col-sm-2 col-form-label">Prezime</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="surname" placeholder="Prezime" required>
			    </div>
		  	</div>

		    <div class="form-group row">
			    <label class="col-sm-2 col-form-label">Email</label>
			    <div class="col-sm-10">
			      <input type="email" class="form-control" name="email" placeholder="Email adresa" required>
			    </div>
		  	</div>

			<input type="hidden" name="hidden" value="add">
			<button class="btn btn-dark" type="submit">Dodaj clana biblioteke</button>
		</form>
	</div>
</body>
</html>