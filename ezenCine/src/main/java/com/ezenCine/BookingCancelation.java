package com.ezenCine;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezenCine.TicketingDDL;


@WebServlet("/BookingCancelation")
public class BookingCancelation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		TicketingDDL ddl = new TicketingDDL();
		boolean result = ddl.bookingCancelation(num);
		
		PrintWriter out = response.getWriter();
		
		if(result) {
			out.println(0);
		}else {
			out.println(1);
		}
		
		out.flush();
		out.close();
	}

}
