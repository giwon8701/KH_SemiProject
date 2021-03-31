<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
	<%@include file="header.jsp" %>
 --%>	
 	<section class="boardlist">
		<a href="">동행 구해요</a>
		<a href="">후기</a>
		<a href="">공지사항</a>
	</section>
 
	<section id="noticeBoard_post">
		<form action="" method="post">
			<input type="hidden" name="command" value="noticeBoard_postRes"/>
			<table border="1">
				<tr>
					<th colspan="3">공지작성</th>
				</tr>
				<tr>
					<td colspan="3">
						<input type="text" placeholder="게시글 제목을 적어주세요"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<textarea id="se2" name="se2" class="smarteditor2" ></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" value="등록">
			<input type="button" value="취소" onclick="location.href='board.do?command=list'" />
		</form>
	</section>
<%--	
	<%@include file="footer.jsp" %>
--%>

</body>
</html>