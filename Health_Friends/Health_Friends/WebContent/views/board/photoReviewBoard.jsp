<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.boardlist{
}
img{
	width: 200px;
	height: 200px;
}
</style>
</head>
<body>
<%--
	<%@include file="header.jsp" %>
--%>	

	<section class="boardlist">
		<a href="./board.do?command=list">동행 구해요</a>
		<a href="./review.do?command=list">후기</a>
		<a href="./notice.do?command=list">공지사항</a>
	</section>
	<br/>
	<input type="button" value="글작성" onclick="location.href='review.do?command=insert'" />	
	
	<h2>사진후기</h2>
	
	<section id="photoReviewBoard_list">
		<table border="1">
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td>------------작성된 글이 없습니다-----------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td><img src=""></td>
							<td>${dto.postNo}</td>
							<td>${dto.postTitle}</td>
							<td>${dto.postContent}</td>
							<td>${dto.postRegdate}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</section>
	
	
<%--	
	<%@include file="footer.jsp" %>
--%>		
</body>
</html>