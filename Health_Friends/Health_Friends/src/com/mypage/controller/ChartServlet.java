package com.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mypage.biz.ChartBiz;
import com.mypage.biz.ChartBizImpl;

import net.sf.json.JSONObject;

@WebServlet("/chart.do")
public class ChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String command = request.getParameter("command");
		
		
		if(command.equals("todayHealth")) {
			String individual_id = request.getParameter("individual_id");
			String yyyyMMdd = request.getParameter("yyyyMMdd");
			
			System.out.printf("id : %s / yyyyMMdd : %s \n", individual_id, yyyyMMdd);
			
			ChartBiz Cbiz = new ChartBizImpl();
			int res = Cbiz.todayChart(individual_id, yyyyMMdd);
			
			System.out.println("res : " + res);
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("res", res);
			
			// map -> json
			JSONObject obj = JSONObject.fromObject(map);
			
			// response
			PrintWriter out = response.getWriter();
			obj.write(out);
		}

	
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
