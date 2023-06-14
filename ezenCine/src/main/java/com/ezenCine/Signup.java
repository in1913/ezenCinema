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
import ezenCine.MemberDTO;

@WebServlet("/Signup")
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
					
			String id = jsonObj.get("userid").getAsString();
			String password = jsonObj.get("userpass").getAsString();
			String username = jsonObj.get("username").getAsString();
			String email = jsonObj.get("email").getAsString();
			String nickname = jsonObj.get("nickname").getAsString();
			String birthdate = jsonObj.get("birthdate").getAsString();
			String tel = jsonObj.get("tel").getAsString();
			int postcode = jsonObj.get("postcode").getAsInt();
			String address = jsonObj.get("addr").getAsString();
			String detail_address = jsonObj.get("detailaddr").getAsString();
			int emailAgree = jsonObj.get("emailAgree").getAsInt();
			int SMSAgree = jsonObj.get("SMSAgree").getAsInt();
			
			if(tel.length() == 10) {
				tel = tel.substring(0, 3) + "-" + tel.substring(3, 6) + "-" + tel.substring(6);
			}else if(tel.length() == 11){
				tel = tel.substring(0, 3) + "-" + tel.substring(3, 7) + "-" + tel.substring(7);
			}
			System.out.println(tel);
			
			
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setPassword(password);
			dto.setUsername(username);
			dto.setEmail(email);
			dto.setNickname(nickname);
			dto.setBirthdate(birthdate);
			dto.setTel(tel);
			dto.setPostcode(postcode);
			dto.setAddress(address);
			dto.setDetail_address(detail_address);
			dto.setEmail_agree(emailAgree);
			dto.setSms_agree(SMSAgree);
			
			boolean isSuccess = MemberDDL.insert(dto);
			
			PrintWriter out = res.getWriter();
			
			if(isSuccess) {
				System.out.println("회원가입 성공");
				out.println("1");
			}else {
				System.out.println("회원가입 실패");
				out.println("0");
			}
			out.flush();
			out.close();
					
			
		}catch(Exception e) {}
		
	}

}
