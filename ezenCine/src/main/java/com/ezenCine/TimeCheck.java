package com.ezenCine;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezenCine.ScreenDDL;


@WebServlet("/TimeCheck")
public class TimeCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String movie_id = request.getParameter("movie_id");
		String date = request.getParameter("date");
		String cinema_name = request.getParameter("cinema_name");
		System.out.println(movie_id);
		System.out.println(date);
		System.out.println(cinema_name);
		ScreenDDL ddl = new ScreenDDL();
		Boolean isSuccess = ddl.checkMovieTime(movie_id, date, cinema_name);
		System.out.println(isSuccess);
		PrintWriter out = response.getWriter();
		if(isSuccess) {
			out.println("1");
		}else {
			out.println("0");
		}
		
		doGet(request, response);
	}

}
