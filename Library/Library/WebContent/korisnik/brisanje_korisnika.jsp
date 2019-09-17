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
			    <label class="col-sm-2 col-form-label">ID</label>
			    <div class="col-sm-10">
			      <input type="number" class="form-control" name="user_id" placeholder="Broj clanske karte ili email adresa korisnika" required>
			    </div>
		  	</div>
		
			<input type="hidden" name="hidden" value="delete">
			<button class="btn btn-dark" type="submit">Obrisi clana biblioteke</button>
		</form>
	</div>
</body>
</html>