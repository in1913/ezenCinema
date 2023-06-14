package com.ezenCine;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import ezenCine.ReviewsDDL;
import ezenCine.ShowReviewDDL;
import ezenCine.ShowReviewDTO;


@WebServlet("/ReviewModi")
public class ReviewModi extends HttpServlet {
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
			String comments = jsonObj.get("review").getAsString();	
			double rating = jsonObj.get("rating").getAsDouble();
			String movie_id = jsonObj.get("movie_id").getAsString();
			int reviews_num = jsonObj.get("reviews_num").getAsInt();
			
			PrintWriter out = res.getWriter();
			
			br.close();
			
			boolean isSuccess = ReviewsDDL.ReviewsUpdate(comments, rating, movie_id, reviews_num);
			
			if(isSuccess) {
				System.out.println("리뷰가 수정되었습니다.");
				out.println("1");
				
			}else {
				System.out.println("리뷰 수정이 실패했습니다.");
				out.println("0");
			}
			
			out.flush();
			out.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
