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
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	<% RegistDto Ldto = (RegistDto)session.getAttribute("dto"); %>

	<h1>회원 정보 수정</h1>

	<form action="../../mypage.do" method="post">
		<input type="hidden" name="command" value="registUpdateRes">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" readonly="readonly" name="member_id" id="id" value="${Ldto.member_id }"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" readonly="readonly" name="member_name" id="name" value="${Ldto.member_name }"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="button" id="pwReset" value="재설정">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="addr" name="member_addr" required="required" value="${Ldto.member_addr }" onclick="addrCheck()"></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><%=Ldto.getMember_birthday().substring(0,4) %>년 <%=Ldto.getMember_birthday().substring(4,6) %>월 <%=Ldto.getMember_birthday().substring(6) %>일</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" id="email" name="member_email" value="${Ldto.member_email }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="tel" id="phone" name="member_phone" required="required" title="y" value="${Ldto.member_phone }" onchange="phoneChk()"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="회원정보 수정">
					<input type="button" value="회원 탈퇴" onclick="del()">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>