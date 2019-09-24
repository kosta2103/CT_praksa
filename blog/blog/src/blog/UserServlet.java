package blog;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.DbHelper;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	DbHelper db;
	
	public void init() throws ServletException 
	{
		db = new DbHelper();
	}
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		String action = request.getParameter("action");
		if(action!=null) {
		if(action.compareTo("profile")==0)
		{
			User u = (User)s.getAttribute("activeUser");
			response.sendRedirect("profile.jsp");
		}
		}
		else
		{
		s.invalidate();
		response.sendRedirect("loginPage.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession s = request.getSession();
		if(action.compareTo("register") == 0)
		{
			String name = request.getParameter("name");
			String pass = request.getParameter("pass");
			db.insertUser(name,pass);
			response.sendRedirect("loginPage.jsp");
		}
		if(action.compareTo("login") == 0)
		{
			String name = request.getParameter("name").trim();
			String pass = request.getParameter("pass").trim();
			if(name!=null&& name.length()>0&&pass!=null&&pass.length()>0)
			{
				
				User u = db.login(name, pass);
				//ArrayList<Category> lk = new ArrayList<Category>();
				//lk = db.getAllCategory();
				//s.setAttribute("lk", lk);
				ArrayList<Post> lp = new ArrayList<Post>();
				lp = db.getAllPosts();
				s.setAttribute("lp", lp);
				s.setAttribute("activeUser", u);
				if(u!=null)
				{
					response.sendRedirect("index.jsp");
				}
				else
					response.sendRedirect("loginPage.jsp");
			}
		}
		if(action.compareTo("changePhoto") == 0)
		{
			User u = (User)s.getAttribute("activeUser");
			String photo = request.getParameter("photo");
			System.out.println(photo);
			db.updateUserPicture(photo, u.getId());
			User active = db.getUser(u.getId());
			s.setAttribute("activeUser", active);
			response.sendRedirect("profile.jsp");
		}
	}

}
