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

import com.board.biz.BoardBiz;
import com.board.biz.BoardBizImpl;
import com.board.dto.BoardDto;

@WebServlet("/notice.do")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=UTF-8");
		
		String command = request.getParameter("command");
		BoardBiz biz = new BoardBizImpl();
		
		try {
			if(command.equals("list")) {
				List<BoardDto> list = biz.notice_selectList();
				request.setAttribute("list", list);
				dispatch(request, response, "./views/board/noticeBoard.jsp");
				
			} else if(command.equals("insert")) {
				response.sendRedirect("./views/board/noticeBoard_post.jsp");
				
			} else if(command.equals("insertres")) {
				String postTitle = request.getParameter("postTitle");
				String postContent = request.getParameter("postContent");
				
				BoardDto dto = new BoardDto();
				dto.setPostTitle(postTitle);
				dto.setPostContent(postContent);
				int res = biz.notice_insert(dto);
				
				if(res > 0) {
					response.sendRedirect("notice.do?command=list");
				} else {
					response.sendRedirect("./views/board/noticeBoard_post.jsp");
				}
				
			} else if(command.equals("select")) {
				int postId = Integer.parseInt(request.getParameter("postId"));
				BoardDto dto = biz.notice_selectOne(postId);
				request.setAttribute("dto", dto);
				dispatch(request, response, "./views/board/noticeBoard_select.jsp");
			
			} else if(command.equals("updateform")) {
				int postId = Integer.parseInt(request.getParameter("postId"));
				BoardDto dto = biz.notice_selectOne(postId);
				request.setAttribute("dto", dto);
				dispatch(request, response, "./views/board/noticeBoard_update.jsp");
				
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
				
				int res = biz.notice_update(dto);
				if (res > 0) {
					response.sendRedirect("notice.do?command=list&postId=" + postId);
				} else {
					response.sendRedirect("notice.do?command=select&postId=" + postId);
				}
				
			} else if(command.equals("delete")) {
				int postId = Integer.parseInt(request.getParameter("postId"));
				int res = biz.notice_delete(postId);
				if (res > 0) {
					response.sendRedirect("notice.do?command=list");
				} else {
					response.sendRedirect("notice.do?command=select&postId=" + postId);
				}
			}
			
		} catch(Exception e){
			e.printStackTrace();
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

















