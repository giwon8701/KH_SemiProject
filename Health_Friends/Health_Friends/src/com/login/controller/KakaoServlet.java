package com.login.controller;

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

/**
 * Servlet implementation class KakaoServlet
 */
@WebServlet("/kakao.do")
public class KakaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		RegistBiz biz = new RegistBizImpl();
		
		if(command.equals("registChk")) {
			String member_email = request.getParameter("email");
			
			int cnt = biz.registCheck(member_email);
			
			PrintWriter out = response.getWriter();
			out.println(cnt);
			
		} else if(command.equals("kakaoRegist")) {
			String member_id = request.getParameter("email").split("@")[0];
			String member_email = request.getParameter("email");
			String member_birthday = request.getParameter("birthday");
			member_birthday = (member_birthday).equals("undefined")?"0101":member_birthday;
			
			String member_gender = request.getParameter("gender");
			member_gender = (member_gender).equals("female")?"F":(member_gender).equals("male")?"M":"U";
			
			RegistDto dto = new RegistDto();
			dto.setMember_id(member_id);
			dto.setMember_email(member_email);
			dto.setMember_birthday(member_birthday);
			dto.setMember_gender(member_gender);
			
			System.out.println(member_id);
			System.out.println(member_email);
			System.out.println(member_birthday);
			System.out.println(member_gender);
			
			request.setAttribute("dto", dto);
			RequestDispatcher dispatch = request.getRequestDispatcher("/views/login/naverRegistForm.jsp");
			dispatch.forward(request, response);
		} else if(command.equals("kakaoLogin")) {
			String member_email = request.getParameter("email");
			
			RegistDto dto = biz.selectByEmail(member_email);
			
			if(dto.getMember_enabled().equals("N")) {
				response.getWriter().print("<script type='text/javascript'>alert('탈퇴한 회원입니다.');location.href='./index.jsp'</script>");
				
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("dto", dto);
				session.setMaxInactiveInterval(10*60);
				
				response.getWriter().print("<script type='text/javascript'>alert('"+dto.getMember_name()+"님, 환영합니다.');location.href='./index.jsp'</script>");
			}
			
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
