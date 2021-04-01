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

<%--
	<%@include file="header.jsp" %>
 --%>
 
<%--게시판목록 --%>	
	<section class="boardlist">
		<a href="./board.do?command=list">동행 구해요</a>
		<a href="photoReviewBoard.jsp">사진후기</a>
		<a href="./notice.do?command=list">공지사항</a>
	</section>
	<br/>
	<input type="button" value="글작성" onclick="location.href='../../board.do?command=insert'" />
	
<%--게시글리스트 --%>
	<section id="Board_list">
		<table border="1">
				<tr>
					<td>왜 안되냐 ${dto.postTitle }</td>
					<td>${dto.postContent }</td>
				</tr>
		</table>
	</section>

<%--
	<%@include file="footer.jsp" %>
 --%>  

</body>
</html>















