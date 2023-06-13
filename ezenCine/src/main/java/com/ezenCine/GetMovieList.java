package com.ezenCine;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ezenCine.MovieDDL;
import ezenCine.MovieDTO;

@WebServlet("/GetMovieList")
public class GetMovieList extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		res.setContentType("application/json");
		
		Vector <MovieDTO> data = MovieDDL.selectMovieList();
		String gson = new Gson().toJson(data);
		
		PrintWriter out = res.getWriter();
		
		out.println(gson);
		
		out.flush();
		out.close();
		
		
	}

}
