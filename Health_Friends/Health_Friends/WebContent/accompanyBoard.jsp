<%@page import="com.hf.dto.RegisterDto"%>
<%@page import="java.util.List"%>
<%@page import="com.hf.dto.CalDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.boardlist{
	position: relative;
	padding: 5em 0;
}
#accompanyBoard_list{
	position: relative;
	padding: 2em 0;
}
</style>
</head>
<body>

	<%@include file="header.jsp" %>
<%--게시판목록 --%>	
	<section class="boardlist">
		<a href="">동행 구해요</a>
		<a href="">후기</a>
		<a href="">공지사항</a>
	</section>
	<br/>
	
	<a href="">글작성</a>
	
<%--게시글리스트 --%>
	<section id="accompanyBoard_list">
		<table border="1">
<% 
		List<RegisterDto> list = (List<RegisterDto>) request.getAttribute("list");
	
//			for (RegisterDto dto : list){
%>
			<tr>
				<td>값이 없어 오류나는 것 같아</td>
				<td>임시 주적 넣어둠</td>
			</tr>
<% 
//			}
%>
		</table>
	</section>
	<%@include file="footer.jsp" %>  

</body>
</html>