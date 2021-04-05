<%@page import="com.login.dto.RegistDto"%>
<%@page import="com.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.board.biz.BoardBizImpl"%>
<%@page import="com.board.biz.BoardBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="assets/css/commonBoard.css" rel="stylesheet" type="text/css" />

<title>우리동네 운동친구 Health Friends</title>
<script type="text/javascript">
	function loginChk() {
		alert("로그인 이후 사용가능합니다");
	}
</script>
<style type="text/css">

.main img {
	width: 100%;
	height: 2000px;
	vertical-align: middle;
}

.btn01 {
	background: #FF4500;
}

.btn02 {
	background: Tan;
}

.board_list {
	width: 100%;
	border-top: 1px solid OrangeRed;
}

.board_list tbody tr td:nth-child(2) {
	text-align: left;
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
	border: 1px solid OrangeRed;
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
	border: 1px solid OrangeRed;
	font-weight: 600;
	color: OrangeRed;
}

.board_list_wrap .paging a.num.on {
	background: OrangeRed;
	color: #fff;
}

.bt_wrap a {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 8px;
	border: 1px solid OrangeRed;
	border-radius: 2px;
	font-size: 14px;
}

.bt_wrap a.on {
	background: OrangeRed;
	color: white;
	border-radius: 100px;
}

.bt_wrap a.off {
	color: OrangeRed;
}
</style>
</head>
<%
	BoardBiz biz = new BoardBizImpl();
	List<BoardDto> list = biz.notice_selectList();
	RegistDto Ldto = (RegistDto) session.getAttribute("Ldto");
%>
<body>
	<%--
	<%@include file="../../views/common/header.jsp" %>
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
		<div style="font-size: 40px; font-weight: bold">공지사항</div>
		<br>
		<p>웹 이용 전 반드시 공지사항을 확인하시기 바랍니다.</p>
		<br> <a href="../../index.jsp" class="btn btn02">메인 페이지</a> <a
			href="./board.do?command=list  " class="btn btn01">동행 구해요</a> <a
			href="./review.do?command=list  " class="btn btn01">사진 후기</a> <a
			href=" ./notice.do?command=list " class="btn btn01">공지사항</a>
	</div>

	<div class="board">
		<div class="board_list_wrap">
			<table class="board_list">
				<caption>게시판 목록</caption>
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.postNo }</td>
							<td><c:choose>
									<c:when test="${dto.postDelflag eq'Y' }">
										<c:out value="---삭제된 게시글입니다---"></c:out>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${empty Ldto.member_no}">
												<a href="javascript:loginChk();">${dto.postTitle}</a>
											</c:when>
											<c:otherwise>
												<a href="./notice.do?command=select&postId=${dto.postId }">${dto.postTitle }</a>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose></td>
							<td>${Ldto.member_id }</td>
							<td>${dto.postRegdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:choose>
				<c:when test="${Ldto.member_no eq 1 }">
					<div class="bt_wrap">
						<a href="location.href='./notice.do?command=insert'" class="on" value="글작성"></a>
					</div>
				</c:when>
				<c:otherwise>
				<div class="bt_wrap">
						<a href="javascript:loginChk();" class="on" value="글작성">글작성</a>
				</div>
				</c:otherwise>
			</c:choose>

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






<!-- 예전 코드 -->
	<section class="boardlist">
		<a href="./board.do?command=list">동행 구해요</a> <a
			href="./review.do?command=list">사진후기</a> <a
			href="./notice.do?command=list">공지사항</a>
	</section>

	<h2>공지사항</h2>

	<table border="1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${list }" var="dto">
			<tr>
				<td>${dto.postNo }</td>
				<td><c:choose>
						<c:when test="${dto.postDelflag eq'Y' }">
							<c:out value="---삭제된 게시글입니다---"></c:out>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${empty Ldto.member_no}">
									<a href="javascript:loginChk();">${dto.postTitle}</a>
								</c:when>
								<c:otherwise>
									<a href="./notice.do?command=select&postId=${dto.postId }">${dto.postTitle }</a>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose></td>
				<td>${Ldto.member_id }</td>
				<td>${dto.postRegdate }</td>
			</tr>
		</c:forEach>
	</table>
	<c:choose>
		<c:when test="${Ldto.member_no eq 1 }">
			<input type="button" value="글작성"
				onclick="location.href='./notice.do?command=insert'" />
		</c:when>
		<c:otherwise>
			<a href="javascript:loginChk();"><input type="button" value="글작성" /></a>
		</c:otherwise>
	</c:choose>

	<%---	
	<%@include file="../../views/common/footer.jsp" %>
--%>
</body>
</html>










