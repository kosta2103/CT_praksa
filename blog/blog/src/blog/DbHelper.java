package blog;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.*;


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
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog", "root", "");
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
		} catch (SQLException e) {

			System.out.println(e);
			return null;
		}
	}
	
	
	//User methods
	
	public User getUser(int userID)
	{
		String query = String.format("select * from user where userID = %d", userID);
		User u= new User();
		try 
		{
			rs = st.executeQuery(query);
			u = new User();
			u.setId(rs.getInt("userID"));
			u.setName(rs.getString("name"));
			Blob blob = rs.getBlob("picture");
			InputStream inputStream = blob.getBinaryStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
             
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);                  
            }
             
            byte[] imageBytes = outputStream.toByteArray();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            u.setBase64Image(base64Image);
            
			return u;
		} catch (SQLException e) {

			System.out.println(e);
			return null;
		} catch (IOException e) {
			System.out.println(e);
		}
		return u;
	}
	

	public void insertUser(String name, String pass)
	{
		try 
		{
			
			String query = "insert into user(username, password) values('%s', '%s')";
			query = String.format(query, name, pass);
			
			st.execute(query);
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
	}
	public void updateUserPicture(String picString, int userID)
	{
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("update user set picture=? where userID=?");
		    FileInputStream fin = new FileInputStream(picString);
			ps1.setBlob(1, fin);
			ps1.setInt(2, userID);
			ps1.executeUpdate();
			System.out.println("Uploadovana slika!");
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		} catch (FileNotFoundException e) {
			System.out.println(e);
		}
	}
	public User login(String name, String pass)
	{
		String query = String.format("select * from user where username = '%s' AND password = '%s'", name,pass);
		User u=new User();
		try 
		{
			rs = st.executeQuery(query);
			rs.next();
			u=new User();
			u.setId(rs.getInt("userID"));
			u.setName(rs.getString("username"));
			Blob blob = rs.getBlob("picture");
			if(blob!=null)
			{
				InputStream inputStream = blob.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;
             
				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);                  
				}
             
				byte[] imageBytes = outputStream.toByteArray();
				String base64Image = Base64.getEncoder().encodeToString(imageBytes);
				u.setBase64Image(base64Image);
			}
			return u;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		} catch (IOException e) {
			System.out.println(e);
		}
		return u;
	}
	
