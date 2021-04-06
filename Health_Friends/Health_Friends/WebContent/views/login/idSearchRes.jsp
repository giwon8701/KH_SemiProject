<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

				<h2 class="title">아이디 찾기 결과</h2>

				<table>
					<tr>
						<b>${dto.member_name }님의 아이디는</b>
					</tr>
				</table>
				
				<table>
					<tr>
						${dto.member_id }입니다.
					</tr>
				</table>
			</form>

			</div>

			<div class="panels-container">
				<div class="panel left-panel">
					<div class="content">
						<h3>회원 정보를 잊지 않도록 주의해주세!</h3>
						<p>회원정보를 모두 잃어버리셨다면 관리자에게 문의주세요!</p>
					</div>
					<img src="images/login/idSearvhRes.svg" class="image" alt="">
				</div>

			</div>

			<script src="assets/js/loginstyle.js"></script>

		</div>
	</div>

</body>
</html>