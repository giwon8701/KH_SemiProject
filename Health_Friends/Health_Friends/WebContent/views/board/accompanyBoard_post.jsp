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

		<%--동행게시판 --%>

<%--
	<%@include file="header.jsp" %>
 --%>	
 	<section class="boardlist">
		<a href="">동행 구해요</a>
		<a href="">후기</a>
		<a href="">공지사항</a>
	</section>
 
	<section id="Board_writePost">
		<form action="" method="post">
			<input type="hidden" name="command" value="Board_wirteRes"/>
			<table border="1">
				<tr>
					<th colspan="3">동행구해요</th>
				</tr>
				<tr>
					<td colspan="3">
						<input type="text" placeholder="게시글 제목을 적어주세요"/>
					</td>
				</tr>
				<tr>
					<td>
						운동종류	<br/>
						<a href="">클릭!</a>
					</td>
					<td>
						운동경로	<br/>
						<a href="">클릭!</a>
					</td>
					<td>
						약속시간	<br/>
						<a href="">클릭!</a>
					</td>
				</tr>
				<tr>
					<td colspan="3" id="Board_writeContent">
						<input type="text" placeholder="오늘은 어떤 운동을 하고싶으신가요? 게시글 내용을 적어주세요"/>
					</td>
				</tr>
			</table>
		</form>
	</section>
<%--	
	<%@include file="footer.jsp" %>
--%>
</body>
</html>















