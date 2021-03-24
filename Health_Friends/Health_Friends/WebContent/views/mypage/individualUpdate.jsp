<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--캘린더 게시판 게시글 수정 --%>

<%
	int individual_no = Integer.parseInt(request.getParameter("individual_no"));
%>
	<jsp:useBean id="util" class="com.mypage.common.Util"></jsp:useBean>

	<h1>일정 수정 하기</h1>
	
	<form action="individual.do" method="post">
		<input type="hidden" name="command" value="individualUpdateres">
		<input type="hidden" name="individual_no" value="${dto.individual_no }">
		
		<table border="1">
			<tr>
				<th>ID</th>
				<td>kh</td>
			</tr>
			<tr>
				<th>일정</th>
				<td>
					<jsp:setProperty property="todates" name="util" value="${dto.individual_mdate }" />
					<jsp:getProperty property="todates" name="util" />
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="individual_title" value="${dto.individual_title }" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="individual_content">${dto.individual_content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="location.href='individual.do?command=update&seq=${dto.individual_no}'">
				</td>
			</tr>
		</table>
	</form>

<%@ include file="../common/footer.jsp" %>
</body>
</html>