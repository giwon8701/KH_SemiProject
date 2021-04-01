<%@page import="com.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.board.biz.BoardBizImpl"%>
<%@page import="com.board.biz.BoardBiz"%>
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
<%
	BoardBiz biz = new BoardBizImpl();
	List<BoardDto> list = biz.notice_selectList();
%>
<body>
<%---
	<%@include file="header.jsp" %>
 --%>	
	<section class="boardlist">
		<a href="./board.do?command=list">동행 구해요</a>
		<a href="photoReviewBoard.jsp">사진후기</a>
		<a href="./notice.do?command=list">공지사항</a>
	</section>
	
	<h2>공지사항</h2>
	
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
<% 
			if (list.size() == 0){
%>
				<tr>
					<td colspan="5">------작성된 글이 없습니다------</td>
				</tr>
<% 
			} else{
				for (BoardDto dto : list){
%>
				<tr>
					<td></td>
					<td>${dto.postTitle }</td>
					<td>${dto.postContent }</td>
					<td>${dto.postId }</td>
					<td>${dto.postMdate }</td>
				</tr>
<%
				}
			}
%>
	</table>
	 <input type="button" value="글작성" onclick="location.href='./notice.do?command=insert'" />
<%---	
	<%@include file="footer.jsp" %>
--%>
</body>
</html>