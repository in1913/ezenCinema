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
import ezenCine.OCIEmail;
import ezenCine.RandomCode;


@WebServlet("/UpdatePw")
public class UpdatePw extends HttpServlet {
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
			String userid = jsonObj.get("userid").getAsString();	
			String userpass = jsonObj.get("userpass").getAsString();
			
			boolean isSuccess = MemberDDL.updatePW(userid, userpass);
			
			PrintWriter out = res.getWriter();
			
			if(isSuccess) {
				System.out.println("비밀번호가 업데이트 되었습니다.");
				out.println("{\"result\" : \"1\"}");
				
			}else {
				System.out.println("오류가 발생하여 비밀번호를 업데이트하지 못했습니다.");
				out.println("{\"result\" : \"0\"}");
			}
			
			
			
			
			
			
			out.flush();
			out.close();
		}catch(Exception e) {}
	}

}
