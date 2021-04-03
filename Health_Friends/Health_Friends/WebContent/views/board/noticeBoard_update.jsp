<%@page import="com.login.dto.RegistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--  
	<%@include file="../../views/common/header.jsp" %>
--%>

<% RegistDto Ldto = (RegistDto)session.getAttribute("Ldto"); %>

	<section class="boardlist">
		<a href="./board.do?command=list">동행 구해요</a>
		<a href="./review.do?command=list">사진후기</a>
		<a href="./notice.do?command=list">공지사항</a>
	</section>
	<form action="notice.do" method="post">
		<input type="hidden" name="command" value="updateres"/>
			<input type="hidden" name="postId" value=${dto.postId } />
			<input type="hidden" name="postUserNo" value=${Ldto.member_no } />
		<table border="1">
				<tr>
					<th colspan="3">
						<input type="text" name="postTitle" value="${dto.postTitle }"/>
					</th>		
				</tr>
				<tr>
					<td colspan="2">${Ldto.member_id }</td>
					<td>${dto.postRegdate } </td>
				</tr>
				<tr>
					<td colspan="3">
						<textarea name="postContent">${dto.postContent }</textarea>
					</td>
				</tr>
				<tr>
					<td>	
						<input type="submit" value="확인"/>
						<input type="button" value="취소" onclick="location.href='notice.do?command=list'"/>
					</td>
				</tr>
		</table>
	</form>
	
<%---	
	<%@include file="../../views/common/footer.jsp" %>
--%>
</body>
</html>