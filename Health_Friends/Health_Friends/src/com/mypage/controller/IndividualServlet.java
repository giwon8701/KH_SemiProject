package com.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mypage.biz.IndividualBiz;
import com.mypage.biz.IndividualBizImpl;
import com.mypage.common.Util;
import com.mypage.dto.IndividualDto;

import net.sf.json.JSONObject;

@WebServlet("/individual.do")
public class IndividualServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.printf("<%s>\n", command);
		
		IndividualBiz biz = new IndividualBizImpl();
		
		
		try {
			if(command.equals("individualList")) {
				String year = request.getParameter("year");
				String month = request.getParameter("month");
				String date = request.getParameter("date");
				//String id = "";
				String yyyyMMdd = year + Util.isTwo(month) + Util.isTwo(date);
				
				List<IndividualDto> list = biz.individualList("cine", yyyyMMdd);
				
				request.setAttribute("list", list);
				
				dispatch("./views/mypage/individualList.jsp", request, response);
				
			} else if(command.equals("individualSelectOne")) {
				int individual_no = Integer.parseInt(request.getParameter("individual_no"));
				
				IndividualDto dto = biz.individualSelectOne(individual_no);
				
				request.setAttribute("dto", dto);
				dispatch("./views/mypage/individualSelectOne.jsp", request, response);
				
			} else if(command.equals("individualInsert")) {
				
				String year = request.getParameter("year");
				String month = request.getParameter("month");
				String date = request.getParameter("date");
				String lastDay = request.getParameter("lastDay");
				String hour = request.getParameter("hour");
				String min = request.getParameter("min");
				
				String individual_mdate = year + Util.isTwo(month) + Util.isTwo(date) + Util.isTwo(hour) + Util.isTwo(min);
				String individual_id = request.getParameter("individual_id");
				String individual_title = request.getParameter("individual_title");
				String individual_content = request.getParameter("individual_content");
				
				IndividualDto dto = new IndividualDto();
				dto.setIndividual_id(individual_id);
				dto.setIndividual_title(individual_title);
				dto.setIndividual_content(individual_content);
				dto.setIndividual_mdate(individual_mdate);
				
				
				int res = biz.individualInsert(dto);
				if(res > 0) {
					response.sendRedirect("./views/mypage/mypage.jsp");
				} else {
					request.setAttribute("msg", "일정 추가 실패");
					dispatch("error.jsp", request, response);
				}
			}  else if(command.equals("individualUpdate")) {
				int individual_no = Integer.parseInt(request.getParameter("individual_no"));
				
				IndividualDto dto = biz.individualSelectOne(individual_no);
				
				request.setAttribute("dto", dto);
				
				dispatch("./views/mypage/individualUpdate.jsp", request, response);
				
			} else if(command.equals("individualUpdateres")){
				int individual_no = Integer.parseInt(request.getParameter("individual_no"));
				String individual_title = request.getParameter("individual_title");
				String individual_content = request.getParameter("individual_content");
				
				IndividualDto dto = new IndividualDto();
				dto.setIndividual_no(individual_no);
				dto.setIndividual_title(individual_title);
				dto.setIndividual_content(individual_content);
				int res = biz.individualUpdate(dto);
				
				
				if(res > 0){
					
					dispatch("individual.do?command=individualSelectOne&individual_no="+individual_no, request, response);
					
				} else {
					
					dispatch("individual.do?command=individualSelectOne&individual_no="+individual_no, request, response);
					
				} 
			} else if(command.equals("individualDelete")) {
				int individual_no = Integer.parseInt(request.getParameter("individual_no"));
				int res = biz.individualDelete(individual_no);
				
				if(res > 0){
					response.sendRedirect("./views/mypage/mypage.jsp");
				} else {
					dispatch("individual.do?command=individualSelectOne&individual_no="+individual_no, request, response);
				} 
				
			} else if(command.equals("individualMultiDelete")) {
				String year = request.getParameter("year");
				String month = request.getParameter("month");
				String date = request.getParameter("date");
				
				String[] individual_nos = request.getParameterValues("chk");
				
				if(individual_nos == null || individual_nos.length ==0) {
					response.sendRedirect("individual.do?command=individualList&year="+year+"&month="+month+"&date="+date);
				} else {
					int res = biz.individualMultiDelete(individual_nos);
					if(res > 0) {
						response.sendRedirect("individual.do?command=individualList&year="+year+"&month="+month+"&date="+date);
					} else {
						response.sendRedirect("individual.do?command=individualList&year="+year+"&month="+month+"&date="+date);
					}
				}
				
			} else if(command.equals("individualCount")) {
				String individual_id = request.getParameter("individual_id");
				String yyyyMMdd = request.getParameter("yyyyMMdd");
				System.out.printf("individual_id : %s / yyyyMMdd : %s \n", individual_id, yyyyMMdd);
				
				int count = biz.individualCount(individual_id, yyyyMMdd);
				System.out.println("count : " + count);
				
				Map<String, Integer> map = new HashMap<String, Integer>();
				map.put("count", count);
				
				JSONObject obj = JSONObject.fromObject(map);
				
				PrintWriter out = response.getWriter();
				obj.write(out);
				
				
			}
		} catch (Exception e) {
			request.setAttribute("msg", "command 오류");
			dispatch("./views/common/error.jsp", request, response);
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
