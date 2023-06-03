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


@WebServlet("/CheckId")
public class CheckId extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		
		StringBuffer jb = new StringBuffer();
		String line = null;
		
		try {
			BufferedReader br = req.getReader();
			while((line =br.readLine()) != null)
				jb.append(line);
			
			JsonObject jsonObj = (JsonObject) JsonParser.parseString(jb.toString());
			
			String userid = jsonObj.get("userid").getAsString();
			
			boolean isSuccess = MemberDDL.checkId(userid);
			
			PrintWriter out = res.getWriter();
			
			if(isSuccess) {
				System.out.println("중복된 아이디가 있습니다.");
				out.println("0");
			}else {
				System.out.println("사용할 수 있는 아이디입니다.");
				out.println("{\"result\" : " + "\"" + userid + "\"}");
			}
			
			out.flush();
			out.close();
			
		}catch(Exception e) {}
	}

}
