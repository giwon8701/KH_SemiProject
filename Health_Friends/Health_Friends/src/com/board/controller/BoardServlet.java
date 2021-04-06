package com.board.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.biz.BoardBiz;
import com.board.biz.BoardBizImpl;
import com.board.dto.BoardDto;
import com.login.dto.RegistDto;

@WebServlet("/board.do")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=UTF-8");
		
		String command = request.getParameter("command");
		BoardBiz biz = new BoardBizImpl();
		HttpSession session = request.getSession();
		RegistDto ldto = (RegistDto)session.getAttribute("Ldto");
		
		try {
			if(command.equals("list")) {
				List<BoardDto> list = biz.accompany_selectList();
				request.setAttribute("list", list);
				dispatch(request, response, "./views/board/accompanyBoard.jsp");
				
			} else if(command.equals("insert")) {
				dispatch(request, response, "./views/board/accompanyBoard_post.jsp");
				
			} else if(command.equals("insertres")) {
				String postLatitude = request.getParameter("result");
				System.out.println(postLatitude);
				String postTitle = request.getParameter("postTitle");
				System.out.println(postTitle);
				String postCategoryName = request.getParameter("postCategoryName");
				System.out.println(postCategoryName);
				String postContent = request.getParameter("postContent");
				System.out.println(postContent);
				int postUserNo = ldto.getMember_no();
				String postMdate = request.getParameter("postMdate");
				System.out.println(postMdate);
				BoardDto dto = new BoardDto();
				dto.setPostUserNo(postUserNo);
				dto.setPostLatitude(postLatitude);
				dto.setPostCategoryName(postCategoryName);
				dto.setPostTitle(postTitle);
				dto.setPostContent(postContent);
				dto.setPostMdate(postMdate);
				int res = biz.accompany_insert(dto);
				
				if(res > 0) {
					response.sendRedirect("board.do?command=list");
				} else {
					response.sendRedirect("board.do?command=insert");
				}
				
			} else if(command.equals("select")) {
				int postId = Integer.parseInt(request.getParameter("postId"));
				BoardDto dto = biz.accompany_selectOne(postId);
				request.setAttribute("dto", dto);
				dispatch(request, response, "./views/board/accompanyBoard_select.jsp");
				
			} else if(command.equals("updateform")) {	
				int postId = Integer.parseInt(request.getParameter("postId"));
				BoardDto dto = biz.accompany_selectOne(postId);
				request.setAttribute("dto", dto);
				dispatch(request, response, "./views/board/accompanyBaord_update.jsp");
			
			} else if(command.equals("updateres")) {	
				int postId = Integer.parseInt(request.getParameter("postId"));
				int postUserNo = Integer.parseInt(request.getParameter("postUserNo"));
				String postTitle = request.getParameter("postTitle");
				String postContent = request.getParameter("postContent");
				BoardDto dto = new BoardDto();
				dto.setPostId(postId);
				dto.setPostTitle(postTitle);
				dto.setPostContent(postContent);
				dto.setPostUserNo(postUserNo);
				
				int res = biz.accompany_update(dto);
				if (res > 0) {
					response.sendRedirect("board.do?command=list");
				} else {
					response.sendRedirect("./views/board/" );
				}
				
			} else if(command.equals("delete")) {
				int postId = Integer.parseInt(request.getParameter("postId"));
				int res = biz.accompany_delete(postId);
				if (res > 0) {
					response.sendRedirect("board.do?command=list");
				} else {
					response.sendRedirect("board.do?command=select&postId=" + postId);
				}
			}
			
		} catch(Exception e){
			response.sendRedirect("./views/common/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}
}