<%@page import="java.util.*"%>
<%@page import="blog.*" %>
<% 
ArrayList<Category> lk = new ArrayList<Category>();
/*lk = (ArrayList<Category>) s.getAttribute("lk");*/
DbHelper db = new DbHelper();
lk = db.getAllCategory();%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand" href="index.jsp">My blog</a>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <%! int i; %>
      <%for(i=0;i<lk.size();i++){ %>
      <li class="nav-item">
      	<% String link = "CategoryServlet?catID=" + lk.get(i).getId();%>
        <a class="nav-link" href=<%= link %>><%=lk.get(i).getName() %></a>
      </li>
      <%} %>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="PostServlet" method="post">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="searchField">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      <input type="hidden" name="action" value="search">
    </form>
    <form class="form-inline my-2 my-lg-0" method="get" action="UserServlet">
      <button class="btn btn-warning my-2 my-sm-0" style="margin-left: 10px;" type="submit">Logout</button>
    </form>
  </div>
</nav>