<%@page import="com.login.dto.RegistDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	List<RegistDto> list = (List<RegistDto>) request.getAttribute("list");
%>
<body>

<table>
	<tr>
		<th>회원번호</th>
		<th>프로필사진</th>
		<th>유저ID</th>
		<th>유저이름</th>
		<th>유저이메일</th>
		<th>회원등급</th>
	</tr>
	<% 
		for(int i = 0; i < list.size(); i++){ 
	%>
	<tr id="profile">
		<td align="center"><%=list.get(i).getMember_no() %></td>
		<td align="center">
	<%if(list.get(i).getMember_picture_path() == null){ %>
		대표 프로필 사진이<br> 존재하지 않습니다
	<%}else{ %>
		<img src="profileimg/<%=list.get(i).getMember_picture_path()%>"/>
	<%} %>
		</td>
		<td align="center"><%=list.get(i).getMember_id() %></td>
		<td align="center"><%=list.get(i).getMember_name() %></td>
		<td align="center"><%=list.get(i).getMember_email() %></td>
		<td align="center"><%=list.get(i).getMember_role() %></td>
	</tr>
	<%
		}
	%>
</table>


</body>
</html>