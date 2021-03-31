<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<%---
	<%@include file="header.jsp" %>
 --%>	
	<section class="boardlist">
		<a href="accompanyBoard.jsp">동행 구해요</a>
		<a href="photoReviewBoard.jsp">후기</a>
		<a href="noticeBoard.jsp">공지사항</a>/a>
	</section>
	
	<h2>고객센터</h2>
	
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>닉네임</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	
	</table>
	 
<%---	
	<%@include file="footer.jsp" %>
--%>
</body>
</html>