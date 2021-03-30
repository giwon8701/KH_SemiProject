<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>아이디 찾기</h1>
	
	<table>
		<tr>
			<td>
				<b>${dto.member_name }님의 아이디는</b>
			</td>
		</tr>
		<tr>
			<td>
				${dto.member_id }입니다.
			</td>
		</tr>
	</table>

</body>
</html>