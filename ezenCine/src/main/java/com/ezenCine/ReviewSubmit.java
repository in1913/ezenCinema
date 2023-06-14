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

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import ezenCine.ShowReviewDDL;
import ezenCine.ShowReviewDTO;
import ezenCine.WriteReviewDDL;


@WebServlet("/ReviewSubmit")
public class ReviewSubmit extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		res.setContentType("application/json");
		
		HttpSession session = req.getSession();
		
		String userid = (String) session.getAttribute("userid");
		
		StringBuffer jb = new StringBuffer();
		String line = null;
		
		try {
			BufferedReader br = req.getReader();
			while((line = br.readLine()) != null)
				jb.append(line);
			
			JsonObject jsonObj = (JsonObject) JsonParser.parseString(jb.toString());
			String review = jsonObj.get("review").getAsString();
			String movieid = jsonObj.get("movieid").getAsString();
			int rating = jsonObj.get("rating").getAsInt();
			
			System.out.println("review : " + review);
			System.out.println("movieid : " + movieid);
			System.out.println("rating : " + rating);
			
			boolean isSuccess = WriteReviewDDL.insert(movieid, rating, userid, review);
			
			PrintWriter out = res.getWriter();
			br.close();
			Vector <ShowReviewDTO> data = ShowReviewDDL.selectInit(movieid);

			String gson = new Gson().toJson(data);
			
			
			if(isSuccess) {
				System.out.println("리뷰등록에 성공했습니다.");
				System.out.println(gson);
				out.println(gson);
				
			}else {
				System.out.println("리뷰등록에 실패했습니다.");
			}
			out.flush();
			out.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
