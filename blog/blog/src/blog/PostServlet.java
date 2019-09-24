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
 * Servlet implementation class PostServlet
 */
@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	DbHelper db;
	
	public void init() throws ServletException 
	{
		db = new DbHelper();
	}
    public PostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int postID = Integer.parseInt(request.getParameter("postID"));
		HttpSession s = request.getSession();
		Post post = db.getPostByID(postID);
		ArrayList<Comment> lc= db.getAllComentsForPost(postID);
		s.setAttribute("lc", lc);
		s.setAttribute("post", post);
		s.setAttribute("currentPost", postID);
		response.sendRedirect("post.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession s = request.getSession();
		String title = (String) request.getParameter("title");
		String content = (String) request.getParameter("content");
		User u = (User)s.getAttribute("activeUser");
		
		if(action.compareTo("add") == 0)
		{
			int catID = Integer.parseInt(request.getParameter("category"));
			String name = request.getParameter("name");
			String pass = request.getParameter("pass");
			db.insertPost(title, content, catID, u.getId());
			ArrayList<Post> lp = new ArrayList<Post>();
			lp = db.getAllPosts();
			s.setAttribute("lp", lp);
			response.sendRedirect("index.jsp");
		}
		if(action.compareTo("up") == 0)
		{
			System.out.println("REPUP POST");
			int postID = Integer.parseInt(request.getParameter("postID"));
			db.reputationUP(postID);
			ArrayList<Post> lp = new ArrayList<Post>();
			lp = db.getAllPosts();
			s.setAttribute("lp", lp);
			response.sendRedirect("index.jsp");
		}
		if(action.compareTo("delete") == 0)
		{
			int postID = Integer.parseInt(request.getParameter("postID"));
			db.deletePost(postID);
			ArrayList<Post> lp = new ArrayList<Post>();
			lp = db.getAllPosts();
			s.setAttribute("lp", lp);
			response.sendRedirect("index.jsp");
		}
		if(action.compareTo("search") == 0)
		{
			String searchField = request.getParameter("searchField");
			ArrayList<Post> lps;
			lps = db.searchPost(searchField);
			s.setAttribute("lpsearch", lps);
			response.sendRedirect("search.jsp");
		}
	}

}
