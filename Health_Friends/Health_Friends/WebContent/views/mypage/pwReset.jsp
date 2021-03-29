<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

	function chkPW() {
	    if ($("#pw").val() != '' && $("#pwchk").val() != '') {
	        if ($("#pw").val() == $("#pwchk").val()) {
	        	$("#same").text("비밀번호가 일치합니다");
	        	$("#same").css("color", "blue");
	        	$("#pwchk").prop("title", "y");
	          
	        } else {
	        	$("#same").text("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
	            $("#same").css("color", "red");
	            $("#pwchk").prop("title", "n");
	        }
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
			$("#pw").focus();
		} else {
			$.ajax({
				url: "../../mypage.do"+queryString,
				
				dataType: "text",
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

	<h1>비밀번호 재설정</h1>
		<input type="hidden" id="id" name="member_id" value="${member_id}">
		<table>
			<tr>
				<td>
					<label for="pw"><b>비밀번호 재설정</b></label><br>
					<input id="pw" type="password" placeholder="비밀번호를 입력해주세요." required="required" name="member_pw" onchange="chkPW()">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" id="pwchk" title="n" placeholder="다시 한번 입력해주세요." required="required" onchange="chkPW()">
				</td>
			</tr>
			<tr>
				<td id="same" style="font-size:10px; text-align: start"></td>
			</tr>
			<tr>
				<td>
					<input type="button" value="확인" onclick="pwReset()">
					<input type="button" value="취소" onclick="self.close()">
				</td>
			</tr>
		</table>
	
</body>
</html>