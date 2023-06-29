package com.ezenCine;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ezenCine.StoreCartDDL;

@WebServlet("/PayDelete")
public class PayDelete extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.getWriter().append("Served at: ").append(req.getContextPath());
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		String itemnumAll = req.getParameter("itemnum");
		String num[] = itemnumAll.split(",");
		
		StoreCartDDL ddl = new StoreCartDDL();
		
		boolean isSuccess = false;
		for(int i = 0; i < num.length; i++) {
			isSuccess = ddl.deletePay(userid, Integer.parseInt(num[i]));			
		}
		
		PrintWriter out = res.getWriter();
		
		if(isSuccess) {
			System.out.println("장바구니 삭제 성공");
			out.println("1");
		}else {
			out.println("0");
		}
		out.flush();
		out.close();
		
	}

}
