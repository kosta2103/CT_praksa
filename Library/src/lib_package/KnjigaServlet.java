package lib_package;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/KnjigaServlet")
public class KnjigaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	DbHelper db;
  
	@Override
	public void init() throws ServletException 
	{
		db = new DbHelper();
	}
	
    public KnjigaServlet() 
    {
        super();
    }

	
    
    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String hidden = req.getParameter("hidden");
		
		if(hidden.compareTo("add") == 0)
		{
			String name = req.getParameter("name");
			String author = req.getParameter("author");
			String published_at = req.getParameter("published_at");
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			int available = Integer.parseInt(req.getParameter("available"));
			
			db.insertBook(name, author, published_at, quantity, available);
			resp.sendRedirect("knjiga/dodavanje_knjige.jsp");
		}
		else if(hidden.compareTo("delete") == 0)
		{
			int book_id = Integer.parseInt(req.getParameter("book_id"));
			db.deleteBook(book_id);
			resp.sendRedirect("knjiga/brisanje_knjige.jsp");
		}
		else if(hidden.compareTo("update") == 0)
		{
			try 
			{
				int book_id = Integer.parseInt(req.getParameter("book_id"));
				ResultSet rs = db.getBook(book_id);
				rs.next();
								
				String name = req.getParameter("name");
				String author = req.getParameter("author");
				String published_at = req.getParameter("published_at");
				int quantity = 0;
				int available = 0;

				if(req.getParameter("quantity").isEmpty())
				{
					quantity = rs.getInt("quantity");
				}
				else
				{
					quantity = Integer.parseInt(req.getParameter("quantity"));
				}
					
				if(req.getParameter("available").isEmpty())
				{
					available = rs.getInt("available");
				}
				else
				{
					available = Integer.parseInt(req.getParameter("available"));
				}
				
				if(name.isEmpty())
				{
					name = rs.getString("name");
				}
				if(author.isEmpty())
				{
					author = rs.getString("author");
				}
				if(published_at.isEmpty())
				{
					published_at = rs.getString("published_at");
				}
				

				db.updateBook(book_id, name, author, published_at, quantity, available);
				
				resp.sendRedirect("knjiga/izmena_knjige.jsp");	
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
			ResultSet rs = db.getData("books");
			
			req.setAttribute("rs", rs);
			RequestDispatcher rd = req.getRequestDispatcher("knjiga/prikaz_knjige.jsp");
			rd.forward(req, resp);
		}
		else if(hidden.compareTo("search") == 0)
		{	
			String search = req.getParameter("search");
			ResultSet rs = db.searchForBook(search);
	
			req.setAttribute("searched_data", rs);
			RequestDispatcher rd = req.getRequestDispatcher("knjiga/pretrazivanje_knjige.jsp");
			rd.forward(req, resp);
		}
		
	}
	
	
	@Override
	public void destroy() 
	{
		db.closeConnection();
	}

}
