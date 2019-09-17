package lib_package;
import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/KorisnikServlet")

public class KorisnikServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	DbHelper db;

	public void init() throws ServletException 
	{
		db = new DbHelper();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String hidden = req.getParameter("hidden");
		
		if(hidden.compareTo("add") == 0)
		{
			String name = req.getParameter("name");
			String surname = req.getParameter("surname");
			String email = req.getParameter("email");
			
			db.insertUser(name, surname, email);
			resp.sendRedirect("korisnik/dodavanje_korisnika.jsp");
		}
		else if(hidden.compareTo("delete") == 0)
		{
			int user_id = Integer.parseInt(req.getParameter("user_id"));
			db.deleteUser(user_id);
			resp.sendRedirect("korisnik/brisanje_korisnika.jsp");
		}
		else if(hidden.compareTo("update") == 0)
		{
			try 
			{
				int user_id = Integer.parseInt(req.getParameter("user_id"));
				ResultSet rs = db.getUser(user_id);
				rs.next();
				
				String name = req.getParameter("name");
				String surname = req.getParameter("surname");
				String email = req.getParameter("email");
				
				
				if(name.isEmpty())
				{
					name = rs.getString("name");
				}
				if(surname.isEmpty())
				{
					surname = rs.getString("surname");
				}
				if(email.isEmpty())
				{
					email = rs.getString("email");
				}

				db.updateUser(user_id, name, surname, email);
				
				resp.sendRedirect("korisnik/izmena_korisnika.jsp");	
			} 
			catch (Exception e) 
			{
				System.out.println(e);
			}
			
		}
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String hidden = req.getParameter("hidden");

		if(hidden.compareTo("show") == 0)
		{
			ResultSet rs = db.getData("users");
			
			req.setAttribute("rs", rs);
			RequestDispatcher rd = req.getRequestDispatcher("korisnik/prikaz_korisnika.jsp");
			rd.forward(req, resp);
		}
		
	}

	@Override
	public void destroy() 
	{
		db.closeConnection();
	}
}
