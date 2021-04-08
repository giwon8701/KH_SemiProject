<%@page import="com.login.biz.RegistBizImpl"%>
<%@page import="com.login.biz.RegistBiz"%>
<%@page import="com.common.Paging"%>
<%@page import="com.login.dto.RegistDto"%>
<%@page import="com.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.board.biz.BoardBizImpl"%>
<%@page import="com.board.biz.BoardBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<% request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
* {
	margin: 0;
	padding: 0;
}

.main01 {
	width: 100%;
	margin: 10px auto;
	position: relative;
}

.main img {
	width: 100%;
	height: 2000px;
	vertical-align: middle;
}

.text01 {
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 37%;
	left: 50%;
	transform: translate(-63%, -50%);
	color: ghostwhite;
}

.text02 {
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 47%;
	left: 48%;
	transform: translate(-53%, -52%);
	color: ghostwhite;
}

.btn {
	width: 130px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	background: #1f1f39;
	color: #fff;
	display: inline-block;
}

.btn01 {
	background: PaleVioletRed;
	border: 1px solid PaleVioletRed;
}

.btn01:hover {
	width: 130px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	background: white;
	text-decoration: underline PaleVioletRed;
	color: PaleVioletRed;
	display: inline-block;
	border: 1px solid PaleVioletRed;
}

.btn02 {
	background: Orange;
	border: 1px solid Orange;
}

.btn02:hover {
	width: 130px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	background: white;
	text-decoration: underline Orange;
	color: Orange;
	display: inline-block;
	border: 1px solid Orange;
}

.board {
	margin: 0 260px;
}

table {
	border-collapse: collapse;
}

caption {
	display: none;
}

a {
	text-decoration: none;
	color: inherit;
}

.board_list_wrap {
	padding: 50px;
}

.board_list {
	width: 100%;
	border-top: 1px solid PaleVioletRed;
}

.board_list tr {
	border-bottom: 1px solid #ccc
}

.board_list th, .board_list td {
	padding: 10px;
	font-size: 14px;
}

.board_list td {
	text-align: center;
}

.board_list tbody tr td:nth-child(2) {
	text-align: left;
}

.board_list .tit:hover {
	text-decoration: underline;
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
	border: 1px solid PaleVioletRed;
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
	border: 1px solid PaleVioletRed;
	font-weight: 600;
	color: PaleVioletRed;
}

.board_list_wrap .paging a.num.on {
	background: PaleVioletRed;
	color: #fff;
}

.bt_wrap a {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 8px;
	border: 1px solid PaleVioletRed;
	border-radius: 2px;
	font-size: 14px;
}

.bt_wrap a.on {
	background: PaleVioletRed;
	color: white;
	border-radius: 100px;
}

.bt_wrap a.on:hover {
	background: PaleVioletRed;
	color: white;
	border-radius: 100px;
	text-decoration: underline white;
}

.bt_wrap a.off {
	color: PaleVioletRed;
	border-radius: 100px;
}

.bt_wrap a.off:hover {
	color: PaleVioletRed;
	border-radius: 100px;
	text-decoration: underline PaleVioletRed;
}

div .pagemove {
	width: 30px;
	height: 30px;
	border: 1px solid PaleVioletRed;
	border-radius: 100%;
	color: PaleVioletRed;
}

div .pagemove:hover {
	width: 30px;
	height: 30px;
	border: 1px solid lightgray;
	border-radius: 100%;
	background-color: lightgray;
	color: white;
}

.paging {
	margin-top: 40px;
	margin-bottom: 50px;
	text-align: center;
	font-size: 0;
}

.paging a {
	display: inline-block;
	margin-left: 10px;
	padding: 5px 10px;
	border: 1px solid teal;
	border-radius: 100px;
	font-size: 14px;
}

#paging {
	border: none;
	background-Color: #F5F5F5;
	font: 18px;
	border-radius: 100px;
	color: black;
	width: 86px;
	height: 32px;
	cursor: pointer;
}

#paging:hover {
	border: none;
	background-Color: lightgray;
	font: 18px;
	border-radius: 100px;
	color: black;
	width: 86px;
	height: 32px;
	cursor: pointer;
}

.pagination {
	padding: 0 0;
	text-align: center;
}

.pagination a {
	padding: 3px 8px;
	margin: 5px;
	cursor: pointer;
}

.pagination a.on {
	width: 30px;
	height: 30px;
	border: 1px solid PaleVioletRed;
	border-radius: 100%;
	background-color: PaleVioletRed;
	color: white;
}
</style>

<title>우리동네 운동친구∴∵Heath Friends</title>

</head>

<body>
	
	<%@include file="../../header.jsp" %>

	<div class="main01">
		<img
			src="https://www.imgacademy.co.kr/sites/default/files/inline-images/coaching.jpg"
			style="width: 100%; height: auto">
		<div class=text01 style="font-size: 40px; font-weight: bold">찜한
			게시물 페이지입니다</div>
		<br>
		<div class=text02 style="font-size: 24px;">오늘도 즐거운 운동 즐기시길 바랍니다</div>
		<br>
	</div>


	<div class="main02" style="text-align: center">
		<div style="font-size: 40px; font-weight: bold">찜한 게시글</div>
		<br>
		<p>마음에 드는 게시글을 볼 수 있습니다.</p>
		<br>
		<section class="boardlist">
			<a href="  " class="btn btn02">메인 페이지</a> <a
				href="./board.do?command=list" class="btn btn01">동행 게시판</a> <a
				href="./review.do?command=list" class="btn btn01">후기 게시판</a> <a
				href="./notice.do?command=list" class="btn btn01">공지사항</a>
		</section>
	</div>

	<div class="board">
		<div class="board_list_wrap">
			<table class="board_list">
				<caption>찜한 게시글</caption>
				<thead>
					<tr>
						<th>카테고리</th>
						<th>제목</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>

					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="3">----------찜한 게시글이 없습니다------------</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="dto">
								<c:if test="${dto.postDelflag eq 'N'}">
								<tr>
									<td>${dto.postBoardName }</td>
									<td><a
										href="./board.do?command=scrapSelect&postid=${dto.postId }">${dto.postTitle }</a></td>
									<td>${dto.postRegdate }</td>
								</tr>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
<%-- 
	
		<h2>찜한 게시글</h2>
 
 
	<section class="boardlist">
		<a href="./board.do?command=list">동행 구해요</a>
		<a href="./review.do?command=list">사진후기</a>
		<a href="./notice.do?command=list">공지사항</a>
	</section>
	
	<table border="1">
			<tr>
				<th>카테고리</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="3">----------찜한 게시글이 없습니다------------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<c:if test="${dto.postDelflag eq 'N'}">
						<tr>
							<td>${dto.postBoardName }</td>
							<td><a href="./board.do?command=scrapSelect&postid=${dto.postId }">${dto.postTitle }</a></td>
							<td>${dto.postRegdate }</td>
						</tr>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
	</table> --%>
	<%@include file="../../footer.jsp" %>

</body>
</html>