//	public void updateUser(int user_id, String name, String surname, String email)
//	{
//		try 
//		{
//			String query = "update users set name = '%s', surname = '%s', email = '%s' where user_id =  %d";
//			query = String.format(query, name, surname, email, user_id);
//			
//			st.executeUpdate(query);
//		} 
//		catch (SQLException e) 
//		{
//			System.out.println(e);
//		}
//	}
	
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
	
	
	//Category
	
	public Category getCategory(int catID)
	{
		String query = String.format("select * from category where categoryID = %d", catID);

		try 
		{
			Category cat = new Category();
			
			rs = st.executeQuery(query);
			cat.setId(rs.getInt("categoryID"));
			cat.setName(rs.getString("name"));
			return cat;
		} catch (SQLException e) {

			System.out.println(e);
			return null;
		}
	}
	
	public ArrayList<Category> getAllCategory()
	{
		String query = String.format("select * from category");
		ArrayList<Category> listaKategorija = new ArrayList<Category>();
		try 
		{
			Category cat = new Category();
			
			rs = st.executeQuery(query);
			while(rs.next())
			{
				cat = new Category();
				cat.setId(rs.getInt("categoryID"));
				cat.setName(rs.getString("name"));
				listaKategorija.add(cat);
			}
			return listaKategorija;
		} catch (SQLException e) {

			System.out.println(e);
			return null;
		}
	}
	
	//POST
	
	public void insertPost(String title, String content, int catID, int userID)
	{		
		try 
		{
			String query = "insert into post (categoryID, authorID, reputation, title, content, date) values(%d, %d, %d, '%s', '%s', NOW())";
			query = String.format(query, catID, userID, 0, title, content);
			st.execute(query);
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
	}
	
	public ArrayList<Post> getAllPosts()
	{
		String query = String.format("select * from post ORDER BY reputation DESC");
		ArrayList<Post> lp = new ArrayList<Post>();
		Post p;
		try 
		{
			rs = st.executeQuery(query);
			while(rs.next())
			{
				p = new Post();
				p.setId(rs.getInt("postID"));
				p.setTitle(rs.getString("Title"));
				p.setContent(rs.getString("Content"));
				p.setAuthorID(rs.getInt("authorID"));
				p.setCatID(rs.getInt("categoryID"));
				p.setDate(rs.getString("date"));
				p.setReputation(rs.getInt("reputation"));
				lp.add(p);
			}
			return lp;
		} catch (SQLException e) {

			System.out.println(e);
			return null;
		}
	}
	public ArrayList<Post> getAllPostsByCategory(int catID)
	{
		String query = String.format("select * from post where categoryID = %d",catID);
		ArrayList<Post> lp = new ArrayList<Post>();
		Post p;
		try 
		{
			rs = st.executeQuery(query);
			while(rs.next())
			{
				p = new Post();
				p.setId(rs.getInt("postID"));
				p.setTitle(rs.getString("Title"));
				p.setContent(rs.getString("Content"));
				p.setAuthorID(rs.getInt("authorID"));
				p.setCatID(rs.getInt("categoryID"));
				p.setDate(rs.getString("date"));
				p.setReputation(rs.getInt("reputation"));
				lp.add(p);
			}
			return lp;
		} catch (SQLException e) {

			System.out.println(e);
			return null;
		}
	}
	public Post getPostByID(int postID)
	{
		String query = String.format("select * from post where postID=%d",postID);
		Post p;
		try 
		{
			rs = st.executeQuery(query);
			rs.next();
				p = new Post();
				p.setId(rs.getInt("postID"));
				p.setTitle(rs.getString("Title"));
				p.setContent(rs.getString("Content"));
				p.setAuthorID(rs.getInt("authorID"));
				p.setCatID(rs.getInt("categoryID"));
				p.setDate(rs.getString("date"));
				p.setReputation(rs.getInt("reputation"));
			return p;
		} catch (SQLException e) {

			System.out.println(e);
			return null;
		}
	}
	
	public ArrayList<Post> searchPost(String searchField)
	{
		PreparedStatement ps1;
		ArrayList<Post> lpsearch = new ArrayList<Post>();
		Post p;
		try 
		{
			ps1 = con.prepareStatement("select * from post where title Like ?");
			ps1.setString(1,"%"+searchField+"%");
			rs = ps1.executeQuery();
			System.out.println(ps1);
			while(rs.next())
			{
				
				p = new Post();
				p = new Post();
				p.setId(rs.getInt("postID"));
				p.setTitle(rs.getString("Title"));
				p.setContent(rs.getString("Content"));
				p.setAuthorID(rs.getInt("authorID"));
				p.setCatID(rs.getInt("categoryID"));
				p.setDate(rs.getString("date"));
				p.setReputation(rs.getInt("reputation"));
				lpsearch.add(p);
			}
			return lpsearch;
		} catch (SQLException e) {

			System.out.println(e);
			return null;
		}
	}
	
	public void deletePost(int postID)
	{
	
		try 
		{
			String query = "delete from post where postID=%d";
			query = String.format(query, postID);
			st.execute(query);
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
	}
	public void reputationUP(int postID)
	{
		try 
		{
			String query = "update post set reputation = reputation + 1 where postID =  %d";
			query = String.format(query, postID);
			st.executeUpdate(query);
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
	}
	//Comment
	public ArrayList<Comment> getAllComentsForPost(int postID)
	{
		String query = String.format("SELECT commentID,postID,authorID,content,title,user.username AS 'commenter' FROM comment, user WHERE comment.authorID = user.userID and postID =%d",postID);
		ArrayList<Comment> lc = new ArrayList<Comment>();
		Comment c;
		try 
		{
			rs = st.executeQuery(query);
			while(rs.next())
			{
				c = new Comment();
				c.setId(rs.getInt("commentID"));
				c.setPostID(rs.getInt("postID"));
				c.setUserID(rs.getInt("authorID"));
				c.setContent(rs.getString("content"));
				c.setTitle(rs.getString("title"));
				c.setCommenter(rs.getString("commenter"));
				lc.add(c);
			}
			return lc;
		} catch (SQLException e) {

			System.out.println(e);
			return null;
		}
	}
	public void insertComment(int postID, int userID, String content, String title)
	{
		try 
		{
			String query = "insert into comment ( postID, authorID, content, title) values(%d, %d, '%s', '%s')";
			query = String.format(query, postID, userID, title, content);
			st.execute(query);
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
	}
	public void deleteComment(int commentID)
	{
		try 
		{
			String query = "delete from comment where commentID = %d";
			query = String.format(query, commentID);
			st.execute(query);
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
	}
}
