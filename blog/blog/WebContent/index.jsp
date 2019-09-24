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
		ArrayList<Post> lp = (ArrayList<Post>)s.getAttribute("lp");
	if(u==null)
	{
		response.sendRedirect("loginPage.jsp");
		return;
	}%>
	<%@ include file="navbar.jsp" %>
	<div class="container" style="width:70%; text-align:center; margin-top:100px;">
	<center>
	<img src="data:image/jpeg;base64,<%=u.getBase64Image()%>" style="width: 100px; height: 100px;">
	<%System.out.println(u.getBase64Image()); %>
	<h1>Uspesno si se ulogovao!</h1>
	<h2>Pozdrav <a href="UserServlet?action=profile"><%= u.getName()%></a></h2></center>
	<div class="panel-group">
  	<div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" href="#collapse1">Unos novog posta</a>
      </h4>
    </div>
    <div id="collapse1" class="panel-collapse collapse">
      <div class="panel-body">
      	<form action="PostServlet" method="post">
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">Naslov</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="title" placeholder="naslov" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">Kategorija:</label>
			<div class="col-sm-10">
				<select name="category" class="browser-default custom-select" placeholder="izabrati kategoriju" >
			    <% for(i=0;i<lk.size();i++) {%>
  					<option value="<%=lk.get(i).getId()%>"><%=lk.get(i).getName()%></option>
  				<%} %>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">Sadrzaj posta:</label>
			<div class="col-sm-10">
				<textarea class="form-control" name="content" placeholder="Content" required>Uneti zeljeni tekst</textarea>
			</div>
		</div>
		<input type="hidden" name="action" value="add">
		<button class="btn btn-dark" type="submit">Dodaj post</button></form>
	 </div>
	</div>
  	</div>
	</div>
	
	<%if(lp!=null){
	for(i=0;i<lp.size();i++) {%>
	<div style="background: #d1d1d1; margin-top: 15px;">
		<div class="row">
			<div class="col-sm-5"><h1><a href="PostServlet?postID=<%=lp.get(i).getId() %>"><%=lp.get(i).getTitle()%></a></h1></div>
			<div class="col-sm-3" style="display: flex;justify-content: center;align-items: center;">Objavljeno: <%=lp.get(i).getDate() %></div>
			<div class="col-sm-2" style="display: flex;justify-content: center;align-items: center;"> Reputacija: <%=lp.get(i).getReputation() %></div>
			<form action="PostServlet" method="post"><div class="col-sm-2" style="display: flex;justify-content: center;align-items: center;font-size: 5px;">
				<% if(lp.get(i).getAuthorID()==u.getId()){ %>
				<input type="hidden" name="postID" value="<%=lp.get(i).getId()%>"><button type="submit" class="btn btn-danger">Delete post</button>
				<input type="hidden" name="action" value="delete">
				<%}else{%><form action="PostServlet" method="post"><input type="hidden" name="postID" value="<%=lp.get(i).getId()%>"><button type="submit" class="btn btn-outline-success">Upvote post</button>
				<input type="hidden" name="action" value="up"><%} %>
			</div></form>
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