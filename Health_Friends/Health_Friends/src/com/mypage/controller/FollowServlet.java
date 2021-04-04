package com.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dto.RegistDto;
import com.mypage.biz.FollowBiz;
import com.mypage.biz.FollowBizImpl;
import com.mypage.dto.FollowDto;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class FollowServlet
 */
@WebServlet("/follow.do")
public class FollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		FollowBiz biz = new FollowBizImpl();
		
		if(command.equals("following")) {
			
			HttpSession session = request.getSession();
			RegistDto Ldto = (RegistDto)session.getAttribute("Ldto");
			int following_no = Ldto.getMember_no();
			
			List<FollowDto> list = biz.searchFollwing(following_no);
			
			request.setAttribute("list", list);
			dispatch(request, response, "./views/mypage/follower.jsp");
			
		} else if(command.equals("follower")) {
			
			HttpSession session = request.getSession();
			RegistDto Ldto = (RegistDto)session.getAttribute("Ldto");
			int follow_member_no = Ldto.getMember_no();
			
			List<FollowDto> list = biz.searchFollowed(follow_member_no);
			
			request.setAttribute("list", list);
			dispatch(request, response, "./views/mypage/follower.jsp");
			
		} else if(command.equals("followingtest")) {
			HttpSession session = request.getSession();
			RegistDto Ldto = (RegistDto)session.getAttribute("Ldto");
			int following_no = Ldto.getMember_no();
			
			List<FollowDto> list = biz.searchFollwing(following_no);
			
			JSONArray result = JSONArray.fromObject(list);
			response.getWriter().print(result.toString());
			
		} else if(command.equals("followertest")) {
			
			HttpSession session = request.getSession();
			RegistDto Ldto = (RegistDto)session.getAttribute("Ldto");
			int follow_member_no = Ldto.getMember_no();
			
			List<FollowDto> list = biz.searchFollowed(follow_member_no);
			
			request.setAttribute("list", list);
			dispatch(request, response, "./views/mypage/follower.jsp");
			
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
