<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*"%>

<%
String movie_id = request.getParameter("movie_id");
String date = request.getParameter("date");
String cinema_name = request.getParameter("cinema_name");
Vector<ScreenDTO> sto = ScreenDDL.showTime(movie_id, date, cinema_name); 
int runtime = MovieDDL.selectRuntime(movie_id);
%>
<%
	for(ScreenDTO st : sto){
		String hour = null;
		String min = null;
		String start = st.getTime();
		String[] start_arr = start.split(":");
		int hr = Integer.parseInt(start_arr[0]);
		int mr = Integer.parseInt(start_arr[1]);
		int h = runtime / 60;
		int m = runtime % 60;
		int hrr = hr + h;
		int mrr = mr + m;
		if(mrr >= 60){
			mrr = mrr - 60;
			hrr = hrr + 1;
			hour = Integer.toString(hrr);
			min = Integer.toString(mrr);
		}
		else if(mrr < 10){
			hour = Integer.toString(hrr);
			min = "0" + Integer.toString(mrr);
		}else{
			hour = Integer.toString(hrr);
			min = Integer.toString(mrr);
		}
		
		
%>
	<li class="h-b-time-btn">
		<div class="h-time"><%=st.getTime() %>~<%=hour %>:<%=min %></div>
		<div class="h-sit">좌석 0/<%=st.getTotal_seats() %></div>
		<input type="radio" name="timeselect"/>
	</li>
<%
	}
%>