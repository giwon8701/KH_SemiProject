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

</style>
</head>
<body>
<%---
	<%@include file="header.jsp" %>
 --%>	
 	<section class="boardlist">
		<a href="">동행 구해요</a>
		<a href="">후기</a>
		<a href="">공지사항</a>
	</section>
 	
	<section id="photoReview_writePost">
		<form action="" method="post">
			<input type="hidden" name="command" value=""/>
			<table border="1">
				<tr>
					<th colspan="3">사진후기</th>
				</tr>
				<tr>
					<td colspan="3">
						<input type="text" placeholder="게시글 제목을 적어주세요"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						사진올리기	<br/>
						<a href="">클릭!</a>
					</td>
				</tr>
				<tr>
					<td colspan="3" id="accompanyBoard_writeContent">
						<input type="text" placeholder="사진에 대한 설명과 운동후기를 적어주세요"/>
					</td>
				</tr>
			</table>
		</form>
	</section>
<%---	
	<%@include file="footer.jsp" %>
--%>
</body>
</html>















