package com.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ImageServlet
 */
@WebServlet("/image.do")
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public ImageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/upload";
		int size = 10 * 1024 * 1024;
		
		String fileName = "";
		
		try {
			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			String file = (String)files.nextElement();
			fileName = multi.getFilesystemName(file);
			String ext = fileName.substring(fileName.lastIndexOf("."));
			
			String savedFileName = UUID.randomUUID() + ext;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String uploadpath = "/upload/";
		
		JsonObject jobj = new JsonObject();
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
