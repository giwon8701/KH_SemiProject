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
			
			
		} else if(command.equals("paymentRoleUp")) {
			String member_role = request.getParameter("member_role");
			
			if(member_role.equals("PREMIUM")) {
				jsResponse(response, "./views/mypage/mypage.jsp", "이미 프리미엄 회원입니다!");
			} else if(member_role.equals("USER")) {
				jsResponse(response, "./views/mypage/paymentGuide.jsp", "프리미엄 회원 등록 전 약관을 잘 읽어주세요!");
			} else {
				jsResponse(response, "./views/mypage/mypage.jsp", "관리자입니다!");
			}
			
			
			
		} else if(command.equals("paymentRoleDown")) {
			String member_role = request.getParameter("member_role");
				System.out.println(member_role);
			
			if(member_role.equals("USER")) {
				jsResponse(response, "./views/mypage/mypage.jsp", "프리미엄 회원이 아닙니다!");
			} else if(member_role.equals("PREMIUM")) {
				System.out.println(member_role);
				jsResponse(response, "./views/mypage/paymentCancel.jsp", "프리미엄 회원 탈퇴 전 약관을 잘 읽어주세요!");
			} else {
				jsResponse(response, "./views/mypage/myapge.jsp", "관리자입니다!");
			}
			
			
		} else if(command.equals("paymentUpdate")) {
			
			
			String member_email = request.getParameter("member_email");
			
			RegistDto dto = new RegistDto();
			
			dto.setMember_email(member_email);
			
			int res = biz.paymentUpdate(dto);
			
			
		} else if(command.equals("paymentDowndate")) {
			
			String member_email = request.getParameter("member_email");
			
			RegistDto dto = new RegistDto();
			System.out.println(member_email);
			dto.setMember_email(member_email);
			
			int res = biz.paymentDowndate(dto);
			
			response.sendRedirect("./views/mypage/mypage.jsp");
		}
	}
	
	private void jsResponse(HttpServletResponse response, String url, String msg) throws IOException {
		String s = "<script type='text/javascript'>"
				+ "alert('"+ msg +"');"
				+ "location.href='" + url + "';"
				+ "</script>";
		response.getWriter().print(s);
	}
}
