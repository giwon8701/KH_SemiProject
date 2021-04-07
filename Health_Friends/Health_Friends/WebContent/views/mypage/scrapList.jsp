<%@page import="com.login.biz.RegistBizImpl"%>
<%@page import="com.login.biz.RegistBiz"%>
<%@page import="com.common.Paging"%>
<%@page import="com.login.dto.RegistDto"%>
<%@page import="com.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.board.biz.BoardBizImpl"%>
<%@page import="com.board.biz.BoardBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 운동친구 Health Friends</title>
<%
	RegistDto Ldto = (RegistDto)session.getAttribute("Ldto"); 
	
%>

</head>

<body>
<%--
	<%@include file="../../views/common/header.jsp" %>
 --%>
	<section class="boardlist">
		<a href="./board.do?command=list">동행 구해요</a>
		<a href="./review.do?command=list">사진후기</a>
		<a href="./notice.do?command=list">공지사항</a>
	</section>
	
	<h2>찜한 게시글</h2>
	
	<table border="1">
			<tr>
				<th>카테고리</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="3">----------찜한 게시글이 없습니다------------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<c:if test="${dto.postDelflag eq 'N'}">
						<tr>
							<td>${dto.postBoardName }</td>
							<td><a href="./board.do?command=scrapSelect&postid=${dto.postId }">${dto.postTitle }</a></td>
							<td>${dto.postRegdate }</td>
						</tr>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
	</table>
	
<%---	
	<%@include file="../../views/common/footer.jsp" %>
--%>
</body>
</html>










