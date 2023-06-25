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
import ezenCine.StorePayDDL;
import ezenCine.StorePayDTO;

@WebServlet("/Pay")
public class Pay extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.getWriter().append("Served at: ").append(req.getContextPath());
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		String items = req.getParameter("items");
		int totalcost = Integer.parseInt(req.getParameter("totalcost"));
		String[] item = items.split(",");
		System.out.println(items);
		System.out.println(item[0]);
		
		StorePayDDL pddl = new StorePayDDL();
		StorePayDTO pdto = new StorePayDTO();
		StoreCartDDL cddl = new StoreCartDDL();
		
		pdto.setUserid(userid);
		pdto.setTotalcost(totalcost);
		pdto.setItems(items);
		
		boolean isSuccess = pddl.pay(pdto);
		for(int i = 0; i < item.length; i++) {
			boolean isSuccess2 = cddl.pay(userid, Integer.parseInt(item[i]));			
		}
		
		PrintWriter out = res.getWriter();
		
		if(isSuccess) {
			System.out.println("결제 성공");
			out.println("1");
		}else {
			out.println("0");
		}
		out.flush();
		out.close();
	}

}
