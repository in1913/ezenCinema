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

import ezenCine.LikeDDL;
import ezenCine.LikeDTO;
import ezenCine.ShowReviewDDL;
import ezenCine.ShowReviewDTO;


@WebServlet("/ClickLikeOrder")
public class ClickLikeOrder extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		res.setContentType("application/json");
		
		StringBuffer jb = new StringBuffer();
		String line = null;
		
		String movieid = "";
		int isCurrent = 0;
		
		PrintWriter out = res.getWriter();
		try {
			BufferedReader br = req.getReader();
			while((line = br.readLine()) != null)
				jb.append(line);
			JsonObject jsonObj = (JsonObject) JsonParser.parseString(jb.toString());
			movieid = jsonObj.get("movieid").getAsString();
			isCurrent = jsonObj.get("isCurrent").getAsInt();
		}catch(Exception e) {}
		
		if(isCurrent == 0) {
			Vector <ShowReviewDTO> bkd = ShowReviewDDL.selectInitLike(movieid);
			String gson = new Gson().toJson(bkd);
			System.out.println(gson);
			out.println(gson);
		}else {
			Vector <ShowReviewDTO> bkd = ShowReviewDDL.selectInit(movieid);
			String gson = new Gson().toJson(bkd);
			System.out.println(gson);
			out.println(gson);
		}
	
		out.flush();
		out.close();
	}

}
