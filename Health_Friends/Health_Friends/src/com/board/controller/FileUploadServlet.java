package com.board.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/fileupload.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, //2MB
		maxFileSize = 1024 * 1024 * 10,	//10MB
		maxRequestSize = 1024 * 1024 * 50) //50MB
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int maxRequestSize = 1024 * 1024 * 50;

	public FileUploadServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String path = "/upload"; //지정 폴더
		ServletContext context = request.getSession().getServletContext();
		String realpath = context.getRealPath(path);
		System.out.println(realpath);
		MultipartRequest multi = new MultipartRequest(request, realpath, maxRequestSize, "UTF-8", new DefaultFileRenamePolicy());
		String fileName = multi.getOriginalFileName("upload");
		System.out.println("file:" + fileName);
		JSONObject outData = new JSONObject();
		outData.put("uploaded", true);
		
		outData.put("url", request.getScheme() + ":\\test" + request.getServerName() + ":" + request.getServerPort() + realpath + "\\" + fileName);
		System.out.println(outData.get("url"));
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(outData.toString());
						
	}

}
