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
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import ezenCine.LikeDDL;
import ezenCine.MovieDDL;
import ezenCine.MovieDTO;

@WebServlet("/CheckLikeReview")
public class CheckLikeReview extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		res.setContentType("application/json");
		
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		
		StringBuffer jb = new StringBuffer();
		String line = null;
		
		String movieid = "";
		int reviews_num = 0;
		
		PrintWriter out = res.getWriter();
		
		try {
			BufferedReader br = req.getReader();
			while((line = br.readLine()) != null)
				jb.append(line);
			JsonObject jsonObj = (JsonObject) JsonParser.parseString(jb.toString());
			movieid = jsonObj.get("movieid").getAsString();
			reviews_num = jsonObj.get("reviews_num").getAsInt();
			
			boolean isLiked = LikeDDL.checkReviewLikeUser(movieid, reviews_num, userid);
			
			int doLike = LikeDDL.selectLikesReviews(movieid, reviews_num);
			
			if(isLiked) {
				System.out.println("이미 좋아요를 누른 사용자 입니다.");
				out.println("{\"result\" : \"1\", \"likes\" : \"" + doLike +"\"}");
			}else {
				System.out.println("좋아요를 누르지 않은 사용자입니다.");
				out.println("{\"result\" : \"0\", \"likes\" : \"" + doLike +"\"}");
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	
		out.flush();
		out.close();
	}

}
