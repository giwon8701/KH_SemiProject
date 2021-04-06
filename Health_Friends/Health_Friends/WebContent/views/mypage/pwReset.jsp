<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/login.css">
<script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	console.log("test");
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
	
	function pwReset(){
		var member_id = $("#id").val();
		var member_pw = $("#pw").val();
		var queryString = "?command=pwResetRes&member_id=" + member_id + "&member_pw=" + member_pw;
		if(member_pw == null || member_pw == ""){
			$("#same").text("비밀번호를 입력해주세요.").css("color", "red");
			$("#pw").focus();
		} else if($("#pwchk").prop("title") == "n"){
			$("#same").text("비밀번호가 일치하지 않습니다. 다시 확인해주세요.").css("color","red");
			$("#pwchk").focus();
		} else if($("#pw").prop("title") == "n"){
			$("#reg").text("8~16자의 영문자,숫자,특수문자의 조합으로 입력해주세요").css("color" ,"red");
			$("#pw").focus();
		} else if($("#pw").prop("title") == "y" && $("#pwchk").prop("title") == "y") {
			$.ajax({
				url: "mypage.do",
				data : {
					"command" : "pwResetRes",
					"member_id" : member_id,
					"member_pw" : member_pw
				},
				dataType: "json",
				success: function(data){
					if(data > 0){
						alert("비밀번호를 수정하였습니다.");
						self.close();
					}
				},
				error: function(data){
					alert("통신오류");
				}
			});
		}
	}
	
	
	
</script>
</head>
<body>
	<h1 align="center">비밀번호 변경(재설정)</h1>
		<input type="hidden" id="id" name="member_id" value="${member_id}">
		<table style="">
			<tr>
				<div class="input-field">
					<i class="fas fa-lock"></i>
					<input id="pw" type="password" placeholder="8~16자의 영문자,숫자,특수문자" title="n" required="required" name="member_pw" onkeyup="pwReg()">
				</div>
			</tr>
			<tr>
				<td><td id="reg" style="font-size:10px; text-align: start" ></td>
			</tr>
			<tr>
				<div class="input-field">
					<i class="fas fa-lock"></i>
					<input type="password" id="pwchk" title="n" placeholder="다시 한번 입력해주세요." required="required" onkeyup="chkPW()">
				</div>
			</tr>
			<tr>
				<td id="same" style="font-size:10px; text-align: start"></td>
			</tr>
			<tr>
				<td>
					<input type="button" value="확인" class="btn solid g-recaptcha" onclick="pwReset()">
					<input type="button" value="취소" class="btn solid g-recaptcha" onclick="self.close()">
				</td>
			</tr>
		</table>
</body>
</html>