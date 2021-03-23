<%@page import="com.hf.dto.RegisterDto"%>
<%@page import="java.util.List"%>
<%@page import="com.hf.dto.IndividualDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	List<RegisterDto> list = (List<RegisterDto>) request.getAttribute("list");
%>
	<table border="1">
		<tr>
			<th><a href="">동행 구해요</a></th>
			<th><a href="">후기</a></th>
			<th><a href="">공지사항</a></th>
		</tr>
		<tr>
			<td>게시글 쓰기</td>
		</tr>
<%
	for (RegisterDto dto : list){
%>
		<tr>
			<td>게시글</td>
		</tr>
<% 
	}
%>
	</table>

</body>
</html>