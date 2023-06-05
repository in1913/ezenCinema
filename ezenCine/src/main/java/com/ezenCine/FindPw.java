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


@WebServlet("/FindPw")
public class FindPw extends HttpServlet {
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
			String sendemail = jsonObj.get("sendemail").getAsString();
			
			boolean isMem = MemberDDL.isMem(userid);
			
			PrintWriter out = res.getWriter();
			if(isMem) {
				String oauthCode = RandomCode.getRandomCode(6);
				OCIEmail.sendOCIEmail(sendemail, oauthCode);
				System.out.println("입력하신 이메일로 인증번호가 전송되었습니다. 시간 내에 인증확인을 해주세요.");
				System.out.println("{\"result\" : \"" + oauthCode + "\"}");
				out.println("{\"result\" : \"" + oauthCode + "\"}");
				
			}else {
				System.out.println("입력된 정보와 일치하는 회원정보가 없습니다.");
				out.println("{\"result\" : \"0\"}");
			}
		
			out.flush();
			out.close();
			
		}catch(Exception e) {}
	}

}
