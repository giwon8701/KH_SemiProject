<%@page import="com.board.biz.IndividualBizImpl"%>
<%@page import="com.board.biz.IndividualBiz"%>
<%@page import="com.board.dto.IndividualDto"%>
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
<%--캘린더 게시판 하나선택하여 자세히보기 --%>
<%
	int individual_no = Integer.parseInt(request.getParameter("individual_no"));
	IndividualBiz biz = new IndividualBizImpl();
	IndividualDto dto = biz.individualSelectOne(individual_no);
%>
	<jsp:useBean id="util" class="com.board.common.Util"></jsp:useBean>
	
	<h1>일정 자세히 보기</h1>
	
		
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
				<td>${dto.individual_title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="content" readonly="readonly" >${dto.individual_content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="수정" onclick="location.href='individual.do?command=individualUpdate&individual_no=${dto.individual_no }'">
					<input type="button" value="삭제" onclick="location.href='individual.do?command=individualDelete&individual_no=${dto.individual_no }'">
					<input type="button" value="목록" onclick="location.href='mypage.jsp'">
				</td>
			</tr>
		</table>

</body>
</html>