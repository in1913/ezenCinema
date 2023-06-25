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
import ezenCine.StoreCartDTO;

@WebServlet("/StoreCartUpdate")
public class StoreCartUpdate extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		res.getWriter().append("Served at: ").append(req.getContextPath());
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		int itemnum = Integer.parseInt(req.getParameter("itemnum"));
		int count = Integer.parseInt(req.getParameter("count"));
		
		StoreCartDDL ddl = new StoreCartDDL();
		
		boolean isSuccess = ddl.cartUpdate(count, userid, itemnum);
		
		PrintWriter out = res.getWriter();
		
		if(isSuccess) {
			System.out.println("장바구니 업데이트 성공");
			out.println("1");
		}else {
			out.println("0");
		}
		out.flush();
		out.close();
	}

}
