<%@page import="com.login.dto.RegistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script src="/Health_Friends/assets/api/se2/js/HuskyEZCreator.js" type="text/javascript"></script>
<script src="/Health_Friends/assets/api/se2/init.js" type="text/javascript"></script>
<style type="text/css">
	table{
		width: 580px;
	}
	tr > th{
		text-align: left;
	}
</style>
</head>
<body>
<%--  
	<%@include file="../../views/common/header.jsp" %>
--%>	

	<section class="boardlist">
		<a href="../../board.do?command=list">동행 구해요</a>
		<a href="../../review.do?command=list">사진후기</a>
		<a href="../../notice.do?command=list">공지사항</a>
	</section>
	
	<section id="noticeBoard_post">
		<form action="../../notice.do" method="post">
			<input type="hidden" name="command" value="insertres"/>
			<table border="1">
				<tr>
					<th colspan="2">
						공지사항
					</th>
				</tr>
				<tr>
					<td colspan="3">
						<input type="text" name="postTitle" placeholder="제목을 적어주세요"/>
					</td>
				</tr>
				<tr>	
				
				</tr>
				<tr>
					<td colspan="3">
						<textarea id="summernote" name="postContent"  ></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" value="등록">
			<input type="button" value="취소" onclick="location.href='../../notice.do?command=list'" />
		</form>
	</section>
<%---	
	<%@include file="../../views/common/footer.jsp" %>
--%>

</body>
</html>



