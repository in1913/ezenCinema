package com.ezenCine;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import ezenCine.ReviewsDDL;
import ezenCine.ShowReviewDDL;


@WebServlet("/ReviewCnt")
public class ReviewCnt extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		res.setContentType("application/json");
		
		StringBuffer jb = new StringBuffer();
		String line = null;
		
		try {
			BufferedReader br = req.getReader();
			while((line = br.readLine()) != null)
				jb.append(line);
			
			JsonObject jsonObj = (JsonObject) JsonParser.parseString(jb.toString());
				
			String movie_id = jsonObj.get("movieid").getAsString();
			
			System.out.println(movie_id);
			
			PrintWriter out = res.getWriter();
			
			br.close();
			
			int reviewCnt = ShowReviewDDL.selectAllNum(movie_id);
			
			out.println("{\"result\" : \"" + reviewCnt + "\"}");
			out.flush();
			out.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
