<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="assets/css/commonBoard.css" rel="stylesheet" type="text/css" />

<title>후기 게시판</title>
<style type="text/css">

.main img {
	width: 100%;
	height: 2000px;
	vertical-align: middle;
}

.btn01 {
	background: Royalblue;
}

.btn02 {
	background: teal;
}

.board_list {
	width: 100%;
	border-top: 1px solid Royalblue;
}

.board_list tbody tr td:nth-child(2) {
	text-align: center;
}

.board_list_wrap .paging {
	margin-top: 20px;
	text-align: center;
	font-size: 0;
}

.board_list_wrap .paging a {
	display: inline-block;
	margin-left: 10px;
	padding: 5px 10px;
	border: 1px solid Royalblue;
	border-radius: 100px;
	font-size: 14px;
}

.board_list_wrap .paging a:first-child {
	margin-left: 0;
}

.board_list_wrap .paging a.bt {
	border: 1px solid #eee;
	background: #eee;
}

.board_list_wrap .paging a.num {
	border: 1px solid Royalblue;
	font-weight: 600;
	color: Royalblue;
}

.board_list_wrap .paging a.num.on {
	background: Royalblue;
	color: #fff;
}

.bt_wrap a {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 8px;
	border: 1px solid Royalblue;
	border-radius: 2px;
	font-size: 14px;
}

.bt_wrap a.on {
	background: Royalblue;
	color: white;
	border-radius: 100px;
}

.bt_wrap a.off {
	color: Royalblue;
}

.boardlist {
	
}

img {
	width: 200px;
	height: 200px;
}
</style>
</head>
<body>
	<%--
	<%@include file="header.jsp" %>
--%>

	<div class="main01">
		<img
			src="https://www.imgacademy.co.kr/sites/default/files/inline-images/coaching.jpg"
			style="width: 100%; height: auto">
		<div class=text01 style="font-size: 40px; font-weight: bold">게시판
			입니다</div>
		<br>
		<div class=text02 style="font-size: 24px;">오늘도 즐거운 운동 즐기시길 바랍니다</div>
		<br>
	</div>

	<div class="main02" style="text-align: center">
		<div style="font-size: 40px; font-weight: bold">후기게시판</div>
		<br>
		<p>소중한 추억을 남겨보세요.</p>
		<br> <a href="../../index.jsp" class="btn btn02">메인 페이지</a> <a
			href="./board.do?command=list  " class="btn btn01">동행 구해요</a> <a
			href="./review.do?command=list  " class="btn btn01">사진 후기</a> <a
			href=" ./notice.do?command=list " class="btn btn01">공지사항</a>
	</div>

	<div class="board">
		<div class="board_list_wrap">
			<section id="photoReviewBoard_list">
				<table class="board_list">
					<caption>게시판 목록</caption>
					<thead>
						<tr>
							<th>사진</th>
							<th>글번호</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td>------------작성된 글이 없습니다-----------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td><img src=""></td>
							<td>${dto.postNo}</td>
							<td>${dto.postTitle}</td>
							<td>${dto.postRegdate}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
					</tbody>
				</table>
			</section>
				<div class="bt_wrap">
						<a href="review.do?command=insert" class="on" value="글작성">글작성</a>
				</div>
<br>
<br>
<br>

			<div class="board_list_warp02">

				<div class="paging">
					<a href="#" class="bt">첫 페이지</a> <a href="#" class="bt">이전 페이지</a>
					<a href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
						href="#" class="num">3</a> <a href="#" class="bt">다음 페이지</a> <a
						href="#" class="bt">마지막 페이지</a>
				</div>
			</div>
			
		</div>
	</div>


	<section class="boardlist">
		<a href="./board.do?command=list">동행 구해요</a> <a
			href="./review.do?command=list">후기</a> <a
			href="./notice.do?command=list">공지사항</a>
	</section>
	<br />
	<input type="button" value="글작성"
		onclick="location.href='review.do?command=insert'" />

	<h2>사진후기</h2>

	<section id="photoReviewBoard_list">
		<table border="1">
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td>------------작성된 글이 없습니다-----------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td><img src=""></td>
							<td>${dto.postNo}</td>
							<td>${dto.postTitle}</td>
							<td>${dto.postContent}</td>
							<td>${dto.postRegdate}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</section>


	<%--	
	<%@include file="footer.jsp" %>
--%>
</body>
</html>