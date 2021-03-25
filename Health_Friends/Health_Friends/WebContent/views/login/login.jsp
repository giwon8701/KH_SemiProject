<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
	
</script>
</head>
  <%
    String clientId = "WSSex0InjkcHuJcQW5ov";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8787/Health_Friends/naver.do", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
<body>

<!-- 로그인 화면 jsp -->

	<form action="../../src/com/login/controller/regist.do" method="post" id="loginForm">
		<input type="hidden" name="command" value="loginres">
		<table>
			<tr>
				<td colspan="4"><input type="text" name="memberId" placeholder="아이디를 입력해주세요"></td>
			</tr>
			<tr>
				<td colspan="4"><input type="password" name="memberPw" placeholder="비밀번호를 입력해주세요"></td>
			</tr>
			<tr>
				<td colspan="5" align="right"></td>
			</tr>
			<tr>
				<td colspan="2" id="loginchk"></td>
				<td><input type="button" value="아이디찾기" onclick=""></td>
				<td><input type="button" value="비밀번호찾기" onclick=""></td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="로그인"></td>
			</tr>
			<tr>
				<td colspan="4"><input type="button" value="회원가입" onclick="location.href='regist.do?command=registForm'"></td>
			</tr>
			<tr>
				<td colspan="4">
					<img onclick="naverlogin()" height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/>
				</td>
			</tr>
		</table>
		 
	</form>

	<script>
		function naverlogin(){
			open("<%=apiURL%>", "", "width=500px height=500px");
		}
	</script>
	
	
</body>
</html>