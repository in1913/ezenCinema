<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*, java.text.*"%>
<%
	String movie_id = request.getParameter("movie_id");
	String cinema_name = request.getParameter("cinema_name");
	String datetime = request.getParameter("date");
	String time = request.getParameter("time");
	String run = request.getParameter("run");
	String room = request.getParameter("room");
	Vector<MovieDTO> dto = MovieDDL.viewMovieDetail(movie_id);
	DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
    DateFormat outputFormat = new SimpleDateFormat("yyyy년 M월 d일");


    java.util.Date Cdate = inputFormat.parse(datetime);
    String formattedDate = outputFormat.format(Cdate);

%>    

<div class="result_left">
	<div class="book_poster_area mr-3">
<%
	for(MovieDTO dt : dto){
%>
		<img src="<%=dt.getPoster_url() %>" alt="#" />
	</div>
	<ul class="book_screen_info">
		<li>
			<img src="images/ico/ico-age-<%=dt.getLimit_age() %>.png" alt="#" />
			<span class="book_movie_title"><%=dt.getTitle() %></span>
		</li>
<%
	}
%>
		<li class="book_date_info">
			<span class="mr-2"><%=formattedDate %></span>
			<span><%=run %></span>
		</li>
		<li class="book_cinema_info"><%=cinema_name %> <%=room %>관</li>
	</ul>
</div>
<div class="result_right">
	<ul class="book_result_info">
		<li>
			<span>선택좌석</span> <span id="selected_seat_info" class="sub1"></span>
		</li>
		<li>
			<span>인원</span> <span id="selected_people_num" class="sub1"></span>
		</li>
		<li class="text4 mt-4 result_cost_text">최종 결제 금액</li>
		<li class="sub1 result_cost"></li>
		<li class="pay_btn_box">
			<span class="select_reset_btn" id="select_reset_btn"></span>
			<span class="payment_btn" id="payment_btn">결제하기</span>
		</li>
	</ul>
</div>