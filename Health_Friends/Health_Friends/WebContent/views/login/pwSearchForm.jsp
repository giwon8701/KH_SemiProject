<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 운동친구∴∵Heath Friends</title>
<link rel="stylesheet" href="../../assets/css/login.css">
<script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

	function getParameterValues(){
		var member_name = "member_name="+ encodeURIComponent($("#name").val());
		var member_id = "member_id=" + encodeURIComponent($("#id").val());
		var member_email = "member_email="+ encodeURIComponent($("#email").val());	
		
		return "?command=pwSearchRes&" + member_name + "&" + member_id + "&" + member_email;
	}
	
	function pwSearch(){
		var queryString = getParameterValues();
		if($("#name").val() == "" || $("#name").val() == null || $("#id").val() == "" || $("#id").val() == null || $("#email").val() == "" || $("#email").val() == null){
			$("#chk").text("입력사항을 모두 입력해주세요").css("color", "red");
		} else{
			$.ajax({
				url: "../../regist.do"+queryString,
				dataType: "text",
				success: function(data){
					if(data == 1){
						$("#member_id").val($("#id").val());
						$("#member_email").val($("#email").val());
						$("#pwSearch").css("display", "none");
						$("#pwReset").css("display","");
					} else{
						$("#chk").text("정보를 불러오는데 실패했습니다.").css("color", "red");
					}
				},
				error: function(){
					$("#chk").text("통신오류").css("color", "red");
				}
			});
		}		
	}

	function chkPW() {
	    if ($("#pw").val() != '' && $("#pwchk").val() != '') {
	        if ($("#pw").val() == $("#pwchk").val()) {
	        	$("#same").text("비밀번호가 일치합니다");
	        	$("#same").css("color", "blue");
	        	$("#pwchk").prop("title", "y");
	        	$("#pwchk").css("background-color", "skyblue");
	          
	        } else {
	        	$("#same").text("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
	            $("#same").css("color", "red");
	            $("#pwchk").prop("title", "n");
	            $("#pwchk").css("background-color", "red");
	        }
	    }
	}
	
	function pwReg(){
		var pw = $("#pw").val();
		var reg = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^*&+=-]).*$/;
		chkPW()
		if(!reg.test(pw)){
			$("#pw").prop("title", "n");
			$("#reg").text("8~16자의 영문자,숫자,특수문자의 조합으로 입력해주세요").css("color", "red");
			$("#pw").css("background-color", "red");
		} else{
			$("#pw").prop("title", "y");
			$("#reg").text("사용가능한 비밀번호 입니다.").css("color", "blue");
			$("#pw").css("background-color", "skyblue");
		}
	}
	
	$(function(){
		
		$("#pwReset").submit(function(e){
			if($("#pwchk").prop("title") == "y" && $("#pw").prop("title") == "y"){
				$("#pwReset").submit();
			} else{
				alert("비밀번호를 다시 확인해주세요.");
				e.preventDefault();
			}
		});
		
	});
</script>
</head>
<body>


	<div class="container">
		<div class="forms-container">
			<div class="signin-signup">
				<!-- 비밀번호 찾기 form -->

				<form id="pwSearch">
					<table>
					<h2 class="title">비밀번호 찾기</h2>
						<tr>
							<div class="input-field">
								<i class="fas fa-user"></i>
								<input type="text" required="required" id="name" name="name" placeholder="이름을 입력해주세요">
							</div>
						</tr>
					</table>
					<table>
						<tr>
							<div class="input-field">
								<i class="fas fa-user"></i> 
								<input type="text" required="required" id="id" name="id" placeholder="아이디를 입력해주세요">
							</div>
						</tr>
					</table>
					<table>
						<tr>
							<div class="input-field">
								<i class="fas fa-envelope"></i> 
								<input type="text" required="required" id="email" name="email"  placeholder="이메일을 입력해주세요">
							</div>
						</tr>
					</table>
					<table>
						<tr>
							<td>
								<input type="button" value="확인" class="btn solid g-recaptcha" onclick="pwSearch()">
							</td>
							<td>
								<input type="button" value="메인으로" class="btn solid g-recaptcha" onclick="location.href='../../index.jsp'">
							</td>
						</tr>
					</table>
				</form>
				
				
				<form action="../../regist.do" id="pwReset" style="display : none" method="post">
				<input type="hidden" name="command" value="pwReset">
				<input type="hidden" id="member_id" name="member_id">
				<input type="hidden" id="member_email" name="member_email">

				<h2 class="title">비밀번호 재설정</h2>

				<table>
					<tr>
						<div class="input-field">
							<i class="fas fa-lock"></i>
							<input id="pw" type="password" placeholder="비밀번호를 입력해주세요." title="n" required="required" name="member_pw" onkeyup="pwReg()">
						</div>
					</tr>
				</table>
				<table>
					<tr>
						<td id="reg" style="font-size:10px; text-align: start"></td>
					</tr>
				</table>
				<table>
					<tr>
						<div class="input-field">
							<i class="fas fa-lock"></i> 
							<input type="password" id="pwchk" title="n" placeholder="다시 한번 입력해주세요." required="required" onkeyup="chkPW()">
						</div>
					</tr>
				</table>
				<table>
					<tr>
						<td id="same" style="font-size:10px; text-align: start"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td>
							<input type="submit" value="비밀번호 재설정" class="btn solid g-recaptcha">
						</td>
						<td>
							<input type="button" value="메인으로" class="btn solid g-recaptcha" onclick="../../index.jsp">
						</td>
					</tr>
				</table>
			</form>

			</div>
			<div class="panels-container">
				<div class="panel left-panel">
					<div class="content">
						<h3>비밀번호를 잃어버리셨나요?</h3>
						<p>회원님의 비밀번호는 관리자도 알수 없으니 안심하시고 재설정하세요!</p>
					</div>
					<img src="../../images/login/idSearchForm.svg" class="image" alt="">
				</div>

			</div>
		</div>
	</div>
	

</body>
</html>