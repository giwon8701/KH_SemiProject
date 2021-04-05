<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/login.css">
<script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	<!-- 도로명주소 API -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>	<!-- jQuery API -->
<script src="https://www.google.com/recaptcha/api.js"></script>			<!--  recaptcha API -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>	<!--  카카오 로그인 API -->
<script type="text/javascript" src="assets/js/login.js"></script> <!-- 로그인 관련 -->
<script type="text/javascript" src="assets/js/loginRegist.js"></script> <!-- 회원가입 관련 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
</head>
<body>
	<div class="container">
		<div class="forms-container">
			<div class="signin-signup">
				<!-- 로그인 form -->
				<form action="regist.do" class="sign-in-form" method="post" id="loginForm">
					<input type="hidden" name="command" value="loginres">
					
					<h2 class="title">로그인</h2>
					<div class="input-field">
						<i class="fas fa-user"></i> <input type="text" name="loginMemberId" placeholder="아이디를 입력해주세요">
					</div>
					
					<div class="input-field">
						<i class="fas fa-lock"></i>
						<input type="password" name="loginMemberPw" placeholder="비밀번호를 입력해주세요">
					</div>
					<table>
						<tr>
							<td>
								<input type="button" value="로그인" class="btn solid g-recaptcha" data-sitekey="6LdY0Y0aAAAAAC55f1G3fyahKgyATLdZ1BZq_yt5" data-callback='onSubmitLogin' data-action='submit'>
							</td>
							<td>
								<input type="button" value="아이디 찾기" class="btn solid g-recaptcha" onclick="location.href='regist.do?command=idSearch'">
							</td>
						</tr>
					</table>
					<p class="social-text">SNS를 이용하여 간편로그인 해보세요!</p>
					<div class="social-media">
						&nbsp;<div id="naver_id_login"></div>&nbsp;&nbsp;  <!-- 네이버 로그인 버튼 (맨밑에 javascript 있음) -->
   						<a id="kakaologin" href="javascript:loginWithKakao()" class="kakao-icon">
   							<img src="https://t1.kakaocdn.net/kakaocorp/admin/main-banner/123" class="kakao-icon">
						</a>
					</div>
				</form>




				<!-- 회원가입 form -->
				<form action="regist.do" method="post" id="registform"
					class="sign-up-form">
					<input type="hidden" name="command" value="registres">

					<h2 class="title">회원가입</h2>

					<table>
						<tr>
							<div class="input-field">
								<i class="fas fa-user"></i>
								<input type="text" id="id" name="memberId" title="n" placeholder="아이디입력" required="required" onkeyup="idCheck()">
							</div>
						</tr>
						<tr>
							<td id="idchk" style="font-size: 10px; text-align: start"></td>
						</tr>
					</table>
					<table>
						<tr>
							<div class="input-field">
								<i class="fas fa-lock"></i> <input type="password" id="pw" name="memberPw" placeholder="비밀번호" required="required" onkeyup="chkPW()">
							</div>
						</tr>
						<tr>
							<div class="input-field">
								<i class="fas fa-lock"></i> <input type="password" id="pwchk" name="memberPwChk" title="n" placeholder="비밀번호 확인" required="required" onkeyup="chkPW()">
							</div>
						</tr>
						<tr>
							<td id="same" style="font-size: 10px; text-align: start"></td>
						</tr>
					</table>
					<table>
						<tr>
							<div class="input-field">
								<i class="fas fa-home"></i> <input type="text" id="addr" name="memberAddr" placeholder="주소를 입력해주세요" readonly="readonly" required="required" onclick="addrCheck()">
							</div>
						</tr>

						<tr>
							<div class="input-field">
								<i class="fas fa-user"></i> <input type="text" id="name" name="memberName" placeholder="이름" required="required">
							</div>
						</tr>
					</table>

					<table>
						<tr>
							<div class="input-field">
								<i class="fas fa-phone"></i> <input type="tel" id="phone" name="memberPhone" title="n" placeholder="전화번호" onkeyup="phoneChk()" required="required">
							</div>
						</tr>
						<tr>
							<td id="phonechk" style="font-size: 10px; text-align: start"></td>
						</tr>
					</table>
					<table>
						<tr>
							<div class="input-field">
								<i class="fas fa-envelope"></i> <input type="text" id="email" name="memberEmail" title="n" placeholder="이메일" required="required" onkeyup="emailChk()">
							</div>
						</tr>
						<tr>
							<td id="emailchk" style="font-size: 10px; text-align: start"></td>
						</tr>
					</table>
					<br>
					<table>
						<tr>
							<td><label for="birth">생년월일</label></td>
							<td><select name="year" id="birth" required="required">
									<c:forEach var="i" begin="1910" end="2021" step="1">
										<option value="${i }" ${(i == 2000)? "selected" : ""}><c:out value="${i }"></c:out></option>
									</c:forEach>
							</select>년</td>
							<td><select name="mm" id="birth" required="required">
									<c:forEach var="i" begin="01" end="12" step="1">
										<option value="${i }"><c:out value="${i }"></c:out></option>
									</c:forEach>
							</select>월</td>
							<td><select name="dd" id="birth" required="required">
									<c:forEach var="i" begin="01" end="31" step="1">
										<option value="${i }"><c:out value="${i }"></c:out></option>
									</c:forEach>
							</select>일</td>
						</tr>
					</table>
					<br>
					<table>
						<tr>
							<td>
								<label for="f">Female</label>
							</td>
							<td>
								&nbsp;&nbsp;&nbsp;
							</td>
							<td>
								<label for="m">Male</label>
							</td>
						</tr>
						<tr>
							<td align="center">
								<input type="radio" id="f" name="memberGender" value="F" checked="checked" />&nbsp;&nbsp;
							</td>
							<td>
							</td>
							<td align="center">
								<input type="radio" id="m" name="memberGender" value="M" />
							</td>
						</tr>
					</table>
					<br>
					<table>
						<tr>
							<td>
								<input type="button" class="btn solid g-recaptcha" data-sitekey="6LdY0Y0aAAAAAC55f1G3fyahKgyATLdZ1BZq_yt5" data-callback='onSubmit' data-action='submit' value="회원가입">
							</td>
							<td>
								<input type="button" value="취소" class="btn solid" onclick="history.back()">
							</td>
						</tr>
					</table>
				</form>
			</div>

			<div class="panels-container">
				<div class="panel left-panel">
					<div class="content">
						<h3>처음 방문 하시나요?</h3>
						<p>회원가입 후 이용하시면 더욱 다양한 서비스를 이용할 수 있습니다!</p>
						<button class="btn transparent" id="sign-up-btn">Sign up</button>
					</div>
					<img src="images/login/log.svg" class="image" alt="">
				</div>
				
				<div class="panel right-panel">
					<div class="content">
						<h3>이미 회원이신가요?</h3>
						<p>이미 회원이시라면 로그인을 해주세요!</p>
						<button class="btn transparent" id="sign-in-btn">Sign in</button>
					</div>
					<img src="images/login/register.svg" class="image" alt="">
				</div>
			</div>

			<script src="assets/js/loginstyle.js"></script>

		</div>
	</div>
	
 <script type="text/javascript">
	var naver_id_login = new naver_id_login("WSSex0InjkcHuJcQW5ov", "http://localhost:8787/Health_Friends/views/login/naver_popup.jsp")
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 0, 40);
	naver_id_login.setDomain("http://localhost:8787");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>
</body>
</html>