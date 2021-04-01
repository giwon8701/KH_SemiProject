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
	<table border="1">
		<c:forEach items="dto">
			<tr>
				<th colspan="3">${dto.postTitle }</th>		
			</tr>
			<tr>
				<td>${dto.postId } </td>
				<td>${dto.postRegdate } </td>
			</tr>
			<tr>
				<td colspan="3">${dto.postContent }</td>
			</tr>
		
		</c:forEach>
	</table>

</body>
</html>