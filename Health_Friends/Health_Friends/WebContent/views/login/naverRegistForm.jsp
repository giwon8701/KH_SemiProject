<%@page import="com.login.dto.RegistDto"%>
<%@page import="com.mypage.common.Util" %>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	function addrCheck(){
		//open("regist.do?command=addrcheck", "", "width=200, height=200");
		
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

	$(function(){
		$.ajax({
						
		});
	});
</script>
<body>

<%
	RegistDto dto = (RegistDto)request.getAttribute("dto");
	String birthday = dto.getMember_birthday();
	
	int mm = Integer.parseInt(Util.getMm(birthday));
	int dd = Integer.parseInt(Util.getDd(birthday));
%>

	<h1>우리동네 운동친구</h1>
	<h2>추가 정보 입력</h2>

	<form action="../../regist.do" method="post">
	<input type="hidden" name="command" value="naverregistres">
		<table>
			<tr align="center">
				<td>
					<label for="f">여</label><br>
					<input type="radio" id="f" name="memberGender" value="F" <%=(dto.getMember_gender().equals("F"))?"checked":"" %>>
				</td>
				<td>
					<label for="m">남</label><br>
					<input type="radio" id="m" name="memberGender" value="M" <%=(dto.getMember_gender().equals("M"))?"checked":"" %>>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<label for="id">아이디</label><br>
					<input type="text" id="id" name="memberId" title="n" value="${dto.member_id }" readonly="readonly" required="required" onchange="idCheck()">
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
					<label for="addr">주소</label><br>
					<input type="text" id="addr" name="memberAddr" placeholder="주소를 입력해주세요" readonly="readonly" required="required" onclick="addrCheck()">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<label for="name">이름</label><br>
					<input type="text" id="name" name="memberName" value="${dto.member_name }" readonly="readonly" required="required">
				</td>
			</tr>
			<tr>
				<td>
					<label for="birth">생년월일</label><br>
					<select name="year" id="birth" required="required" >
						<%
							for(int i = 1910; i < 2022; i++){
						%>
							<option value="<%=i %>" ><%=i %></option>
						<%								
							}
						%>
					</select>년
					<select name="mm" id="birth" required="required">
						<%
							for(int i = 1; i < 13; i++){
						%>
							<option value="<%=i %>" <%=(mm == i)?"selected":"" %>><%=i %></option>
						<%								
							}
						%>
					</select>월
					<select name="dd" id="birth" required="required">
						<%
							for(int i = 1; i < 32; i++){
						%>
							<option value="<%=i %>" <%=(dd == i)?"selected":"" %>><%=i %></option>
						<%								
							}
						%>
					</select>일
				</td>
			</tr>
			<tr>
				<td>
					<label for="phone">전화번호</label><br>
					<input type="tel" id="phone" name="memberPhone" title="n" value="${dto.member_phone }" readonly="readonly" onchange="phoneChk()">
				</td>
			</tr>
			<tr>
				<td id="phonechk" style="font-size:10px; text-align: start"></td>
			</tr>
			<tr>
				<td colspan="2">
					<label for="email">이메일</label><br>
					<input type="text" id="email" name="memberEmail" title="n" value="${dto.member_email }" readonly="readonly" required="required"></td>
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