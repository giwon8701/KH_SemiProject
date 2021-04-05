<%@page import="com.login.dto.RegistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../assets/css/login.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 도로명주소 -->

<script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>	<!-- jQuery API -->
<script type="text/javascript">

	function addrCheck(){
		
		new daum.Postcode({
	        oncomplete: function(data) {
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 참고 항목 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	                
	                roadAddr += extraRoadAddr;
	            }
	            
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            $("#addr").val(roadAddr);
	        }
	
	    }).open();
	}
	
	function phoneChk(){
		var newPhone = $("#phone").val();
		if($.trim(newPhone) == "" || $.trim(newPhone) == null){
			$("#phonechk").text("전화 번호를 입력해주세요").css("color", "red");
		} else{
			var queryString = "?command=phoneCheck&memberPhone="+newPhone;
			$.ajax({
				url: "../../regist.do"+queryString,
				dataType: "text",
				success: function(data){
					if(data == 0){
						$("#phonechk").text("등록 가능한 번호입니다.");
			            $("#phonechk").css("color", "blue");
			            $("#phone").prop("title", "y");
			            $("#phone").css("background-color", "skyblue");
			            
					} else if(data == 1) {
						$("#phonechk").text("이미 사용중인 번호입니다.");
			            $("#phonechk").css("color", "red");
			            $("#phone").prop("title", "n");
			            $("#phone").focus();
			            $("#phone").css("background-color", "red");
					}
				},
				error: function(){
					$("#phonechk").text("통신오류");
		            $("#phonechk").css("color", "blue");
				}
			});
		}
	}
	
	
	$(function(){
		
		$("#pwReset").click(function(){
			var member_id = $("#id").val();
			open("../../mypage.do?command=pwReset&member_id="+member_id, "", "width=300px,height=300px");
		});
		
	});
	
	function del(){
		var member_id = $("#id").val();
		var queryString = "?command=delRegist&member_id=" + member_id;
		var res = confirm("정말로 탈퇴하시겠습니까?");
		if(res){
			$.ajax({
				url: "../../mypage.do"+queryString,
				dataType: "text",
				success: function(data){
					if(data > 0){
						location.href="../../regist.do?command=logout";
					} else{
						alert("다시 시도해주세요.");
					}
				},
				error: function(){
					alert("통신오류");
				}
			});
		}
	}
	
</script>
</head>
<body>
	<div class="container">
		<div class="forms-container">
			<div class="signin-signup">
				<!-- 회원정보수정 form -->
				<form action="../../regist.do" method="post" id="registform" class="sign-in-form">
				<input type="hidden" name="command" value="registUpdateRes">

				<h2 class="title">회원정보 수정</h2>

				<table>
					<tr>
						<div class="input-field">
							<i class="fas fa-user"></i>
							<input type="text" readonly="readonly" name="member_id" id="id" value="${Ldto.member_id }">
						</div>
					</tr>
				</table>
				<table>
					<tr>
						<div class="input-field">
							<i class="fas fa-user"></i> 
							<input type="text" readonly="readonly" name="member_name" id="name" value="${Ldto.member_name }">
						</div>
					</tr>
				</table>
				<table>
					<tr>
						<td>
							<i class="fas fa-lock"></i>
							<input type="button" id="pwReset" value="비밀번호 재설정" class="btn solid">
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<div class="input-field">
							<i class="fas fa-home"></i> 
							<input type="text" id="addr" name="member_addr" required="required" value="${Ldto.member_addr }" onclick="addrCheck()">
						</div>
					</tr>
				</table>

				<table>
					<tr>
						<div class="input-field">
							<i class="fas fa-envelope"></i> 
							<input type="text" id="email" name="member_email" value="${Ldto.member_email }" readonly="readonly">
						</div>
					</tr>
				</table>
				<table>
					<tr>
						<div class="input-field">
							<i class="fas fa-phone"></i> 
							<input type="tel" id="phone" name="member_phone" required="required" title="y" value="${Ldto.member_phone }" onchange="phoneChk()">
						</div>
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
							<input type="submit" class="btn solid g-recaptcha" data-sitekey="6LdY0Y0aAAAAAC55f1G3fyahKgyATLdZ1BZq_yt5" data-callback='onSubmit' data-action='submit' value="수정하기">
						</td>
						<td>
							<input type="button" value="회원 탈퇴" class="btn solid" onclick="del()">
						</td>
					</tr>
				</table>
			</form>

			</div>

			<div class="panels-container">
				<div class="panel left-panel">
					<div class="content">
						<h3>회원 정보를 수정해주세요!</h3>
						<p>비밀번호는 재설정을 통해 변경 할 수 있습니다.</p>
					</div>
					<img src="../../images/login/registUpdate.svg" class="image" alt="">
				</div>

			</div>

			<script src="../../assets/js/loginstyle.js"></script>

		</div>
	</div>
</body>
</html>