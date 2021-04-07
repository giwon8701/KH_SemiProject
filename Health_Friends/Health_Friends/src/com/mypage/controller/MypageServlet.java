package com.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.biz.RegistBiz;
import com.login.biz.RegistBizImpl;
import com.login.dto.RegistDto;
import static com.mypage.common.Util.*;
@WebServlet("/mypage.do")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		RegistBiz biz = new RegistBizImpl();
		
		// 나중에 까먹지 말고 삭제할것
		System.out.println("mypage.do : {" + command + "}");
		
		
		if(command.equals("mypage")){
			dispatch(request, response, "./views/mypage/mypage.jsp");
			
		} else if(command.equals("yearMinus")) {
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			
			dispatch(request, response, "./views/mypage/mypage.jsp?year="+year+"&month="+month);
			
		} else if(command.equals("monthMinus")) {
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			
			dispatch(request, response, "./views/mypage/mypage.jsp?year="+year+"&month="+month);
			
		} else if(command.equals("monthPlus")) {
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			
			dispatch(request, response, "./views/mypage/mypage.jsp?year="+year+"&month="+month);
			
		} else if(command.equals("yearPlus")) {
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			
			dispatch(request, response, "./views/mypage/mypage.jsp?year="+year+"&month="+month);
			
		} else if(command.equals("registUpdate")) {
			response.sendRedirect("./views/mypage/registUpdate.jsp");
		} else if(command.equals("pwReset")) {
			String member_id = request.getParameter("member_id");
			
			request.setAttribute("member_id", member_id);
			dispatch(request, response, "./views/mypage/pwReset.jsp");
			
		} else if(command.equals("pwResetRes")) {
			String member_id = request.getParameter("member_id");
			String member_pw = getHash(request.getParameter("member_pw")+member_id);
			
			RegistDto dto = new RegistDto();
			dto.setMember_id(member_id);
			dto.setMember_pw(member_pw);
			
			int res = biz.updateRegist(dto);
			
			if(res > 0) {
				RegistDto Ldto = biz.selectById(member_id);
				
				HttpSession session = request.getSession();
				session.setAttribute("Ldto", Ldto);
				session.setMaxInactiveInterval(10 * 60);
			}
			
			PrintWriter out = response.getWriter();
			out.println(res);
			
		} else if(command.equals("registUpdateRes")) {
			String member_id = request.getParameter("member_id");
			String member_phone = request.getParameter("member_phone");
			String member_addr = request.getParameter("member_addr");
			
			RegistDto dto = new RegistDto();
			dto.setMember_id(member_id);
			dto.setMember_phone(member_phone);
			dto.setMember_addr(member_addr);
			
			
			int res = biz.updateRegist(dto);
			
			if(res > 0) {
				RegistDto Ldto = biz.selectById(member_id);
				System.out.println("LDTO:" + Ldto.getMember_id());
				
				HttpSession session = request.getSession();
				session.setAttribute("Ldto", Ldto);
				session.setMaxInactiveInterval(10 * 60);
				
				response.getWriter().print("<script>alert('회원정보가 수정되었습니다.')</script>");
				dispatch(request, response, "./views/mypage/mypage.jsp");
				//jsResponse(response, "./views/mypage/mypage.jsp", "회원정보가 수정되었습니다.");
			} else {
				
				jsResponse(response, "./myapge.do?command=mypage", "다시 시도해주세요.");
			}
		} else if(command.equals("delRegist")) {
			String member_id = request.getParameter("member_id");
			
			int res = biz.deleteRegist(member_id);
			
			PrintWriter out = response.getWriter();
			out.println(res);
			
		} else if(command.equals("paymentRoleUpPage")) {
			dispatch(request, response, "./views/mypage/paymentGuide.jsp");
		} else if(command.equals("paymentRoleDownPage")) {
			dispatch(request, response, "./views/mypage/paymentCancel.jsp");
		} else if(command.equals("paymentGuide")) {
			dispatch(request, response, "./views/mypage/paymentGuide.jsp");
		}
	}
	
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}
	
	private void jsResponse(HttpServletResponse response, String url, String msg) throws IOException {
		String s = "<script type='text/javascript'>"
				+ "alert('"+ msg +"');"
				+ "location.href='" + url + "';"
				+ "</script>";
		response.getWriter().print(s);
	}

}
