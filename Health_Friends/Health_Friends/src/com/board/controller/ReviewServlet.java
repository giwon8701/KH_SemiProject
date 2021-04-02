package com.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.biz.BoardBiz;
import com.board.biz.BoardBizImpl;
import com.board.dto.BoardDto;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/review.do")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String command = request.getParameter("command");
		BoardBiz biz = new BoardBizImpl();
		
		if(command.equals("list")) {
			List<BoardDto> list = biz.photo_selectList();
			request.setAttribute("list", list);
			dispatch(request, response, "./views/board/photoReviewBoard.jsp");
		} else if(command.equals("insertReview")) {
				
				
		} else if(command.equals("multiimg")) {
			//로컬 경로에 파일저장
			String sFileInfo = "";
			
			//파일명
			String name = request.getHeader("file-name");
			
			//확장자
			String ext = name.substring(name.lastIndexOf(".")+1);
			
			//파일 기본경로
			String defaultPath = request.getServletContext().getRealPath("/");
			
			//파일 기본경로_상세경로
			String path = defaultPath + "upload" + File.separator;
			
			File file = new File(path);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			String realname = UUID.randomUUID().toString() + "." + ext;
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(path + realname);
			int numRead;
			
			//파일쓰기
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while((numRead = is.read(b,0,b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			
			if(is != null) {
				is.close();
			}
			
			os.flush();
			os.close();
			
			System.out.println("path : " + path);
			System.out.println("realname : " + realname);
			
			sFileInfo += "&NewLine=true&sFileName=" + name + "&sFileURL=" + "/upload" + realname;
			response.getWriter().append(sFileInfo);		
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}

}
