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

import ezenCine.BookingDDL;
import ezenCine.BookingDTO;
import ezenCine.ReviewsDDL;
import ezenCine.ReviewsDTO;


@WebServlet("/MyPageMore")
public class MyPageMore extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		res.setContentType("application/json");
		
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		
		StringBuffer jb = new StringBuffer();
		String line = null;
		
		int moreNum = -1;
		int num = -1;
		
		PrintWriter out = res.getWriter();
		try {
			BufferedReader br = req.getReader();
			while((line = br.readLine()) != null)
				jb.append(line);
			JsonObject jsonObj = (JsonObject) JsonParser.parseString(jb.toString());
			moreNum = jsonObj.get("myPageNum").getAsInt();
			num = jsonObj.get("num").getAsInt();
		}catch(Exception e) {}
		
		if(moreNum == 0) {
			Vector <BookingDTO> bkd = BookingDDL.select(userid, num);
			String gson = new Gson().toJson(bkd);
			out.println(gson);
		}else if(moreNum == 1) {
			Vector <ReviewsDTO> bkd = ReviewsDDL.select(userid, num);
			String gson = new Gson().toJson(bkd);
			
			out.println(gson);
		}else if(moreNum == 2) {
			
		}
		
		out.flush();
		out.close();
	}

}
