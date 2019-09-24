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
		Post post = (Post)s.getAttribute("post");
		ArrayList<Comment> lc = (ArrayList<Comment>)s.getAttribute("lc");
	if(u==null)
	{
		response.sendRedirect("loginPage.jsp");
		return;
	}%>
	<%@ include file="navbar.jsp" %>
	<div class="container" style="width:70%; text-align:center; margin-top:100px;">
	
	<%if(post!=null){%>
	<div style="background: #d1d1d1; margin-top: 15px;">
		<div class="row">
			<div class="col-sm-6"><h1><%=post.getTitle()%></h1></div>
			<div class="col-sm-3" style="display: flex;justify-content: center;align-items: center;">Objavljeno: <%=post.getDate() %></div>
			<div class="col-sm-2" style="display: flex;justify-content: center;align-items: center;"> Reputacija: <%=post.getReputation() %></div>
			<div class="col-sm-1" style="display: flex;justify-content: center;align-items: center;">
				<% if(post.getAuthorID()==u.getId()) %>
				<a href="#"><span class="glyphicon glyphicon-trash"></span></a>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12" style="background: #ffffff"><%= post.getContent() %></div>
		</div>
	</div>
	<hr>
	<% for(i=0;i<lc.size();i++){ %>
	<div class="row" style="background: #d1d1d1; margin-top: 15px;">
		<div class="col-sm-7" style="display: flex;justify-content: center;align-items: center;"><b>Naslov:</b><%= lc.get(i).getTitle()%></div>
		<div class="col-sm-4" style="display: flex;justify-content: center;align-items: center;"><b>Autor:</b><%=lc.get(i).getCommenter() %></div>
		<div class="col-sm-1" style="display: flex;justify-content: center;align-items: center;">
		<%if(u.getId() == lc.get(i).getUserID() || post.getAuthorID() == u.getId()) {%>
			<form action="CommentServlet?commentID=<%=lc.get(i).getId() %>" method="post"><button type="submit" class="btn btn-danger">Obrisi</button><input type="hidden" name="action" value="del"></form>
		<%} %>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12"><%=lc.get(i).getContent() %></div>
	</div>
	<hr>
	<%} %>
	<%}%>
	
	<div class="panel-group">
  	<div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" href="#collapse1">Dodaj komentar</a>
      </h4>
    </div>
    <div id="collapse1" class="panel-collapse collapse">
      <div class="panel-body">
      	<form action="CommentServlet" method="post">
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">Naslov</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="title" placeholder="naslov" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">Sadrzaj komentara:</label>
			<div class="col-sm-10">
				<textarea class="form-control" name="content" placeholder="Content" required>Uneti zeljeni komentar</textarea>
			</div>
		</div>
		<input type="hidden" name="action" value="add">
		<button class="btn btn-dark" type="submit">Dodaj komentar</button>
	 </div>
	</div>
  	</div>
	</div>
	
	</div>
</body>
</html>