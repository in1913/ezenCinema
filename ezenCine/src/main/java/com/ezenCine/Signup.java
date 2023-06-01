package com.ezenCine;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


@WebServlet("/Signin")
public class Signup extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("application/json");
		
		StringBuffer jb = new StringBuffer();
		String line = null;
		
		try {
			BufferedReader br = req.getReader();
			while((line =br.readLine()) != null)
				jb.append(line);
			
			
			
			JsonObject jsonObj = (JsonObject) JsonParser.parseString(jb.toString());
			
			System.out.println(jsonObj);
			/*
			userid : userid, userpass : userpass, username : username, 
            nickname : nickname, birthdate : birthdate, postcode : postcode, 
            addr : addr, detailaddr : detailaddr, email : email, tel : tel
            */
					
			String id = jsonObj.get("userid").getAsString();
			String password = jsonObj.get("userpass").getAsString();
			String username = jsonObj.get("username").getAsString();
			String email = jsonObj.get("email").getAsString();
			String nickname = jsonObj.get("nickname").getAsString();
			String birthdate = jsonObj.get("birthdate").getAsString();
			String tel = jsonObj.get("tel").getAsString();
			int postcode = jsonObj.get("postcode").getAsInt();
			String addrress = jsonObj.get("addr").getAsString();
			String detail_address = jsonObj.get("detailaddr").getAsString();
			
					
			
;		}catch(Exception e) {}
	}

}
