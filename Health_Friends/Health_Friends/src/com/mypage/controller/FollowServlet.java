package com.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.biz.RegistBiz;
import com.login.biz.RegistBizImpl;
import com.login.dto.RegistDto;
import com.mypage.biz.FollowBiz;
import com.mypage.biz.FollowBizImpl;
import com.mypage.dto.FollowDto;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class FollowServlet
 */
@WebServlet("/follow.do")
public class FollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		FollowBiz biz = new FollowBizImpl();
		
		if(command.equals("follow")) {
			response.sendRedirect("./views/mypage/follower.jsp");
			
		} else if(command.equals("following")) {
			HttpSession session = request.getSession();
			RegistDto Ldto = (RegistDto)session.getAttribute("Ldto");
			int following_no = Ldto.getMember_no();

			List<RegistDto> list = biz.searchFollwing(following_no);
			
			List<Map> res = new ArrayList<Map>(); 
			
			for(int i = 0; i < list.size(); i++) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("member_picture_path", list.get(i).getMember_picture_path());
				map.put("member_id", list.get(i).getMember_id());
				
				res.add(map);
			}
			JSONArray result = JSONArray.fromObject(res);
			System.out.println("result : " +result.toString());
			response.getWriter().print(result.toString());
			
		} else if(command.equals("follower")) {
			
			HttpSession session = request.getSession();
			RegistDto Ldto = (RegistDto)session.getAttribute("Ldto");
			int follow_member_no = Ldto.getMember_no();
			
			List<RegistDto> list = biz.searchFollowed(follow_member_no);
			
			List<Map<String, String>> res = new ArrayList<Map<String, String>>(); 
						
			for(int i = 0; i < list.size(); i++) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("member_picture_path", list.get(i).getMember_picture_path());
				map.put("member_id", list.get(i).getMember_id());
				
				res.add(map);
			}
			JSONArray result = JSONArray.fromObject(res);
			System.out.println(result.toString());
			response.getWriter().print(result.toString());
			
		} else if(command.equals("profile")) {
			String member_id = request.getParameter("member_id");
			RegistBiz regiBiz = new RegistBizImpl();
			
			RegistDto dto = regiBiz.selectById(member_id);
			HttpSession session = request.getSession();
			RegistDto Ldto = (RegistDto)session.getAttribute("Ldto");
			
			FollowDto fdto = new FollowDto();
			fdto.setFollow_following_no(Ldto.getMember_no());
			fdto.setFollow_member_no(dto.getMember_no());
			
			int res = biz.followChk(fdto);
			System.out.println(res);
			
			request.setAttribute("dto", dto);
			request.setAttribute("res", res);
			dispatch(request, response, "./views/mypage/profile.jsp");
		} else if(command.equals("followchk")) {
			int following_no = Integer.parseInt(request.getParameter("following_no"));
			int followed_no = Integer.parseInt(request.getParameter("followed_no"));
			
			System.out.println("following:" + following_no);
			System.out.println("followed: " + followed_no);
			
			FollowDto dto = new FollowDto();
			dto.setFollow_following_no(following_no);
			dto.setFollow_member_no(followed_no);
			
			int res = biz.followChk(dto);
			
			response.getWriter().print(res);
		} else if(command.equals("addfollow")) {
			int following_no = Integer.parseInt(request.getParameter("following"));
			int followed_no = Integer.parseInt(request.getParameter("followed"));
			
			FollowDto dto = new FollowDto();
			dto.setFollow_following_no(following_no);
			dto.setFollow_member_no(followed_no);
			
			int res = biz.addFollow(dto);
			
			response.getWriter().print(res);
		} else if(command.equals("unfollow")) {
			int following_no = Integer.parseInt(request.getParameter("following"));
			int followed_no = Integer.parseInt(request.getParameter("followed"));
			
			FollowDto dto = new FollowDto();
			dto.setFollow_following_no(following_no);
			dto.setFollow_member_no(followed_no);
			
			int res = biz.removeFollow(dto);
			
			response.getWriter().print(res);
		} else if(command.equals("searching")) {
			
			String searchId = request.getParameter("searchId");
			searchId = "%"+searchId+"%";
			
			List<RegistDto> list = biz.searchId(searchId);
			
			for(int i = 0; i < list.size(); i++) {
				
				System.out.println(list.get(i).getMember_id());
			}
			
			request.setAttribute("list", list);
			
			dispatch(request, response, "search.jsp");
			
		}
	}
	
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}
	
	private void jsResponse(HttpServletResponse response, String url, String msg) throws IOException {
		String s = "<script type='text/javascript'>"
				+ "alert('"+ msg +"');"
				+ "location.href='" + url + "';"
				+ "</script>";
		response.getWriter().print(s);
	}

}
