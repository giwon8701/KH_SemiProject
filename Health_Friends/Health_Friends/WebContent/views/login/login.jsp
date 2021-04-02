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
<script src="https://www.google.com/recaptcha/api.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	
	function onSubmit(){
		if($("[name=memberId]").val() == null || $("[name=memberId]").val() == "" || $("[name=memberPw]").val() == null || $("[name=memberPw]").val() == ""){
			
			$("#loginchk").text("아이디와 비밀번호를 입력해주세요.");
			$("#loginchk").css("font-size", "10px").css("color", "red");
			
		} else{
			$("#loginForm").submit();
		}
	}
	
	Kakao.init('512a80154acbfb025784436cb05beaaf');
	
	function loginWithKakao() {
	    Kakao.Auth.login({
	      success: function(authObj) {
	        
	        Kakao.API.request({
	            url: '/v2/user/me',
	            success: function(res) {
	            	$.ajax({
		            	 url: "../../kakao.do?command=registChk&email=" + res.kakao_account.email,
		            	 success: function(cnt){
		            		 var email = res.kakao_account.email;
		            		 var birthday = res.kakao_account.birthday;
		            		 var gender = res.kakao_account.gender;
		            		 
		            		 if(cnt == 0){
		            			var queryString = "?command=kakaoRegist&email="+email+"&birthday="+birthday+"&gender="+gender;
		            			alert("회원정보가 존재하지 않습니다! 간편 회원가입 페이지로 이동합니다.");
		            			location.href="../../kakao.do"+queryString;
		            		 } else if(cnt > 0){
		            			 location.href="../../kakao.do?command=kakaoLogin&email="+email;
		            		 }
		            	 }		 
		              });
	            },
	            fail: function(error) {
	              alert(
	                'login success, but failed to request user information: ' +
	                  JSON.stringify(error)
	              )
	            },
	          });
	      },
	      fail: function(err) {
	        alert(JSON.stringify(err))
	      },
	    })
	  }
    
	

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

	<form action="../../regist.do" method="post" id="loginForm">
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
			</tr>
			<tr>
				<td><input type="button" value="아이디찾기" onclick="location.href='../../regist.do?command=idSearch'"></td>
				<td><input type="button" value="비밀번호찾기" onclick="location.href='../../regist.do?command=pwSearch'"></td>
			</tr>
			<tr>
				<td colspan="4"><button class="g-recaptcha" 
        					data-sitekey="6LdY0Y0aAAAAAC55f1G3fyahKgyATLdZ1BZq_yt5" 
        					data-callback='onSubmit' 
        					data-action='submit'>로그인</button></td>
			</tr>
			<tr>
				<td colspan="4"><input type="button" value="회원가입" onclick="location.href='../../regist.do?command=registForm'"></td>
			</tr>
			<tr>
				<td colspan="4">
					<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<a id="kakaologin" href="javascript:loginWithKakao()">
  						<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222"/>
					</a>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>