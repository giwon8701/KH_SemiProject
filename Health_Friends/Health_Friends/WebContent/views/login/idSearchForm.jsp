<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 운동친구∴∵Heath Friends</title>
</head>
<link rel="stylesheet" href="assets/css/login.css">
<script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
<body>
	<div class="container">
		<div class="forms-container">
			<div class="signin-signup">
				<!-- 회원정보수정 form -->
				<form action="regist.do" method="post" id="registform" class="sign-in-form">
				<input type="hidden" name="command" value="idSearchRes">

				<h2 class="title">아이디 찾기</h2>

				<table>
					<tr>
						<div class="input-field">
							<i class="fas fa-user"></i>
							<input type="text" required="required" name="member_name" placeholder="이름을 입력해주세요">
						</div>
					</tr>
				</table>
				
				<table>
					<tr>
						<div class="input-field">
							<i class="fas fa-envelope"></i> 
							<input type="text" required="required" name="member_email"  placeholder="이메일을 입력해주세요">
						</div>
					</tr>
				</table>
				<table>
					<tr>
						<td>
							<input type="submit" value="아이디 찾기" class="btn solid g-recaptcha">
						</td>
						<td>
							<input type="button" value="취소" class="btn solid g-recaptcha" onclick="location.href='regist.do?command=login'">
						</td>
					</tr>
				</table>
			</form>

			</div>
			<div class="panels-container">
				<div class="panel left-panel">
					<div class="content">
						<h3>회원 정보를 찾아주세요!</h3>
						<p>회원정보를 모두 잃어버리셨다면 관리자에게 문의주세요!</p>
					</div>
					<img src="images/login/idSearchForm.svg" class="image" alt="">
				</div>

			</div>
			<script src="assets/js/loginstyle.js"></script>
		</div>
	</div>
</body>
</html>