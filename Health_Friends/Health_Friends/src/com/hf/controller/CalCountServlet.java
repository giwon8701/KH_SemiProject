package com.hf.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hf.biz.CalBiz;
import com.hf.biz.CalBizImpl;

import net.sf.json.JSONObject;

@WebServlet("/count.do")
public class CalCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String yyyyMMdd = request.getParameter("yyyyMMdd");
		System.out.printf("id : %s / yyyyMMdd : %s \n", id, yyyyMMdd);
		
		CalBiz biz = new CalBizImpl();
		int count = biz.getCalViewCount(id, yyyyMMdd);
		System.out.println("count : " + count);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("calcount", count);
		
		// map -> json
		JSONObject obj = JSONObject.fromObject(map);
		
		// response
		PrintWriter out = response.getWriter();
		obj.write(out);
	}

}
