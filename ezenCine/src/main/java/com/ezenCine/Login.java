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


@WebServlet("/Login")
public class Login extends HttpServlet {
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
			
			boolean isSuccess = MemberDDL.Login(userid, userpass);
			
			PrintWriter out = res.getWriter();
			
			HttpSession session = req.getSession();
			
			if(isSuccess) {
				System.out.println("로그인 되었습니다.");
				out.println("1");
				session.setAttribute("userid", userid);
				session.setAttribute("level", 1);
			}else {
				System.out.println("입력하신 정보와 일치하는 아이디 또는 비밀번호가 없습니다.");
				out.println("0");
			}
		}catch(Exception e) {}
	}

}
