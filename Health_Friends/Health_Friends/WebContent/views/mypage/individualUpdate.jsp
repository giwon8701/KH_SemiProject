<%@page import="java.util.Calendar"%>
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
	Calendar cal = Calendar.getInstance();
	
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	
	if (paramYear != null) {
		year = Integer.parseInt(paramYear);
	}
	if (paramMonth != null) {
		month = Integer.parseInt(paramMonth);
	}
	
	if (month > 12) {
		month = 1;
		year++;
	}
	
	if (month < 1) {
		month = 12;
		year--;
	}
	
	cal.set(year, month - 1, 1);
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	

	int individual_no = Integer.parseInt(request.getParameter("individual_no"));
%>
	<jsp:useBean id="util" class="com.mypage.common.Util"></jsp:useBean>

	<h1>일정 수정 하기</h1>
	
	<form action="individual.do" method="post">
		<input type="hidden" name="command" value="individualUpdateres">
		<input type="hidden" name="individual_no" value="${dto.individual_no }">
		<input type="hidden" name="year" value="<%=year %>">
		<input type="hidden" name="month" value="<%=month %>">
		
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
					<input type="button" value="취소" onclick="location.href='../../individual.do?command=indivipdate&seq=${dto.individual_no}'">
				</td>
			</tr>
		</table>
	</form>

<%@ include file="../common/footer.jsp" %>
</body>
</html>