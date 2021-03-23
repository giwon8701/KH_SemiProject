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

import com.board.biz.RegistBiz;
import com.board.biz.RegistBizImpl;
import com.board.common.Util;
import com.board.dto.RegistDto;

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
			response.sendRedirect("registForm.jsp");
			
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
				jsResponse(response, "index.jsp", "가입에 성공하였습니다. 로그인 해주세요.");
			} else {
				jsResponse(response, "index.jsp", "가입 실패");
			}
		} else if(command.equals("login")) {
			response.sendRedirect("login.jsp");
		} else if(command.equals("loginres")){
			String memberId = request.getParameter("memberId");
			String memberPw = util.getHash(request.getParameter("memberPw"));
			
			RegistDto logindto = new RegistDto();
			logindto.setMember_id(memberId);
			logindto.setMember_pw(memberPw);
			
			List<RegistDto> list = biz.login(logindto);
			
			if(list != null){
				
				RegistDto dto = list.get(0);
				
				System.out.println(dto.getMember_id());
				System.out.println(dto.getMember_pw());
				
				HttpSession session = request.getSession();
				session.setAttribute("dto", dto);
				session.setMaxInactiveInterval(10 * 60);
				
				
				response.sendRedirect("index.jsp");
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
