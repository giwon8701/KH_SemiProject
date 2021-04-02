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
	<form action="notice.do" method="post">
		<input type="hidden" name="command" value="updateres"/>
		<c:forEach items="dto">
			<input type="hidden" name="postId" value=${dto.postId } />
			<input type="hidden" name="postUserNo" value=${dto.postUserNo } />
		<table border="1">
				<tr>
					<th colspan="3">
						<input type="text" name="title" value="${dto.postTitle }"/>
					</th>		
				</tr>
				<tr>
					<td colspan="2">회원id넣어야함</td>
					<td>${dto.postRegdate } </td>
				</tr>
				<tr>
					<td colspan="3">
						<textarea name="content">${dto.postContent }</textarea>
					</td>
				</tr>
				<tr>
					<td>	
						<input type="submit" value="확인"/>
						<input type="button" value="취소" onclick="location.href='notice.do?command=list'"/>
					</td>
				</tr>
		</table>
		</c:forEach>
	</form>
</body>
</html>