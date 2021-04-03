package com.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.board.biz.BoardBiz;
import com.board.biz.BoardBizImpl;
import com.board.dto.BoardDto;

@WebServlet("/review.do")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String command = request.getParameter("command");
		BoardBiz biz = new BoardBizImpl();
		
		if (command.equals("list")) {
			List<BoardDto> list = biz.photo_selectList();
			request.setAttribute("list", list);
			dispatch(request, response, "./views/board/photoReviewBoard.jsp");
		} else if (command.equals("insert")) {
			response.sendRedirect("./views/board/photoReviewBoard_post.jsp");				
		} else if (command.equals("insertRes")) {
			int postUserNo = Integer.parseInt(request.getParameter("userNo"));
			String postTitle = request.getParameter("postTitle");
			String postContent = request.getParameter("postContent");
			
			BoardDto dto = new BoardDto();
			dto.setPostUserNo(postUserNo);
			dto.setPostTitle(postTitle);
			dto.setPostContent(postContent);
			
			int res = biz.photo_insert(dto);
			if(res > 0) {
				jsResponse(response, "소중한 후기 감사합니다", "review.do?command=list");
			} else {
				jsResponse(response, "오류가 발생하였습니다", "review.do?command=insert");
			}
			
		} else if(command.equals("image")) {
			
		}
	}
	
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}
	
	private void jsResponse(HttpServletResponse response, String msg, String url) throws IOException {
		String s = "<script type='text/javascript'>"
				+ "alert('"+ msg +"');"
				+ "location.href='" + url + "';"
				+ "</script>";
		response.getWriter().print(s);
	}

}
