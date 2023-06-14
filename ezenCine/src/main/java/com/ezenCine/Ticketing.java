package com.ezenCine;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ezenCine.TicketingDDL;
import ezenCine.TicketingDTO;


@WebServlet("/Ticketing")
public class Ticketing extends HttpServlet {
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
		String cost = request.getParameter("cost");
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("userid");
		
		TicketingDTO dto = new TicketingDTO();
		TicketingDDL ddl = new TicketingDDL();
		
		dto.setMovie_id(movie_id);
		dto.setScreen_date(date);
		dto.setCinema_name(cinema_name);
		dto.setScreen_time(time);
		dto.setSeat_num(seat);
		dto.setRoom_num(room);
		dto.setCost(cost);
		dto.setUser_id(user);
		
		boolean isSuccess = ddl.ticketing(dto);
		
		PrintWriter out = response.getWriter();
		if(isSuccess) {
			System.out.println("예매 성공");
			out.println(1);
		}else {
			out.println(0);
		}
		out.flush();
		out.close();
		
		doGet(request, response);
	}

}
