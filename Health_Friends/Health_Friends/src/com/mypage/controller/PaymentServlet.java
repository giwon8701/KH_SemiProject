package com.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dto.RegistDto;
import com.mypage.biz.PaymentBiz;
import com.mypage.biz.PaymentBizImpl;

@WebServlet("/payment.do")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		PaymentBiz biz = new PaymentBizImpl();
		
		// 나중에 까먹지 말고 삭제할것
		System.out.println("---" + command + "---");
		
		
		if(command.equals("payment")){
			response.sendRedirect("./views/mypage/payment.jsp");
		} else if(command.equals("paymentUpdate")) {
			
			
			String member_email = request.getParameter("buyer_email");
			
			RegistDto dto = new RegistDto();
			
			dto.setMember_email(member_email);
			
			int res = biz.paymentUpdate(dto);
			
			
		} else if(command.equals("paymentDowndate")) {
			
			String member_email = request.getParameter("buyer_email");
			
			RegistDto dto = new RegistDto();
			
			dto.setMember_email(member_email);
			
			System.out.println(dto.getMember_email());
			
			int res = biz.paymentDowndate(dto);
			
			if(res>0) {
				response.sendRedirect("./views/mypage/mypage.jsp");
			} else {
				System.out.println("실패!");
				response.sendRedirect("./views/mypage/mypage.jsp");
			}
		}
	}

}
