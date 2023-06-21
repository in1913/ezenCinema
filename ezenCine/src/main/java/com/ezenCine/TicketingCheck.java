package com.ezenCine;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezenCine.TicketingDDL;


@WebServlet("/TicketingCheck")
public class TicketingCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String movie_id = request.getParameter("movie_id");
		String date = request.getParameter("date");
		String cinema_name = request.getParameter("cinema_name");
		String time = request.getParameter("time");
		String seat = request.getParameter("seat");
		String room = request.getParameter("room");
		
		TicketingDDL ddl = new TicketingDDL();
		
		boolean isSuccess = ddl.checkSeat(movie_id, date, cinema_name, time, seat, room);
		
		PrintWriter out = response.getWriter();
		if(isSuccess) {
			System.out.println("늦으셨네여ㅠㅠ");
			out.println(0);
		}else {
			out.println(1);
		}
		out.flush();
		out.close();
		
		doGet(request, response);
	}

}
