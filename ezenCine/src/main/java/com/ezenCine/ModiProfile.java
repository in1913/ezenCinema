package com.ezenCine;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ezenCine.MemberDDL;
import ezenCine.MemberDTO;

@WebServlet("/ModiProfile")
public class ModiProfile extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("utf-8");
		req.setCharacterEncoding("utf-8");
		res.setContentType("application/json");
		
		MemberDTO dto = new MemberDTO();
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		String dir = req.getSession().getServletContext().getRealPath("./upload/users");
		System.out.println(dir);
		
		
		int max = 10 * 1024 * 1024;
		
		try{
			MultipartRequest m = new MultipartRequest(req, dir, max, "UTF-8",
					new DefaultFileRenamePolicy());
			String password = m.getParameter("password");
			String username = m.getParameter("username");
			String nickname = m.getParameter("nickname");
			String email = m.getParameter("email");
			String tel = m.getParameter("tel");
			int postcode = Integer.parseInt(m.getParameter("postcode"));
			String address = m.getParameter("addr");
			String detail_address = m.getParameter("detailaddr");
			String photo = m.getFilesystemName("userImg");
			int email_agree = Integer.parseInt(m.getParameter("emailAgree"));
			int sms_agree = Integer.parseInt(m.getParameter("smsAgree"));
			int isBasicPhoto = Integer.parseInt(m.getParameter("isBasicPhoto"));
			
			System.out.println(photo);
			
			if(tel.length() == 10) {
				tel = tel.substring(0, 3) + "-" + tel.substring(3, 6) + "-" + tel.substring(6);
			}else if(tel.length() == 11){
				tel = tel.substring(0, 3) + "-" + tel.substring(3, 7) + "-" + tel.substring(7);
			}
			
			System.out.println("password : " + password);
			System.out.println("username : " + username);
			System.out.println("nickanme : " + nickname);
			System.out.println("email : " + email);
			System.out.println("tel : " + tel);
			System.out.println("postcode : " + postcode);
			System.out.println("address : " + address);
			System.out.println("detail_address : " + detail_address);
			System.out.println("photo : " + photo);
			System.out.println("email_agree : " + email_agree);
			System.out.println("sms_agree : " + sms_agree);
			
			
			// photo 가 null로 들어오면 업데이트를 하지않음
			// 기본이미지로 변경하면 photo는 null로 들어오는데?
			// 그럼 마이페이지에서 기본이미지로 보여지는 것이 아니라 
			// 이전 이미지로 보여짐
			
			// 그럼 null 로 들어오면 업데이트 하지 않고 메서드 updateProfilePhotoNull
			// 기본이미지로 들어오면 photo를 null로 업데이트 updateProfilePhotoBasic
			boolean isSuccess = false;
			if(isBasicPhoto == 0) {
				if(photo == null) {
					// 업데이트 안함
					dto.setPassword(password);
					dto.setUsername(username);
					dto.setNickname(nickname);
					dto.setEmail(email);
					dto.setTel(tel);
					dto.setPostcode(postcode);
					dto.setAddress(address);
					dto.setDetail_address(detail_address);
					dto.setEmail_agree(email_agree);
					dto.setSms_agree(sms_agree);
					isSuccess = MemberDDL.updateProfilePhotoNot(dto, userid);
				}else {
					// 업데이트 함
					dto.setPassword(password);
					dto.setUsername(username);
					dto.setNickname(nickname);
					dto.setEmail(email);
					dto.setTel(tel);
					dto.setPostcode(postcode);
					dto.setAddress(address);
					dto.setDetail_address(detail_address);
					dto.setPhoto(photo);
					dto.setEmail_agree(email_agree);
					dto.setSms_agree(sms_agree);
					isSuccess = MemberDDL.updateProfilePhoto(dto, userid);
				}
				
				
				
			}else {
				// 기본 이미지일 때 photo null 로 업데이트
				dto.setPassword(password);
				dto.setUsername(username);
				dto.setNickname(nickname);
				dto.setEmail(email);
				dto.setTel(tel);
				dto.setPostcode(postcode);
				dto.setAddress(address);
				dto.setDetail_address(detail_address);
				dto.setPhoto(null);
				dto.setEmail_agree(email_agree);
				dto.setSms_agree(sms_agree);
				isSuccess = MemberDDL.updateProfilePhoto(dto, userid);
				
			}	
			
			
			PrintWriter out = res.getWriter();
			if(isSuccess) {
				System.out.println("성공적으로 프로필 수정이 완료되었습니다.");
				out.println("1");
			}else {
				System.out.println("프로필 수정이 실패했습니다.");
				out.println("0");
			}
			out.flush();
			out.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
