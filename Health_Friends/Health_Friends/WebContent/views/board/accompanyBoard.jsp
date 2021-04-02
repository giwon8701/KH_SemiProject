<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@page import="com.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
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
<body>
<%--
	<%@include file="header.jsp" %>
 --%>
 
<%--게시판목록 --%>	
	<section class="boardlist">
		<a href="./board.do?command=list">동행 구해요</a>
		<a href="photoReviewBoard.jsp">사진후기</a>
		<a href="./notice.do?command=list">공지사항</a>
	</section>
	<br/>
	<input type="button" value="글작성" onclick="location.href='../../board.do?command=insert'" />
	
<%--게시글리스트 --%>
	<section id="Board_list">
		<table border="1">
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.postTitle}</td>
					<td>${dto.postContent}</td>
				</tr>
			</c:forEach>
		</table>
	</section>

<%--
	<%@include file="footer.jsp" %>
 --%>  

</body>
</html>















