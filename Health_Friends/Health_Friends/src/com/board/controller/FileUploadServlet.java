package com.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/fileupload.do")
// 게시글 원글 등록 처리용 컨트롤러
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		// 업로드할 파일의 용량 제한 : 10Mbyte로 제한한다면

		int maxSize = 1024 * 1024 * 10; // 용량 제한

		RequestDispatcher view = null;

		// 
		String root = request.getSession().getServletContext().getRealPath("/uploadImages");
		
		// 파일 저장 경로
		File file = new File(root);
		try {
			if (!file.exists()) file.mkdirs();
		} catch (Exception e) {
			e.printStackTrace();
		}

		// web/board_upload 로 지정함
		// request 를 MultipartRequest 객체로 변환함

		MultipartRequest mrequest = new MultipartRequest(request, root, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		// 파일이름이 바뀌었을 때 그 이름을 가져온다.(바뀌지 않았다면 원래이름 그대로임)
		Enumeration files = mrequest.getFileNames();
		String str = (String) files.nextElement(); // 파일 이름을 받아와 string으로 저장
		String originFileName = mrequest.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
		String imagePath = "uploadImages\\" + originFileName;
		
		JSONObject jobj = new JSONObject();
		jobj.put("imagePath", imagePath);
		jobj.put("thumbnail", originFileName);

		System.out.println("root = " + root);
		response.getWriter().print(jobj.toJSONString()); // 값을 json형태로 변환해줌

	}

}
