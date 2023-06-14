package com.ezenCine;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezenCine.MovieDDL;


@WebServlet("/SearchMovie")
public class SearchMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		MovieDDL ddl = new MovieDDL();
		String id = ddl.searchMovie(title);
		PrintWriter out = response.getWriter();
		
		out.println(id);
		
		doGet(request, response);
	}

}
