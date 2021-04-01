package com.board.controller;

import java.io.IOException;
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

@WebServlet("/board.do")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=UTF-8");
		
		String command = request.getParameter("command");
		BoardBiz biz = new BoardBizImpl();
		
		try {
			if(command.equals("list")) {
				List<BoardDto> list = biz.accompany_selectList();
				request.setAttribute("list", list);
				dispatch(request, response, "./views/board/accompanyBoard.jsp");
				
			}else if(command.equals("insert")) {
				response.sendRedirect("./views/board/accompanyBoard_post.jsp");
				
			}else if(command.equals("insertres")) {
				String postId = request.getParameter("postId");
				String postCategoryName = request.getParameter("chooseExercise");
				String postTitle = request.getParameter("postTitle");
				String postContent = request.getParameter("content");
				String postMdate = request.getParameter("postMdate");
				String postRegdate = null;
				String postLatitude = request.getParameter("MapAddress");
			//	 ��¥�� ���޾��� ���� ����
			//	BoardDto dto = new BoardDto(0, postId, 0, null, postCategoryName, postTitle, postContent, postMdate, postRegdate, 
			//			null, 0, 0, 0, postLatitude, 0);
				
			//	if (res > 0) {
			//		response.sendRedirect("board.do?command=list");
			//	} else {
			//		response.sendRedirect("board.do?command=insert");
			//	} 
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
