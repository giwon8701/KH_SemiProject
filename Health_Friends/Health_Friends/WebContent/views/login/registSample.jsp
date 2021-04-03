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
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>
<script type="text/javascript" src="../../assets/js/loginRegist.js"></script>
</head>
<body>

<!-- 회원가입 페이지 -->

	<h1>우리동네 운동친구</h1>
	<h2>회원가입</h2>

	
		<c:choose>
			<c:when test="${empty dto}">
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
									<c:choose>
										<c:when test="${i eq 1980}">
											<option value="${i }" selected="selected"><c:out value="${i }"></c:out></option>
										</c:when>
										<c:otherwise>
											<option value="${i }"><c:out value="${i }"></c:out></option>
										</c:otherwise>
									</c:choose>
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
			</c:when>
			<c:otherwise>
				<%
					RegistDto dto = (RegistDto)request.getAttribute("dto");
					String birthday = dto.getMember_birthday();
					
					int mm = Integer.parseInt(Util.getMm(birthday));
					int dd = Integer.parseInt(Util.getDd(birthday));
				%>
				<form action="regist.do" method="post" id="registform">
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
							<input type="text" id="id" name="memberId" title=<%=(dto.getMember_id() != null)?"y":"n" %> value="${dto.member_id }" <%=(dto.getMember_id() != null)?"readonly":"" %> required="required" onchange="idCheck()">
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
							<input type="text" id="name" name="memberName" value="${dto.member_name }" <%=(dto.getMember_name() != null)?"readonly":"" %> required="required">
						</td>
					</tr>
					<tr>
						<td>
							<label for="birth">생년월일</label><br>
							<select name="year" id="birth" required="required" >
								<%
									for(int i = 1910; i < 2022; i++){
								%>
									<option value="<%=i %>" <%=(i == 1980)?"selected":"" %>><%=i %></option>
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
							<input type="tel" id="phone" name="memberPhone" title=<%=(dto.getMember_phone() != null)?"y":"n" %> value="${dto.member_phone }" <%=(dto.getMember_phone() != null)?"readonly":"" %> onchange="phoneChk()">
						</td>
					</tr>
					<tr>
						<td id="phonechk" style="font-size:10px; text-align: start"></td>
					</tr>
					<tr>
						<td colspan="2">
							<label for="email">이메일</label><br>
							<input type="text" id="email" name="memberEmail" title="y" value="${dto.member_email }" readonly="readonly" required="required"></td>
					</tr>
					<tr>
						<td colspan="2">
							<button class="g-recaptcha" 
		        					data-sitekey="6LdY0Y0aAAAAAC55f1G3fyahKgyATLdZ1BZq_yt5" 
		        					data-callback='onSubmit' 
		        					data-action='submit'>회원가입</button>
		        			<input type="button" value="취소" onclick="location.href='regist.do?command=login'">
						</td>
					</tr>
				</table>
			</form>
			</c:otherwise>
		</c:choose>
	

	<%@include file="../common/footer.jsp" %>

</body>
</html>