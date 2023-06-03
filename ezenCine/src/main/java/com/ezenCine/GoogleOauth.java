package com.ezenCine;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;

import ezenCine.MemberDDL;


@WebServlet("/GoogleOauth")
public class GoogleOauth extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String getQuery = (String) session.getAttribute("Query");
		String OriginURL = "index.jsp";
		if(getQuery == null || getQuery == "" || getQuery.contains("signupSns")) {
		}else {
			OriginURL += "?" + getQuery;
		}
		
		System.out.println("URL : " + OriginURL);
		
		String token = req.getParameter("credential");
		
		System.out.println(token);
		
		JsonFactory gsonFactory = new GsonFactory();
		
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(), gsonFactory)
				.setAudience(Collections.singletonList("523081570143-oanpb57bceggc2v5jnqgf13dc5u86laj.apps.googleusercontent.com"))
				.build();
		
		GoogleIdToken idToken = null;
		
		try {
			idToken = verifier.verify(token);
		}catch(GeneralSecurityException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		if(idToken != null) {
			Payload payload = idToken.getPayload();
			
			System.out.println(payload);
			
			String id = payload.getSubject();
			String email = payload.getEmail();
			
			String[] emailArr = email.split("@");
			String emailFront = emailArr[0];
			String emailBack = emailArr[1];
			
			String familyName = (String) payload.get("family_name");
			String givenName = (String) payload.get("given_name");
			
			String userid = MemberDDL.checkSnsUser("google" + id);
			
			session.removeAttribute("Query");
			
			System.out.println("구글 로그인 정보(이름, 이메일) 받기 완료");
			
			if(userid != null) {
				session.setAttribute("userid", userid);
				session.setAttribute("level", 1);
				res.sendRedirect(OriginURL);
			}else {
				req.setAttribute("snsid", "google" + id);
				req.setAttribute("emailFront", emailFront);
				req.setAttribute("emailBack", emailBack);
				req.setAttribute("nickname", "");
				req.setAttribute("tel", "");
				req.setAttribute("name", familyName + givenName);
				req.getRequestDispatcher("index.jsp?fname=mem/signupSns").forward(req, res);
			}
			
		}else {
			System.out.println("구글 로그인 정보(이름, 이메일) 받기 실패");
		}
	}

}
