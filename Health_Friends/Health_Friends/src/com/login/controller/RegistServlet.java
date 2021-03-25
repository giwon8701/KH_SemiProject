package com.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
import com.mypage.common.Util;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/regist.do")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    RegistBiz biz = new RegistBizImpl();
    Util util = new Util();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		if(command.equals("registForm")) {
			response.sendRedirect("./views/login/registForm.jsp");
			
		} else if(command.equals("idCheck")) {
			String memberId = request.getParameter("memberId");
			
			int cnt = biz.registCheck(memberId);
			
			PrintWriter out = response.getWriter();
			out.println(cnt);
			
		} else if(command.equals("phoneCheck")) {
			String memberPhone = request.getParameter("memberPhone");

			int cnt = biz.registCheck(memberPhone);
			
			PrintWriter out = response.getWriter();
			out.println(cnt);
			
		} else if(command.equals("registres")) {
			String memberGender = request.getParameter("memberGender");
			String memberId = request.getParameter("memberId");
			String memberPw = util.getHash(request.getParameter("memberPw"));
			String memberName = request.getParameter("memberName");
			String memberBirthday = request.getParameter("memberBirthday");
			String memberPhone = request.getParameter("memberPhone");
			String memberEmail = request.getParameter("memberEmail");
			String memberAddr = request.getParameter("memberAddr");
			
			RegistDto dto = new RegistDto();
			dto.setMember_birthday(memberBirthday);
			dto.setMember_email(memberEmail);
			dto.setMember_gender(memberGender);
			dto.setMember_id(memberId);
			dto.setMember_pw(memberPw);
			dto.setMember_name(memberName);
			dto.setMember_addr(memberAddr);
			dto.setMember_phone(memberPhone);
			
			int res = biz.registMember(dto);
			if(res > 0) {
				jsResponse(response, "./index.jsp", "가입에 성공하였습니다. 로그인 해주세요.");
			} else {
				jsResponse(response, "./index.jsp", "가입 실패");
			}
		} else if(command.equals("login")) {
			response.sendRedirect("./views/login/login.jsp");
		} else if(command.equals("loginres")){
			String memberId = request.getParameter("memberId");
			String memberPw = util.getHash(request.getParameter("memberPw"));
			
			RegistDto logindto = new RegistDto();
			logindto.setMember_id(memberId);
			logindto.setMember_pw(memberPw);
			
			int res = biz.login(logindto);
			
			if(res > 0){
				
				RegistDto Ldto = biz.selectOne(logindto);
				
				System.out.println(Ldto.getMember_id());
				System.out.println(Ldto.getMember_pw());
				
				HttpSession session = request.getSession();
				session.setAttribute("dto", Ldto);
				session.setMaxInactiveInterval(10 * 60);
				
				if(Ldto.getMember_role().equals("ADMIN")) {
					//관리자 메인페이지
				} else if(Ldto.getMember_role().equals("USER")) {
					//일반회원 메인페이지
				} else {
					//프리미엄 회원 메인페이지
				}
				response.sendRedirect("./index.jsp");
			} else {
				jsResponse(response, "regist.do?command=login", "아이디와 비밀번호를 확인해주세요.");
			}
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
