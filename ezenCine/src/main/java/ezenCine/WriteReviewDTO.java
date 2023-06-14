package ezenCine;

public class WriteReviewDTO {
	private int num;
	private String movie_id;
	private double rating;
	private String date;
	private String member_id;
	private String comments;
	private int like;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	
	
}
