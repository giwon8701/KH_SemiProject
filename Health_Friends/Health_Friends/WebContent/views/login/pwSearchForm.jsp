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
	          
	        } else {
	        	$("#same").text("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
	            $("#same").css("color", "red");
	            $("#pwchk").prop("title", "n");
	        }
	    }
	}
	
	$(function(){
		
		$("#pwReset").submit(function(e){
			if($("#pwchk").prop("title") == "y"){
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

	<h1>비밀번호 찾기</h1>
	
	<table id="pwSearch">
		<tr>
			<th>이름</th>
			<td>
				<input type="text" id="name" name="name" required="required">
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" id="id" name="id" required="required">
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" id="email" name="email" required="required">
			</td>
		</tr>
		<tr>
			<td id="chk" style="font-size:10px; text-align: start"></td>
		</tr>
		<tr>
			<td>
				<input type="button" onclick="pwSearch()" value="확인">
				<input type="button" onclick="history.back()" value="취소">
			</td>
		</tr>
	</table>
	
	
	<form action="../../regist.do" id="pwReset" style="display : none" method="post">
		<input type="hidden" name="command" value="pwReset">
		<input type="hidden" id="member_id" name="member_id">
		<input type="hidden" id="member_email" name="member_email">
		<table>
			<tr>
				<td>
					<label for="pw"><b>비밀번호 재설정</b></label><br>
					<input id="pw" type="password" placeholder="비밀번호를 입력해주세요." required="required" name="member_pw" onkeyup="chkPW()">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" id="pwchk" title="n" placeholder="다시 한번 입력해주세요." required="required" onkeyup="chkPW()">
				</td>
			</tr>
			<tr>
				<td id="same" style="font-size:10px; text-align: start"></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="확인">
					<input type="button" value="취소" onclick="history.back()">
				</td>
			</tr>
		</table>
	
	</form>
	
	

</body>
</html>