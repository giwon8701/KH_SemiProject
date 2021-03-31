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
				List<BoardDto> list = biz.selectList();
				request.setAttribute("list", list);
				dispatch(request, response, "accompanyBoard.jsp");
			}else if(command.equals("insert")) {
				response.sendRedirect("./views/board/accompanyBoard_post.jsp");
			} 
			
			
		} catch(Exception e){
			System.out.println("오류입니다.");
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
