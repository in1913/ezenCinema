package com.ezenCine;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import ezenCine.LikeDDL;


@WebServlet("/DeleteLike")
public class DeleteLike extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("application/json; charset=utf-8");
		StringBuffer jb = new StringBuffer();
		String line = null;
		
		HttpSession session = req.getSession();
		try {
			BufferedReader br = req.getReader();
			while((line = br.readLine()) != null)
				jb.append(line);
			
			JsonObject jsonObj = (JsonObject) JsonParser.parseString(jb.toString());
			
			String movie_id = jsonObj.get("movieid").getAsString();
			int reviews_num = jsonObj.get("reviews_num").getAsInt();
			String userid = (String) session.getAttribute("userid");
			
			br.close();
			
			boolean isSuccess = LikeDDL.delete(movie_id, reviews_num,userid);
		
			PrintWriter out = res.getWriter();
			
			int doLike = 0;
		
			if(reviews_num == -1) {
				doLike = LikeDDL.selectLikesMovie(movie_id);
				boolean insertSuccess = LikeDDL.updateMovieLike(doLike, movie_id);
				if(isSuccess && insertSuccess) {
					out.println("{\"result\" : "+ doLike +"}");
					System.out.println("좋아요 삭제 성공");
				}else {
					out.println("{\"result\" : \"-1\"}");
					System.out.println("좋아요 삭제 실패");
				}
					
			}else {
				doLike = LikeDDL.selectLikesReviews(movie_id, reviews_num);
				boolean insertSuccess = LikeDDL.updateReviewsLike(doLike, movie_id, reviews_num);
				if(isSuccess && insertSuccess) {
					out.println("{\"result\" : "+ doLike +"}");
					System.out.println("좋아요 삭제 성공");
				}else {
					out.println("{\"result\" : \"-1\"}");
					System.out.println("좋아요 삭제 실패");
				}
				
			}
			out.flush();
			out.close();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

}
