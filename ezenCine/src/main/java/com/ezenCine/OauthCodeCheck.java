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
import ezenCine.OCIEmail;
import ezenCine.RandomCode;


@WebServlet("/OauthCodeCheck")
public class OauthCodeCheck extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		res.setContentType("application/json");
		
		StringBuffer jb = new StringBuffer();
		String line = null;
		
		HttpSession session = req.getSession();
		String oauthCode = (String) session.getAttribute("oauthCode");
		session.removeAttribute(oauthCode);
		
		PrintWriter out = res.getWriter();
		
		try {
			BufferedReader br = req.getReader();
			while((line = br.readLine()) != null)
				jb.append(line);
			
			JsonObject jsonObj = (JsonObject) JsonParser.parseString(jb.toString());
			String userOauth = jsonObj.get("oauthCode").getAsString();
			
			if(userOauth.equals(oauthCode)) {
				out.println("{\"result\" : \"1\"}");
				
			}else {
				out.println("{\"result\" : \"0\"}");
			}
			
			
			
						
		}catch(Exception e) {}
	}

}
