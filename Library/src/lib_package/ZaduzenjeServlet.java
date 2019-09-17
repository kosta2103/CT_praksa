package lib_package;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ZaduzenjeServlet")
public class ZaduzenjeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	DbHelper db;
	
	@Override
	public void init() throws ServletException 
	{
		db = new DbHelper();
	}
	
    public ZaduzenjeServlet() 
    {
        super();
       
    }

    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String hidden = req.getParameter("hidden");
		
		if(hidden.compareTo("add") == 0)
		{
			int user_id = Integer.parseInt(req.getParameter("user_id"));
			int book_id = Integer.parseInt(req.getParameter("book_id"));
			String borrowed_at = req.getParameter("borrowed_at");
			String returned_at = req.getParameter("returned_at");
						
			db.insertBorrow(user_id, book_id, borrowed_at, returned_at);
			resp.sendRedirect("zaduzenje/dodavanje_zaduzenja.jsp");	
		}
		else if(hidden.compareTo("update") == 0)
		{
			int borrow_id = Integer.parseInt(req.getParameter("borrow_id"));
			String returned_at = req.getParameter("returned_at");
			
			db.updateBorrow(borrow_id, returned_at);
			resp.sendRedirect("zaduzenje/izmena_zaduzenja.jsp");	
		}
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String hidden = req.getParameter("hidden"); 
		
		if(hidden.compareTo("show_borrowed") == 0)
		{
			ResultSet rs = db.getBorrowedData();
			
			req.setAttribute("rs", rs);
			RequestDispatcher rd = req.getRequestDispatcher("zaduzenje/prikaz_korisnika_sa_zaduzenjima.jsp");
			rd.forward(req, resp);
		}
	}

	@Override
	public void destroy() 
	{
		db.closeConnection();
	}
	

}
