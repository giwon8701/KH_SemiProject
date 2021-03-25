<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		if(${dto.member_id} != null || ${dto.member_id} != ""){
			$("#id").prop("value", ${dto.member_id});
		}
		
		if(${dto.member_name} != null || ${dto.member_id} != ""){
			$("#name").prop("value", ${dto.member_name});
		}
		
		if(${dto.member_email} != null || ${dto.member_id} != ""){
			$("#email").prop("value", ${dto.member_email});
			$("#email").prop("readonly", "readonly");
		}
		
		if(${dto.member_birthday} != null || ${dto.member_id} != ""){
			$("#birth").prop("value", ${dto.member_birthday});
		}
		
		if(${dto.member_phone} != null || ${dto.member_id} != ""){
			$("#phone").prop("value", {dto.member_phone});
		}
	});
</script>
<body>

	<h1>우리동네 운동친구</h1>
	<h2>추가 정보 입력</h2>

	<form action="regist.do" method="post">
	<input type="hidden" name="command" value="registres">
		<table>
			<c:choose>
				<c:when test="${dto.member_gender eq 'U' }">
					<tr align="center">
						<td>
							<label for="f">여</label><br>
							<input type="radio" id="f" name="memberGender" value="F" >
						</td>
						<td>
							<label for="m">남</label><br>
							<input type="radio" id="m" name="memberGender" value="M">
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="memberGender" value="${dto.member_gender }"/>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="2">
					<label for="id">아이디</label><br>
					<input type="text" id="id" name="memberId" title="n" placeholder="아이디입력" required="required" onchange="idCheck()">
				</td>
			</tr>
			<tr>
				<td id="idchk" style="font-size:10px; text-align: start"></td>
			</tr>
			<tr>
				<td colspan="2">
					<label for="pw">비밀번호</label><br>
					<input type="password" id="pw" name="memberPw" placeholder="비밀번호" required="required" onchange="chkPW()">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="password" id="pwchk" name="memberPwChk" title="n" placeholder="비밀번호 확인" required="required" onchange="chkPW()">
				</td>
			</tr>
			<tr>
				<td id="same" style="font-size:10px; text-align: start"></td>
			</tr>
			<tr>
				<td>
					<input type="text" id="addr" name="memberAddr" placeholder="주소를 입력해주세요" readonly="readonly" required="required" onclick="addrCheck()">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" id="name" name="memberName" placeholder="이름" required="required">
				</td>
			</tr>
			<tr>
				<td>
					<input type="date" id="birth" name="memberBirthday" required="required">
				</td>
			</tr>
			<tr>
				<td>
					<input type="tel" id="phone" name="memberPhone" title="n" placeholder="전화번호" onchange="phoneChk()">
				</td>
			</tr>
			<tr>
				<td id="phonechk" style="font-size:10px; text-align: start"></td>
			</tr>
			<tr>
				<td colspan="2">
					<label for="email">이메일</label><br>
					<input type="text" id="email" name="memberEmail" title="n" placeholder="이메일" required="required"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
	

	<%@include file="../common/footer.jsp" %>

</body>
</html>