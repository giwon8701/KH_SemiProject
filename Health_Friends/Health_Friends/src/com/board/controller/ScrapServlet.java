package com.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.biz.ScrapBiz;
import com.board.biz.ScrapBizImpl;
import com.board.dto.BoardDto;
import com.board.dto.ScrapDto;
import com.common.Paging;
import com.login.biz.RegistBiz;
import com.login.dto.RegistDto;
import com.mypage.dto.FollowDto;

/**
 * Servlet implementation class ScrapServlet
 */
@WebServlet("/scrap.do")
public class ScrapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		ScrapBiz biz = new ScrapBizImpl(); 
		
		if(command.equals("addScrap")) {
			HttpSession session = request.getSession();
			int scrap_user_no = ((RegistDto)session.getAttribute("Ldto")).getMember_no();
			int scrap_post_id = Integer.parseInt(request.getParameter("post_id"));
			
			ScrapDto dto = new ScrapDto();
			dto.setScrap_user_no(scrap_user_no);
			dto.setScrap_post_id(scrap_post_id);
			
			int res = biz.addScrap(dto);
			
			response.getWriter().print(res);
		} else if(command.equals("delScrap")) {
			HttpSession session = request.getSession();
			int scrap_user_no = ((RegistDto)session.getAttribute("Ldto")).getMember_no();
			
			int res = biz.delScrap(scrap_user_no);
			
			response.getWriter().print(res);
		} else if(command.equals("scrapList")) {
			HttpSession session = request.getSession();
			int scrap_user_no = ((RegistDto)session.getAttribute("Ldto")).getMember_no();
			System.out.println("scrap_user_no" + scrap_user_no);
			
			List<BoardDto> list = new ArrayList<BoardDto>();
			
			list = biz.listScrap(scrap_user_no);
			System.out.println("list : " + list.toString());
			
			request.setAttribute("list", list);
			dispatch(request, response, "/views/mypage/scrapList.jsp");
			
		} else if(command.equals("scrapchk")) {
			int scrap_user_no = Integer.parseInt(request.getParameter("user_no"));
			int scrap_post_id = Integer.parseInt(request.getParameter("post_id"));
			
			ScrapDto dto = new ScrapDto();
			dto.setScrap_user_no(scrap_user_no);
			dto.setScrap_post_id(scrap_post_id);
			int res = biz.scrapChk(dto);
			
			response.getWriter().print(res);
		}
	}
	
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}

}
