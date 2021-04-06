package com.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dto.RegistDto;
import com.mypage.biz.ProfileBiz;
import com.mypage.biz.ProfileBizImpl;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/profile.do")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String member_email = request.getParameter("member_email");
		
		ProfileBiz biz = new ProfileBizImpl();
		
		String realFolder = "profileimg";
		String filename = request.getParameter("filename");
		int maxSize = 480 * 480 * 5;
		String encType = "UTF-8";
		String savefile = "profileimg";
		ServletContext scontext = getServletContext();
		
		realFolder = scontext.getRealPath(savefile);
		File folder = new File(realFolder);
		
		try {
			if (!folder.exists()) {
				folder.mkdir();
			}
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

			Enumeration<?> files = multi.getFileNames();
			String file = (String) files.nextElement();
			filename = multi.getFilesystemName(file);
			System.out.println(filename);
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		String fullpath = realFolder + "\\" + filename;
		
		RegistDto dto = new RegistDto();
		dto.setMember_email(member_email);
		dto.setMember_picture_path(filename);
		
		int res = biz.profileUpdate(dto);
		
		System.out.println(res);
		
		HttpSession session = request.getSession();
		// 세션에 담겨있는 로그인정보 가져옴
		RegistDto loginSessionDto = (RegistDto)session.getAttribute("Ldto");
		loginSessionDto.setMember_picture_path(filename);
		session.setAttribute("Ldto", loginSessionDto);
	
		if(res > 0) {
			System.out.println("테스트");
			response.getWriter().print("<script>alert('프로필 사진이 변경되었습니다!')</script>");
			//dispatch(request, response, "./views/mypage/mypage.jsp");
			jsResponse(response, "mypage.do?command=mypage", "프로필 사진이 변경되었습니다!");
		} else {
			response.getWriter().print("<script>alert('프로필 사진변경에 실패하였습니다!')</script>");
			dispatch(request, response, "./views/mypage/mypage.jsp");
			//jsResponse(response, "./views/mypage/mypage.jsp", "프로필 사진변경에 실패하였습니다!");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
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
