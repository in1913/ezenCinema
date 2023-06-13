package ezenCine;

public class TrailerDTO {
	private int num;
	private String movie_id;
	private String thumbnail;
	private String vodsrc;
	private String vodtitle;
	private String title;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getVodtitle() {
		return vodtitle;
	}
	public void setVodtitle(String vodtitle) {
		this.vodtitle = vodtitle;
	}
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
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getVodsrc() {
		return vodsrc;
	}
	public void setVodsrc(String vodsrc) {
		this.vodsrc = vodsrc;
	}
	
	
}
