package com.shopping.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.shopping.dto.ShoppingDto;

@WebServlet("/shopping.do")
public class ShoppingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");

		if (command.equals("shopping")) {
			response.sendRedirect("./views/shopping/view.jsp");
			
		} else if (command.equals("search")) {
			String keyword = URLEncoder.encode(request.getParameter("keyword"), "UTF-8");
			String clientId = "_3AIU523fsl3259zT1M3";
			String clientSecret = "TaDZyyf7Z7";

			String apiURL = "https://openapi.naver.com/v1/search/shop.json?query=" + keyword + "&display=100&start=1000";

			Map<String, String> requestHeaders = new HashMap<>();
			requestHeaders.put("X-Naver-Client-Id", clientId);
			requestHeaders.put("X-Naver-Client-Secret", clientSecret);
			String responseBody = get(apiURL, requestHeaders);
			System.out.println(responseBody);

			JsonElement element = JsonParser.parseString(responseBody);

			JsonObject jsonData = element.getAsJsonObject();
			JsonElement items = jsonData.get("items");
			JsonArray recordsArray = items.getAsJsonArray();

			List<ShoppingDto> list = new ArrayList<ShoppingDto>();
			JsonArray resultArray = new JsonArray();

			for (int i = 0; i < recordsArray.size(); i++) {
				String title = recordsArray.get(i).getAsJsonObject().get("title").getAsString();
				String link = recordsArray.get(i).getAsJsonObject().get("link").getAsString();
				String image = recordsArray.get(i).getAsJsonObject().get("image").getAsString();
				int lprice = recordsArray.get(i).getAsJsonObject().get("lprice").getAsInt();
				String brand = recordsArray.get(i).getAsJsonObject().get("brand").getAsString();
				String category3 = recordsArray.get(i).getAsJsonObject().get("category3").getAsString();

				ShoppingDto dto = new ShoppingDto(title, link, image, lprice, brand, category3);
				list.add(dto);

				Gson gson = new Gson();
				String jsonString = gson.toJson(dto);
				resultArray.add(JsonParser.parseString(jsonString));
			}

			JsonObject result = new JsonObject();
			result.add("result", resultArray);

			System.out.println("result : " + result);
			response.getWriter().append(result + "");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}
}