package com.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
		
		if(command.equals("healthRecord")) {
			String individual_id = request.getParameter("individual_id");
			
			ChartBiz Cbiz = new ChartBizImpl();
			int todayHealth = Cbiz.todayChart(individual_id, todayDate());
			int yesterdayHealth = Cbiz.todayChart(individual_id, YesterdayDate());
			int twoAgodayHealth = Cbiz.todayChart(individual_id, twoAgodayDate());
			int threeAogdayHealth = Cbiz.todayChart(individual_id, threeAgodayDate());
			int fourAgodayHealth = Cbiz.todayChart(individual_id, fourAgodayDate());
			int fiveAgodayHealth = Cbiz.todayChart(individual_id, fiveAgodayDate());
			int sixAgodayHealth = Cbiz.todayChart(individual_id, sixAgodayDate());
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("todayHealth", todayHealth);
			map.put("yesterdayHealth", yesterdayHealth);
			map.put("twoAgodayHealth", twoAgodayHealth);
			map.put("threeAogdayHealth", threeAogdayHealth);
			map.put("fourAgodayHealth", fourAgodayHealth);
			map.put("fiveAgodayHealth", fiveAgodayHealth);
			map.put("sixAgodayHealth", sixAgodayHealth);
			
			// map -> json
			JSONObject obj = JSONObject.fromObject(map);
			
			// response
			PrintWriter out = response.getWriter();
			obj.write(out);
		}
	}
	
	  public String todayDate() {
	        SimpleDateFormat Format = new SimpleDateFormat("yyyyMMdd");
	        Calendar cal = Calendar.getInstance();
	 
	        cal.add(Calendar.DATE, 0);
	        String timedate = Format.format(cal.getTime());
	 
	        return timedate;
	    }
	

	  public String YesterdayDate() {
	        SimpleDateFormat Format = new SimpleDateFormat("yyyyMMdd");
	        Calendar cal = Calendar.getInstance();
	 
	        cal.add(Calendar.DATE, -1);
	        String timedate = Format.format(cal.getTime());
	 
	        return timedate;
	    }
	  
	  public String twoAgodayDate() {
	        SimpleDateFormat Format = new SimpleDateFormat("yyyyMMdd");
	        Calendar cal = Calendar.getInstance();
	 
	        cal.add(Calendar.DATE, -2);
	        String timedate = Format.format(cal.getTime());
	 
	        return timedate;
	    }
	  
	  public String threeAgodayDate() {
	        SimpleDateFormat Format = new SimpleDateFormat("yyyyMMdd");
	        Calendar cal = Calendar.getInstance();
	 
	        cal.add(Calendar.DATE, -3);
	        String timedate = Format.format(cal.getTime());
	 
	        return timedate;
	    }
	  
	  public String fourAgodayDate() {
	        SimpleDateFormat Format = new SimpleDateFormat("yyyyMMdd");
	        Calendar cal = Calendar.getInstance();
	 
	        cal.add(Calendar.DATE, -4);
	        String timedate = Format.format(cal.getTime());
	 
	        return timedate;
	    }
	  
	  public String fiveAgodayDate() {
	        SimpleDateFormat Format = new SimpleDateFormat("yyyyMMdd");
	        Calendar cal = Calendar.getInstance();
	 
	        cal.add(Calendar.DATE, -5);
	        String timedate = Format.format(cal.getTime());
	 
	        return timedate;
	    }
	  
	  public String sixAgodayDate() {
	        SimpleDateFormat Format = new SimpleDateFormat("yyyyMMdd");
	        Calendar cal = Calendar.getInstance();
	 
	        cal.add(Calendar.DATE, -6);
	        String timedate = Format.format(cal.getTime());
	 
	        return timedate;
	    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
