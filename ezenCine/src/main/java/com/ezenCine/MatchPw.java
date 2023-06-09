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

import ezenCine.MemberDDL;

@WebServlet("/MatchPw")
public class MatchPw extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	}

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
			while((line =br.readLine()) != null)
				jb.append(line);
			
			JsonObject jsonObj = (JsonObject) JsonParser.parseString(jb.toString());
			
			String curuserpass = jsonObj.get("curuserpass").getAsString();
			System.out.println(curuserpass);
			boolean isSuccess = MemberDDL.MatchPw(userid, curuserpass);
			
			PrintWriter out = res.getWriter();
			
			if(isSuccess) {
				System.out.println("비밀번호가 일치합니다.");
				out.println("1");
			}else {
				System.out.println("비밀번호가 일치하지 않습니다.");
				out.println("0");
			}
			
			out.flush();
			out.close();
			
		}catch(Exception e) {}
		
	}

}
