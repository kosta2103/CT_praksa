package lib_package;
import java.sql.*;

public class DbHelper 
{
	
	private Connection con;
	private Statement st;
	private ResultSet rs;
	
	public DbHelper()
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ct", "root", "");
			st = con.createStatement();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public void closeConnection()
	{
		if (rs != null) 
		{
	        try 
	        {
	            rs.close();
	        } 
	        catch (SQLException e) { }
	    }
	    if (st != null) 
	    {
	        try 
	        {
	            st.close();
	        } 
	        catch (SQLException e) {}
	    }
	    if (con != null) 
	    {
	        try 
	        {
	            con.close();
	        }
	        catch (SQLException e) {}
	    }
	}
	
	public ResultSet getData(String table)
	{
		String query = String.format("select * from %s", table);
		
		try 
		{
			rs = st.executeQuery(query);
			return rs;
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
			return null;
		}
	}
	
	
	//User methods
	
	public ResultSet getUser(int user_id)
	{
		String query = String.format("select * from users where user_id = %d", user_id);

		try 
		{
			rs = st.executeQuery(query);
			return rs;
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
			return null;
		}
	}
	
	public void insertUser(String name, String surname, String email)
	{		
		try 
		{
			String query = "insert into users(name, surname, email) values('%s', '%s', '%s')";
			query = String.format(query, name, surname, email);
			
			st.execute(query);
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
	}
	
	public void updateUser(int user_id, String name, String surname, String email)
	{
		try 
		{
			String query = "update users set name = '%s', surname = '%s', email = '%s' where user_id =  %d";
			query = String.format(query, name, surname, email, user_id);
			
			st.executeUpdate(query);
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
	}
	
	public void deleteUser(int user_id)
	{
		try 
		{
			String query = "delete from users where user_id = %d";
			query = String.format(query, user_id);
			
			st.execute(query);
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
	}
	
	
	//Book methods
	
	public ResultSet getBook(int book_id)
	{
		String query = String.format("select * from books where book_id = %d", book_id);

		try 
		{
			rs = st.executeQuery(query);
			return rs;
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
			return null;
		}
	}
	
	public void insertBook(String name, String author, String published_at, int quantity, int available)
	{		
		try 
		{
			String query = "insert into books(name, author, published_at, quantity, available) values('%s', '%s', '%s', '%d', '%d')";
			query = String.format(query, name, author, published_at, quantity, available);
			
			st.execute(query);
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
	}
	
	public void updateBook(int book_id, String name, String author, String published_at, int quantity, int available)
	{
		try 
		{
			String query = "update books set name = '%s', author = '%s', published_at = '%s', quantity = %d, available = %d where book_id =  %d";
			query = String.format(query, name, author, published_at, quantity, available, book_id);
			
			st.executeUpdate(query);
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
	}
	
	public void deleteBook(int book_id)
	{
		try 
		{
			String query = "delete from books where book_id = %d";
			query = String.format(query, book_id);
			
			st.execute(query);
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
	}
	
	public ResultSet searchForBook(String search)
	{
		String query = String.format("select * from books where INSTR(name,'%s') or INSTR(author,'%s')", search, search);
		
		try 
		{
			rs = st.executeQuery(query);
			return rs;
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
			return null;
		}
	}
	
	
	//Borrow methods
	
	public ResultSet getBorrowedData()
	{
		String query = String.format("SELECT users.user_id, users.name, users.surname, borrow.borrow_id, borrow.borrowed_at, borrow.returned_at, books.book_id, books.name AS book_name FROM users INNER JOIN borrow ON users.user_id = borrow.user_id INNER JOIN books ON borrow.book_id = books.book_id ORDER BY users.user_id");
		
		try 
		{
			rs = st.executeQuery(query);
			return rs;
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
			return null;
		}
	}
	
	public void insertBorrow(int user_id, int book_id, String borrowed_at, String returned_at)
	{
		try 
		{
			String query = "";
			String query1 = "";
			
			if(returned_at.compareTo("") == 0)
			{
				query = String.format("insert into borrow(user_id, book_id, borrowed_at) values('%d', '%d', '%s')", user_id, book_id, borrowed_at);
				query1 = String.format("update books set available = available - 1 where book_id = %d", book_id);
				
				st.execute(query);
				st.execute(query1);
			}
			else
			{
				query = String.format("insert into borrow(user_id, book_id, borrowed_at, returned_at) values('%d', '%d', '%s', '%s')", user_id, book_id, borrowed_at, returned_at);
				st.execute(query);
			}
		}
		catch (SQLException e) 
		{
			System.out.println(e);
		}	
	}
	
	public void updateBorrow(int borrow_id, String returned_at)
	{
		try
		{
			String query = String.format("update borrow set returned_at = '%s' where borrow_id = %d", returned_at, borrow_id);
			String query1 = String.format("update books set available = available + 1 where book_id = (select book_id from borrow where borrow_id = %d)", borrow_id);
			
			st.execute(query);
			st.execute(query1);
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
	}
	
}
