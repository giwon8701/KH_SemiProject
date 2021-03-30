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
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>
<script type="text/javascript">
	
	function chkPW() {
	    if ($("#pw").val() != '' && $("#pwchk").val() != '') {
	        if ($("#pw").val() == $("#pwchk").val()) {
	        	$("#same").text("비밀번호가 일치합니다");
	        	$("#same").css("color", "blue");
	        	$("#pwchk").prop("title", "y");
	        	$("#pw").css("background-color", "skyblue");
	        	$("#pwchk").css("background-color", "skyblue");
	          
	        } else {
	        	$("#same").text("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
	            $("#same").css("color", "red");
	            $("#pw").css("background-color", "red");
	            $("#pwchk").css("background-color", "red");
	            $("#pwchk").prop("title", "n");
	        }
	    }
	}
	
	function idCheck(){
		var newId = $("#id").val();
		if($.trim(newId) == "" || $.trim(newId) == null){
			$("#idchk").text("아이디를 입력해주세요").css("color","red");
		} else{
			var queryString = "?command=idCheck&memberId="+newId;
			$.ajax({
				url: "../../regist.do"+queryString,
				dataType: "text",
				success: function(data){
					if(data == 0){
						$("#idchk").text("사용가능한 아이디입니다.");
			            $("#idchk").css("color", "blue");
			            $("#id").prop("title", "y");
			            $("#id").css("background-color", "skyblue");
					} else if(data == 1) {
						$("#idchk").text("이미 사용중인 아이디입니다.");
			            $("#idchk").css("color", "red");
			            $("#id").css("background-color", "red");
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
	
	function emailChk(){
		var newEmail = $("#email").val();
		if($.trim(newEmail) == "" || $.trim(newEmail) == null){
			$("#emailchk").text("이메일을 입력해주세요").css("color", "red");
		} else{
			var queryString = "?command=emailCheck&memberEmail="+newEmail;
			$.ajax({
				url: "../../regist.do"+queryString,
				dataType: "text",
				success: function(data){
					if(data == 0){
						$("#emailchk").text("등록 가능한 이메일입니다.");
			            $("#emailchk").css("color", "blue");
			            $("#email").prop("title", "y");
			            $("#email").css("background-color", "skyblue");
			            
					} else if(data == 1) {
						$("#emailchk").text("이미 사용중인 이메일입니다.");
			            $("#emailchk").css("color", "red");
			            $("#email").prop("title", "n");
			            $("#email").focus();
			            $("#email").css("background-color", "red");
					}
				},
				error: function(){
					$("#emailchk").text("통신오류");
		            $("#emailchk").css("color", "blue");
				}
			});
		}
	}
	
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
	
	/*function onSubmit(){
		$(".g-recaptcha").css("display","none");
		$("#submitbtn").css("display","");
	}*/
	
	function onSubmit(){
		if($("#id").prop("title") == "y" && $("#phone").prop("title") == "y" && $("#email").prop("title") == "y" && $("#pwchk").prop("title") == "y"){
			$("#registform").submit();
		} else{
			alert("입력하신 정보를 다시 확인해주세요.");
		}
	}
	
	

</script>
</head>
<body>

<!-- 회원가입 페이지 -->

	<h1>우리동네 운동친구</h1>
	<h2>회원가입</h2>

	<form action="../../regist.do" method="post" id="registform">
	<input type="hidden" name="command" value="registres">
		<table>
			<tr align="center">
				<td>
					<label for="f">여</label><br>
					<input type="radio" id="f" name="memberGender" value="F" checked="checked">
				</td>
				<td>
					<label for="m">남</label><br>
					<input type="radio" id="m" name="memberGender" value="M" >
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
					<label for="birth">생년월일</label><br>
					<select name="year" id="birth" required="required">
						<c:forEach var="i" begin="1910" end="2021" step="1">
							<option value="${i }"><c:out value="${i }"></c:out></option>
						</c:forEach>
					</select>년
					<select name="mm" id="birth" required="required">
						<c:forEach var="i" begin="01" end="12" step="1">
							<option value="${i }"><c:out value="${i }"></c:out></option>
						</c:forEach>
					</select>월
					<select name="dd" id="birth" required="required">
						<c:forEach var="i" begin="01" end="31" step="1">
							<option value="${i }"><c:out value="${i }"></c:out></option>
						</c:forEach>
					</select>일
				</td>
			</tr>
			<tr>
				<td>
					<label for="phone">전화번호</label><br>
					<input type="tel" id="phone" name="memberPhone" title="n" placeholder="전화번호" onchange="phoneChk()" required="required">
				</td>
			</tr>
			<tr>
				<td id="phonechk" style="font-size:10px; text-align: start"></td>
			</tr>
			<tr>
				<td colspan="2">
					<label for="email">이메일</label><br>
					<input type="text" id="email" name="memberEmail" title="n" placeholder="이메일" required="required" onchange="emailChk()"></td>
			</tr>
			<tr>
				<td id="emailchk" style="font-size:10px; text-align: start"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="g-recaptcha" 
        					data-sitekey="6LdY0Y0aAAAAAC55f1G3fyahKgyATLdZ1BZq_yt5" 
        					data-callback='onSubmit' 
        					data-action='submit'>회원가입</button>
				</td>
			</tr>
			
			
		</table>
	</form>

	<%@include file="../common/footer.jsp" %>

</body>
</html>