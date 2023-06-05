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

import ezenCine.MemberDDL;


@WebServlet("/FindId")
public class FindId extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}

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
			String username = jsonObj.get("username").getAsString();	
			String useremail = jsonObj.get("useremail").getAsString();
			
			String userid = MemberDDL.findID(username, useremail);
			
			PrintWriter out = res.getWriter();
			
			if(userid == null) {
				System.out.println("입력된 정보와 일치하는 아이디가 없습니다.");
				out.println("{\"result\" : \"0\"}");
			}else {
				System.out.println(username + "님의 아이디는" + userid + "입니다.");
				out.println("{\"result\" : \"" + userid + "\"}");
			}
			
			out.flush();
			out.close();
			
		}catch(Exception e) {}
				
	}

}
