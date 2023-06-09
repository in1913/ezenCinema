package ezenCine;

public class BookingDTO {
	private String title;
	private int ticket_num;
	private String seat_num;
	private String room_num;
	private String ticket_date;
	private int ticket_day;
	private String screen_date;
	private int screen_day;
	private String poster_url;
	private String screen_time;
	
	public String getPoster_url() {
		return poster_url;
	}
	public void setPoster_url(String poster_url) {
		this.poster_url = poster_url;
	}
	public int getTicket_day() {
		return ticket_day;
	}
	public void setTicket_day(int ticket_day) {
		this.ticket_day = ticket_day;
	}
	public int getScreen_day() {
		return screen_day;
	}
	public void setScreen_day(int screen_day) {
		this.screen_day = screen_day;
	}
	public String getRoom_num() {
		return room_num;
	}
	public void setRoom_num(String room_num) {
		this.room_num = room_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getTicket_num() {
		return ticket_num;
	}
	public void setTicket_num(int ticket_num) {
		this.ticket_num = ticket_num;
	}
	public String getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(String seat_num) {
		this.seat_num = seat_num;
	}
	public String getTicket_date() {
		return ticket_date;
	}
	public void setTicket_date(String ticket_date) {
		this.ticket_date = ticket_date;
	}
	public String getScreen_date() {
		return screen_date;
	}
	public void setScreen_date(String screen_date) {
		this.screen_date = screen_date;
	}
	public String getScreen_time() {
		return screen_time;
	}
	public void setScreen_time(String screen_time) {
		this.screen_time = screen_time;
	}
	
	
}
