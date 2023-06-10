package ezenCine;

public class TicketingDTO {
	private int num;
	private String Cinema_name;
	private String room_num;
	private String screen_date;
	private String screen_time;
	private String seat_num;
	private String movie_id;
	private String user_id;
	private String ticket_date;
	private String cost;
	
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCinema_name() {
		return Cinema_name;
	}
	public void setCinema_name(String cinema_name) {
		Cinema_name = cinema_name;
	}
	public String getRoom_num() {
		return room_num;
	}
	public void setRoom_num(String room_num) {
		this.room_num = room_num;
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
	public String getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(String seat_num) {
		this.seat_num = seat_num;
	}
	public String getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTicket_date() {
		return ticket_date;
	}
	public void setTicket_date(String ticket_date) {
		this.ticket_date = ticket_date;
	}
	
	
}
