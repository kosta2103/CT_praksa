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
		<form action="../KnjigaServlet" method = "post">
			<div class="form-group row">
			    <label class="col-sm-2 col-form-label">Naslov</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="name" placeholder="Naslov knjige" required>
			    </div>
		  	</div>
		  	
		  	<div class="form-group row">
			    <label class="col-sm-2 col-form-label">Autor</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="author" placeholder="Autor" required>
			    </div>
		  	</div>

		    <div class="form-group row">
			    <label class="col-sm-2 col-form-label">Datum poblikacije</label>
			    <div class="col-sm-10">
			      <input type="date" class="form-control" name="published_at" placeholder="Datum publikacije" required>
			    </div>
		  	</div>
		  	
		  	<div class="form-group row">
			    <label class="col-sm-2 col-form-label">Kolicina</label>
			    <div class="col-sm-10">
			      <input type="number" class="form-control" name="quantity" placeholder="Kolicina" required>
			    </div>
		  	</div>
		  	
		  	<div class="form-group row">
			    <label class="col-sm-2 col-form-label">Dostupno primeraka</label>
			    <div class="col-sm-10">
			      <input type="number" class="form-control" name="available" placeholder="Dostupno primeraka" required>
			    </div>
		  	</div>

			<input type="hidden" name="hidden" value="add">
			<button class="btn btn-dark" type="submit">Dodaj knjigu</button>
		</form>
	</div>
</body>
</html>