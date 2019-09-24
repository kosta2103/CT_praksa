package blog;

public class Post {
	private int id;
	private int catID;
	private int authorID;
	private int reputation;
	private String title;
	private String content;
	private String date;
	public Post(int id, int catID, int authorID, int reputation, String title, String content, String date) {
		super();
		this.id = id;
		this.catID = catID;
		this.authorID = authorID;
		this.reputation = reputation;
		this.title = title;
		this.content = content;
		this.date = date;
	}
	public Post() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCatID() {
		return catID;
	}
	public void setCatID(int catID) {
		this.catID = catID;
	}
	public int getAuthorID() {
		return authorID;
	}
	public void setAuthorID(int authorID) {
		this.authorID = authorID;
	}
	public int getReputation() {
		return reputation;
	}
	public void setReputation(int reputation) {
		this.reputation = reputation;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
