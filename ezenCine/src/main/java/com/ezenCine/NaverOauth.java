package com.ezenCine;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import ezenCine.MemberDDL;
import ezenCine.SnsOauth;

@WebServlet("/NaverOauth")
public class NaverOauth extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String getQuery = (String) session.getAttribute("Query");
		String OriginURL = "index.jsp";
		if(getQuery == null || getQuery == "" || getQuery.contains("signupSns")) {
		}else {
			OriginURL += "?" + getQuery;
		}
		
		System.out.println("URL : " + OriginURL);
		String code = req.getParameter("code");
		String state = req.getParameter("state");
		String token = SnsOauth.getNaverAccessToken(code, state);
		
		String result = "";
		
		String reqURL = "https://openapi.naver.com/v1/nid/me";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setRequestProperty("Authorization", "Bearer " + token);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			JsonObject jsonObj = (JsonObject) JsonParser.parseString(result);
			
			System.out.println(jsonObj);
			
			String id = jsonObj.get("response").getAsJsonObject().get("id").getAsString();
			String nickname = jsonObj.get("response").getAsJsonObject().get("nickname").getAsString();
			String email = jsonObj.get("response").getAsJsonObject().get("email").getAsString();
			
			String[] emailArr = email.split("@");
			String emailFront = emailArr[0];
			String emailBack = emailArr[1];
			
			String tel = jsonObj.get("response").getAsJsonObject().get("mobile").getAsString();
			String name = jsonObj.get("response").getAsJsonObject().get("name").getAsString();
			
			if(tel.length() == 12) {
				tel = tel.substring(0, 3) + tel.substring(4, 7) + tel.substring(8);
			}else if(tel.length() == 13){
				tel = tel.substring(0, 3) + tel.substring(4, 8) + tel.substring(9);
			}
			
			String userid = MemberDDL.checkSnsUser("naver" + id);
			
			session.removeAttribute("Query");
			
			System.out.println("네이버 로그인 정보(닉네임, 이메일, 전화번호, 이름) 받기 완료");
			if(userid != null) {
				session.setAttribute("userid", userid);
				session.setAttribute("level", 1);
				res.sendRedirect(OriginURL);
			}else {
				req.setAttribute("snsid", "naver" + id);
				req.setAttribute("emailFront", emailFront);
				req.setAttribute("emailBack", emailBack);
				req.setAttribute("nickname", nickname);
				req.setAttribute("tel", tel);
				req.setAttribute("name", name);
				req.getRequestDispatcher("signupSns.jsp").forward(req, res);
			}
			
			br.close();
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}

}
