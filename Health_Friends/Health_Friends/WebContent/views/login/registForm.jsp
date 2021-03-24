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
	
	function idCheck(){
		var newId = $("#id").val();
		var queryString = "?command=idCheck&memberId="+newId;
		$.ajax({
			url: "regist.do"+queryString,
			dataType: "text",
			success: function(data){
				if(data == 0){
					$("#idchk").text("사용가능한 아이디입니다.");
		            $("#idchk").css("color", "blue");
		            $("#id").prop("title", "y");
				} else if(data == 1) {
					$("#idchk").text("이미 사용중인 아이디입니다.");
		            $("#idchk").css("color", "red");
		            $("#id").prop("title", "n");
		            $("#id").focus();
				}
			},
			error: function(){
				$("#idchk").text("통신오류");
	            $("#idchk").css("color", "blue");
			}
		});
	}
	
	function phoneChk(){
		var newPhone = $("#phone").val();
		var queryString = "?command=phoneCheck&memberPhone="+newPhone;
		$.ajax({
			url: "regist.do"+queryString,
			dataType: "text",
			success: function(data){
				if(data == 0){
					$("#phonechk").text("등록 가능한 번호입니다.");
		            $("#phonechk").css("color", "blue");
		            $("#phone").prop("title", "y");
		            
				} else if(data == 1) {
					$("#phonechk").text("이미 사용중인 번호입니다.");
		            $("#phonechk").css("color", "red");
		            $("#phone").prop("title", "n");
		            $("#phone").focus();
				}
			},
			error: function(){
				$("#phonechk").text("통신오류");
	            $("#phonechk").css("color", "blue");
			}
		});
	}
	
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
	
	
	

</script>
</head>
<body>

<!-- 회원가입 페이지 -->


	<h1>우리동네 운동친구</h1>
	<h2>회원가입</h2>

	<form action="regist.do" method="post">
	<input type="hidden" name="command" value="registres">
		<table>
			<tr align="center">
				<td>
					<label for="f">여</label><br>
					<input type="radio" id="f" name="memberGender" value="F">
				</td>
				<td>
					<label for="m">남</label><br>
					<input type="radio" id="m" name="memberGender" value="M">
				</td>
			</tr>
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
					<input type="password" id="pw" name="memberPw" placeholder="비밀번호(숫자,영문,특수문자 조합 최소8자)" required="required" onchange="chkPW()">
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