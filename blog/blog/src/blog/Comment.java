package blog;

public class Comment {

	private int id;
	private int postID;
	private int userID;
	private String content;
	private String title;
	private String commenter;
	public Comment(int id, int postID, int userID, String content,String title,String commenter) {
		super();
		this.id = id;
		this.postID = postID;
		this.userID = userID;
		this.content = content;
		this.title = title;
		this.commenter = commenter;
		
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Comment() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPostID() {
		return postID;
	}
	public void setPostID(int postID) {
		this.postID = postID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCommenter() {
		return commenter;
	}
	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}
	
	
}
