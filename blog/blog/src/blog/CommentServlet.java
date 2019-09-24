package blog;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	DbHelper db;
	
	public void init() throws ServletException 
	{
		db = new DbHelper();
	}
    public CommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession s = request.getSession();
		User u = (User)s.getAttribute("activeUser");
		
		if(action.compareTo("add") == 0)
		{
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int currentPost =(Integer)s.getAttribute("currentPost");
			db.insertComment(currentPost, u.getId(), content, title);
			ArrayList<Comment> lc= db.getAllComentsForPost(currentPost);
			s.setAttribute("lc", lc);
			response.sendRedirect("post.jsp");
		}
		if(action.compareTo("del") == 0)
		{
			int currentPost =(Integer)s.getAttribute("currentPost");
			System.out.println("cid: "+request.getParameter("commentID"));
			int commentID = Integer.parseInt(request.getParameter("commentID"));
			db.deleteComment(commentID);
			ArrayList<Comment> lc= db.getAllComentsForPost(currentPost);
			s.setAttribute("lc", lc);
			response.sendRedirect("post.jsp");
		}
	}

}
