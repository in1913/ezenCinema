<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ezenCine.*, java.sql.*, java.util.*"%>
<%
	String movie_id = request.getParameter("movie_id");
	String cinema_name = request.getParameter("cinema_name");
	String date = request.getParameter("date");
	String time = request.getParameter("time");
	ScreenDDL ddl = new ScreenDDL();
	int result = ddl.checkRemainingSeat(movie_id, date, cinema_name, time);
%>
<%=120 - result %> / 120석