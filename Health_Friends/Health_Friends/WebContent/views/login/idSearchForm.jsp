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

	<form action="../../regist.do" method="post">
		<input type="hidden" name="command" value="idSearchRes">
		<table>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" required="required" name="member_name" >
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" required="required" name="member_email">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="아이디 찾기">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>