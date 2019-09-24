package blog;


import java.sql.Blob;

public class User {

	private int id;
	private String name;
	private Blob picture;
	String base64Image;
	public User(int id, String name, Blob picture,String base64Image) {
		super();
		this.id = id;
		this.name = name;
		this.picture = picture;
		this.base64Image=base64Image;
	}
	public User() {
		this.id = -1;
		this.name="";
		this.picture=null;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Blob getPicture() {
		return picture;
	}
	public void setPicture(Blob picture) {
		this.picture = picture;
	}
	public String getBase64Image() {
		return base64Image;
	}
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
	
	
}
