<%@page import="com.mypage.dto.IndividualDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--캘린더 게시판 해당날짜 리스트 --%>

<%
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int date = Integer.parseInt(request.getParameter("date"));
	
	IndividualDto dto = new IndividualDto();
	
%>

	<jsp:useBean id="util" class="com.mypage.common.Util"></jsp:useBean>

	<h1>약속 일정</h1>
	
	<form action="individual.do" method="post">
		<input type="hidden" name="command" value="individualMuldel">
		<table border="1">
			<tr>
				<th><input type="checkbox" name="all" onclick="allCheck(this.checked);"></th>
				<th>번호</th>
				<th>제목</th>
				<th>일정</th>
				<th>작성일</th>
			</tr>
			

			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<th colspan="5">----------일정이 없습니다----------</th>
					</tr>
				</c:when>
				
				<c:otherwise>
					<c:forEach items="${list}" var="dto">
					
						<tr>
							<th><input type="checkbox" name="chk" value="${dto.individual_no }"></th>
							<td>${dto.individual_no }</td>
							<td><a href="individual.do?command=individualSelectOne&individual_no=${dto.individual_no }&year=<%=year %>&month=<%=month %>&date=<%=date %>">${dto.individual_title }</a></td>
							<td>
								<jsp:setProperty property="todates" name="util" value="${dto.individual_mdate }" />
								<jsp:getProperty property="todates" name="util" />
							</td>
							<td>
								<fmt:formatDate value="${dto.individual_regdate }" pattern="yyyy.MM.dd" />
							</td>
						</tr>

					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="5" align="right">
					<input type="button" value="작성" onclick="location.href='individualInsert.jsp?insert.jsp?year=<%=year %>&month=<%=month %>&date=<%=date %>'">
					<input type="submit" value="삭제">
					<input type="button" value="마이페이지" onclick="location.href='mypage.jsp'">
				</td>
			</tr>
		</table>
	</form>



<%@ include file="../common/footer.jsp" %>
</body>
</html>