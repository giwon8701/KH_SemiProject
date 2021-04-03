package com.board.controller;

import java.io.IOException;
import java.util.UUID;

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
		String real_save_path = request.getServletContext().getRealPath(path);
		MultipartRequest multi = new MultipartRequest(request, real_save_path, maxRequestSize, "UTF-8", new DefaultFileRenamePolicy());
		String fileName = multi.getOriginalFileName("upload");
		String ext = fileName.substring(fileName.lastIndexOf(".")+1);
		String realName = UUID.randomUUID().toString() + "." + ext;
		JSONObject outData = new JSONObject();
		outData.put("uploaded", true);
		outData.put("url", request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/" + realName);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(outData.toString());
						
	}

}
