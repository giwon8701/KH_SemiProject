package com.hf.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hf.biz.CalBiz;
import com.hf.biz.CalBizImpl;
import com.hf.common.Util;
import com.hf.dao.CalDao;
import com.hf.dto.CalDto;

@WebServlet("/cal.do")
public class CalController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.printf("<%s>\n", command);
		
		CalBiz biz = new CalBizImpl();
		
		try {
			if(command.equals("calendar")) {
				response.sendRedirect("myPage.jsp");
			} else if(command.equals("insert")) {
				String year = request.getParameter("year");
				String month = request.getParameter("month");
				String date = request.getParameter("date");
				String hour = request.getParameter("hour");
				String min = request.getParameter("min");
				String mdate = year + Util.isTwo(month) + Util.isTwo(date) + Util.isTwo(hour) + Util.isTwo(min);
				
				String id = request.getParameter("id");
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				
				CalDto dto = new CalDto(0, id, title, content, mdate, null);
				
				int res = biz.insertCalBoard(dto);
				if(res > 0) {
					response.sendRedirect("myPage.jsp");
				} else {
					request.setAttribute("msg", "일정 추가 실패");
					dispatch("error.jsp", request, response);
				}
				
			} else if(command.equals("list")) {
				
				String year = request.getParameter("year");
				String month = request.getParameter("month");
				String date = request.getParameter("date");
				
				String yyyyMMdd = year + Util.isTwo(month) + Util.isTwo(date);
				
				List<CalDto> list = biz.getCalList("kh", yyyyMMdd);
				
				request.setAttribute("list", list);
				dispatch("list.jsp", request, response);
				
			} else if(command.equals("selectOne")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				
				CalDto dto = biz.selectOneCalBoard(seq);
				
				request.setAttribute("dto", dto);
				dispatch("select.jsp", request, response);
				
			} else if(command.equals("delete")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				int res = biz.deleteCalBoard(seq);
				
				if(res > 0){
					dispatch("cal.do?command=calendar", request, response);
				} else {
					dispatch("cal.do?command=selectOne&seq="+seq, request, response);
				} 
				
			} else if(command.equals("update")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				
				CalDto dto = biz.selectOneCalBoard(seq);
				
				request.setAttribute("dto", dto);
				
				dispatch("update.jsp", request, response);
				
			} else if(command.equals("updateres")){
				int seq = Integer.parseInt(request.getParameter("seq"));
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				
				CalDto dto = new CalDto();
				dto.setSeq(seq);
				dto.setTitle(title);
				dto.setContent(content);
				int res = biz.updateCalBoard(dto);
				
				if(res > 0){
					
					dispatch("cal.do?command=selectOne&seq="+seq, request, response);
					
				} else {
					
					dispatch("cal.do?command=selectOne&seq="+seq, request, response);
					
				} 
			}
		} catch (Exception e) {
			request.setAttribute("msg", "command 오류");
			dispatch("error.jsp", request, response);
		} 
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void dispatch(String path, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}

}
