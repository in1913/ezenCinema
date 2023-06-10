<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*"%>
<%
	String movie_id = request.getParameter("movie_id");
	String cinema_name = request.getParameter("cinema_name");
	String date = request.getParameter("date");
	String time = request.getParameter("time");
	String[] row = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J"};
	ScreenDDL ddl = new ScreenDDL();
	
	for(int i = 0 ; i < 10 ; i++){
%>
	<li class="seat_box">
		<span class="seat_row"><%=row[i] %></span>
	<%
		for(int j = 1 ; j <= 12 ; j++){
			String seat = row[i] + Integer.toString(j);
			boolean result = ddl.checkSeat(movie_id, date, cinema_name, time, seat);
			if(result){
	%>
		<span class="seat completed">
			<%=j %>
			<input class="seat_hidden" type="hidden" value="<%=seat%>" />
		</span>
	<%
			}else{
	%>
		<span class="seat unselected">
			<%=j %>
			<input class="seat_hidden" type="hidden" value="<%=seat%>" />
		</span>
	<%
			}
		}
	%>
	</li>
<%
	}
%>