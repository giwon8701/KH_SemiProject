package com.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
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


import static com.mypage.common.Util.*;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/regist.do")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    RegistBiz biz = new RegistBizImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		if(command.equals("registForm")) {
			response.sendRedirect("./views/login/registSample.jsp");
			
		} else if(command.equals("idCheck")) {
			String memberId = request.getParameter("memberId");
			
			int cnt = biz.registCheck(memberId, "id");
			
			PrintWriter out = response.getWriter();
			out.println(cnt);
			
		} else if(command.equals("emailCheck")) {
			String memberEmail = request.getParameter("memberEmail");
			System.out.println("memberEmail: " + memberEmail);
			int cnt = biz.registCheck(memberEmail, "email");
			PrintWriter out = response.getWriter();
			out.println(cnt);
			
		} else if(command.equals("registres")) {
			String memberGender = request.getParameter("memberGender");
			String memberId = request.getParameter("memberId");
			String memberPw = getHash(request.getParameter("memberPw")+memberId);
			String memberName = request.getParameter("memberName");
			
			String year = request.getParameter("year");
			String mm = request.getParameter("mm");
			String dd = request.getParameter("dd");
			
			String memberBirthday = year + isTwo(mm) + isTwo(dd);
			
			String memberPhone = request.getParameter("memberPhone");
			String memberEmail = request.getParameter("memberEmail");
			String memberAddr = request.getParameter("memberAddr");
			
			RegistDto dto = new RegistDto();
			dto.setMember_id(memberId);
			dto.setMember_pw(memberPw);
			dto.setMember_name(memberName);
			dto.setMember_addr(memberAddr);
			dto.setMember_birthday(memberBirthday);
			dto.setMember_gender(memberGender);
			dto.setMember_email(memberEmail);
			dto.setMember_phone(memberPhone);
			
			int res = biz.registMember(dto);
			if(res > 0) {
				jsResponse(response, "./index.jsp", "가입에 성공하였습니다. 로그인 해주세요.");
			} else {
				jsResponse(response, "./index.jsp", "가입 실패");
			}
		} else if(command.equals("naverregistres")) {
			String memberGender = request.getParameter("memberGender");
			String memberId = request.getParameter("memberId");
			String memberPw = getHash(request.getParameter("memberPw")+memberId);
			String memberName = request.getParameter("memberName");
			
			String year = request.getParameter("year");
			String mm = request.getParameter("mm");
			String dd = request.getParameter("dd");
			
			String memberBirthday = year + isTwo(mm) + isTwo(dd);
			
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
				RegistDto Ldto = biz.selectByEmail(memberEmail);
				
				HttpSession session = request.getSession();
				session.setAttribute("Ldto", Ldto);
				session.setMaxInactiveInterval(10 * 60);
				
				jsResponse(response, "./index.jsp", memberName + "님, 환영합니다.");
			} else {
				jsResponse(response, "./index.jsp", "가입 실패");
			}
		} else if(command.equals("login")) {
			response.sendRedirect("./views/login/login.jsp");
		} else if(command.equals("loginres")){
			String memberId = request.getParameter("loginMemberId");
			String memberPw = getHash(request.getParameter("loginMemberPw")+memberId);
			
			RegistDto logindto = new RegistDto();
			logindto.setMember_id(memberId);
			logindto.setMember_pw(memberPw);
			
			int res = biz.login(logindto);
			if(res > 0){
				
				RegistDto Ldto = biz.selectOne(logindto);
				
				if(Ldto.getMember_enabled().equals("N")) {
					jsResponse(response, "./views/login/login.jsp", "탈퇴한 회원입니다.");
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("Ldto", Ldto);
					session.setMaxInactiveInterval(10 * 60);
					
					if(Ldto.getMember_role().equals("ADMIN")) {
						//관리자 메인페이지
						response.sendRedirect("./index.jsp");
					} else if(Ldto.getMember_role().equals("USER")) {
						//일반회원 메인페이지
						response.sendRedirect("./index.jsp");
					} else {
						//프리미엄 회원 메인페이지
						response.sendRedirect("./index.jsp");
					}
				}
				
			} else {
				jsResponse(response, "regist.do?command=login", "아이디와 비밀번호를 확인해주세요.");
			}
		} else if(command.equals("logout")){
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("./index.jsp");
		} else if(command.equals("idSearch")) {
			response.sendRedirect("./views/login/idSearchForm.jsp");
		} else if(command.equals("idSearchRes")) {
			String member_name = request.getParameter("member_name");
			String member_email = request.getParameter("member_email");
			
			RegistDto dto = new RegistDto();
			dto.setMember_name(member_name);
			dto.setMember_email(member_email);
			
			System.out.println(dto.getMember_name());
			System.out.println(dto.getMember_email());
			
			RegistDto Ldto = biz.idSearch(dto);
			if(Ldto != null) {
				request.setAttribute("dto", Ldto);
				dispatch(request, response, "./views/login/idSearchRes.jsp");
			} else {
				jsResponse(response, "regist.do?command=idSearch", "아이디와 이메일을 다시 확인해주세요.");
			}
		} else if(command.equals("pwSearch")) {
			response.sendRedirect("./views/login/pwSearchForm.jsp");
		} else if(command.equals("pwSearchRes")) {
			String member_name = URLDecoder.decode(request.getParameter("member_name"), "UTF-8");
			String member_id = URLDecoder.decode(request.getParameter("member_id"), "UTF-8");
			String member_email = URLDecoder.decode(request.getParameter("member_email"), "UTF-8");
			
			RegistDto dto = new RegistDto();
			dto.setMember_name(member_name);
			dto.setMember_id(member_id);
			dto.setMember_email(member_email);
			
			int cnt = biz.pwSearch(dto);
			
			PrintWriter out = response.getWriter();
			out.println(cnt);
		} else if(command.equals("pwReset")) {
			String member_id = request.getParameter("member_id");
			String member_email = request.getParameter("member_email");
			String member_pw = getHash(request.getParameter("member_pw")+member_id);
			
			RegistDto dto = new RegistDto();
			dto.setMember_id(member_id);
			dto.setMember_email(member_email);
			dto.setMember_pw(member_pw);
			
			int res = biz.pwReset(dto);
			if(res > 0) {
				jsResponse(response, "./views/login/login.jsp", "비밀번호를 재설정하였습니다. 로그인해주세요.");
			} else {
				jsResponse(response, "./views/login/pwSearchForm.jsp", "비밀번호 재설정에 실패하였습니다.");
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
