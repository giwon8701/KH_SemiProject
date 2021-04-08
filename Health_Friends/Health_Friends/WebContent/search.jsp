<%@page import="com.login.dto.RegistDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 운동친구∴∵Heath Friends</title>
<style type="text/css">
	.profile-img{
		width: 100px;
		height: 100px;
		border-radius: 50%;
	}
</style>
</head>
<%
	List<RegistDto> list = (List<RegistDto>) request.getAttribute("list");
%>
<body>

<table>
	<tr>
		<th>회원번호</th>
		<th>프로필사진</th>
		<th>ID</th>
		<th>이름</th>
		<th>이메일</th>
		<th>회원등급</th>
	</tr>
	<% 
		for(int i = 0; i < list.size(); i++){ 
	%>
	<tr id="profile" style="border:1px soild black;">
		<td align="center"><%=list.get(i).getMember_no() %></td>
		<td align="center">
	<%
		if(list.get(i).getMember_picture_path() == null){ 
	%>
		<img src="images/icon/nonprofile.png" class="profile-img">
	<%
		}else{ 
	%>
		<img src="profileimg/<%=list.get(i).getMember_picture_path()%>" class="profile-img"/>
	<%
		}
	%>
		</td>
	            <c:choose>
					<c:when test="${Ldto.getMember_id() == null}">
						<td align="center"><%=list.get(i).getMember_id() %></a></td>
					</c:when>
					<c:otherwise>
						<td align="center"><a href="follow.do?command=profile&member_id=<%=list.get(i).getMember_id()%>"><%=list.get(i).getMember_id() %></a></td>
					</c:otherwise>
				</c:choose>
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