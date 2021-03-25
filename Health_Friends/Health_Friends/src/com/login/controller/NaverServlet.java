package com.login.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.login.dao.RegistDao;
import com.login.dao.RegistDaoImpl;
import com.login.dto.RegistDto;


/*네이버 로그인 처리 서블렛*/
@WebServlet("/naver.do")
public class NaverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String clientId = "WSSex0InjkcHuJcQW5ov";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "yjJ34xQfNh";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8787/Health_Friends/naver.do", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    System.out.println("apiURL="+apiURL);
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      System.out.print("responseCode="+responseCode);
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
	      if(responseCode==200) {
	    	System.out.println(res.toString());
	    	  
	    	// access_token 값 추출
			JSONParser parsing = new JSONParser();
			Object obj = parsing.parse(res.toString());
			JSONObject jsonObj = (JSONObject)obj;
								        
			access_token = (String)jsonObj.get("access_token");
			refresh_token = (String)jsonObj.get("refresh_token");
			
			// 회원정보 조회
			String token = access_token;
			String header = "Bearer " + token;
			String pInfoApiURL = "https://openapi.naver.com/v1/nid/me";
			
			
			Map<String, String> requestHeaders = new HashMap<>();
			requestHeaders.put("Authorization", header);
			String responseBody = 
			requestHeaders.get(pInfoApiURL);
			//get(pInfoApiURL, requestHeaders);
			
			Object responseBodyObj = parsing.parse(responseBody);
			JSONObject jsonResponseBodyObj = (JSONObject)responseBodyObj;
			JSONObject resObj = (JSONObject) jsonResponseBodyObj.get("response");
			
			String member_id = resObj.get("id").toString();
			String member_name = (String)resObj.get("name");
			String member_email = (String)resObj.get("email");
			String member_gender = (String)resObj.get("gender");
			String birthmmdd = (String)resObj.get("birthday"); //mm-dd 01234
			String birthyear = (String)resObj.get("birthyear"); 
			String member_birthday = birthyear + birthmmdd.substring(0, 2) + birthmmdd.substring(3);
			String member_phone = (String)resObj.get("mobile");
			
			RegistDto dto = new RegistDto();
			dto.setMember_id(member_id);
			dto.setMember_name(member_name);
			dto.setMember_email(member_email);
			dto.setMember_gender(member_gender);
			dto.setMember_birthday(member_birthday);
			dto.setMember_phone(member_phone);
			
			//가입 유무 확인
			RegistDao dao = new RegistDaoImpl();
			int regist = dao.registCheck(member_email);
			
			if(regist > 0) {
				//로그인 처리
				
				jsResponse(response, "index.jsp", member_name+"님, 환영합니다.");
			} else {
				//추가정보 입력창으로 이동
				request.setAttribute("dto", dto);
				dispatch(request, response, "./views/login/naverRegistForm");
			}

			
	      }
	    } catch (Exception e) {
	      System.out.println(e);
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
				 + "alert('"+ msg + "');"
				 + "location.href='"+ url +"';"
				 + "</script>";
		response.getWriter().print(s);
	}
}
