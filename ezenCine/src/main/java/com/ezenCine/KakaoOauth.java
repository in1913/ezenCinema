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

@WebServlet("/KakaoOauth")
public class KakaoOauth extends HttpServlet {
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
		String token = SnsOauth.getKakaoAccessToken(code);
		String result = "";
		String idStr = "";
		String email = "";
		
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
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
			long id = jsonObj.get("id").getAsLong();
			idStr = Long.toString(id);
			boolean hasEmail = jsonObj.get("kakao_account").getAsJsonObject().get("has_email").getAsBoolean();
		        
			if(hasEmail){
				email = jsonObj.get("kakao_account").getAsJsonObject().get("email").getAsString();
				
				String[] emailArr = email.split("@");
				String emailFront = emailArr[0];
				String emailBack = emailArr[1];
				
				String userid = MemberDDL.checkSnsUser("kakao" + idStr);
				System.out.println("카카오 로그인 정보(이메일) 받기 완료");
				
				session.removeAttribute("Query");
			
				if(userid != null) {
					session.setAttribute("userid", userid);
					session.setAttribute("level", 1);
					res.sendRedirect(OriginURL);
				}else {
					req.setAttribute("snsid", "kakao" + idStr);
					req.setAttribute("emailFront", emailFront);
					req.setAttribute("emailBack", emailBack);
					req.setAttribute("nickname", "");
					req.setAttribute("tel", "");
					req.setAttribute("name", "");
					req.getRequestDispatcher("index.jsp?fname=mem/signupSns").forward(req, res);
				}
				
			}else {
				System.out.println("카카오 로그인 정보(이메일) 받기 실패");
			}
			br.close();
			
		}catch(IOException e) {
			e.printStackTrace();
		}
				
		
		
		

		
		
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}

}
