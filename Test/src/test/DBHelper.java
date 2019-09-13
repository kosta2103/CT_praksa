package test;

import java.sql.*;

public class DBHelper 
{
	private Connection con;
	private Statement statement;
	private ResultSet rs;
	
	
	public DBHelper()
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_ct", "root", "");
			statement = con.createStatement();
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	
	public ResultSet getData()
	{
		try
		{
			String query = "select * from users";
			
			rs = statement.executeQuery(query);
			
			return rs;
			/*while(rs.next())
			{
				String name = rs.getString("name");
				String surname = rs.getString("surname");
				
				
				System.out.println(name + surname);
			}*/
		} 
		catch (Exception e) 
		{
			System.out.println(e);
			return null;
		}
	}
	
}
