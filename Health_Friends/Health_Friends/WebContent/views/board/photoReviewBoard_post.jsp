<%@page import="com.login.dto.RegistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 운동친구∴∵Heath Friends</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<link href="assets/css/commonBoard.css" rel="stylesheet" type="text/css" />

<style>
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

html {
	font-size: 10px;
}

ul, li {
	list-style: none;
}

.board_wrap {
	width: 1000px;
	margin: 100px auto;
}

.board_title {
	margin-bottom: 30px;
}

.board_title strong {
	font-size: 3rem;
}

.board_title p {
	margin-yop: 5px;
	font-size: 1.4rem;
}

.bt_wrap {
	margin-top: 30px;
	text-align: center;
	font-size: 16px;
}

.bt_wrap a {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 10px;
	border: 1px solid royalblue;
	border-radius: 2px;
	font-size: 16px;
}

.bt_wrap a.on {
	background: white;
	color: royalblue;
	border-radius: 100px;
}

.bt_wrap a.on:hover {
	background: white;
	color: royalblue;
	text-decoration: underline royalblue;
	border-radius: 100px;
}

.bt_wrap a.off {
	color: Royalblue;
	border-radius: 100px;
}

.bt_wrap a.off.:hover {
	color: Royalblue;
	border-radius: 100px;
	text-decoration: underline Royalblue;
	border-radius: 100px;
}

.board_list {
	width: 100%;
	border-top: 2px solid #000;
}

.board_list>div {
	border-bottom: 1px solid #ddd;
	font-size: 0;
}

.board_list>div.top {
	border-bottom: 1px soild #999;
}

.board_list>div:last-child {
	border-bottom: 1px solid #000;
}

.board_list>div>div {
	display: inline-block;
	padding: 15px 0;
	text-align: center;
	font-size: 1.4rem;
}

.board_list>div.top>div {
	font-weight: 600;
}

.board_list .num {
	width: 10%;
}

.board_list .title {
	width: 60%;
	text-align: left;
}

.board_list .top .title {
	text-align: center;
}

.board_list .writer {
	width: 10%;
}

.board_list .date {
	width: 10%;
}

.board_list .count {
	width: 10%;
}

.board_view {
	width: 100%;
	border-top: 2px solid #000;
}

.board_view .title {
	padding: 20px 15px;
	border-bottom: 1px dashed #ddd;
	font-size: 2rem;
}

.board_view .info {
	padding: 15px;
	border-bottom: 1px solid #999;
	font-size: 0;
}

.board_view .info dl {
	position: relative;
	display: inline-block;
	padding: 0 20px;
}

.board_view .info dl:first-child {
	padding-left: 0;
}

.board_view .info dl::before {
	content: "";
	position: absolute;
	top: 1px;
	left: 0;
	display: block;
	width: 1px;
	height: 13px;
	background: #ddd;
}

.board_view .info dl:first-child::before {
	display: none;
}

.board_view .info dl dt, .board_view .info dl dd {
	display: inline-block;
	font-size: 1.4rem;
}

.board_view .info dl dt {
	
}

.board_view .info dl dd {
	margin-left: 10px;
	color: #777;
}

.board_view .cont {
	padding: 15px;
	border-bottom: 1px solid #000;
	line-height: 160%;
	font-size: 1.4rem;
}

.title11 {
	border-bottom: 1px solid gray;
	padding: 16px;
	outline: none;
	font-size: 24px;
}

.title11[contentEditable="true"]:empty:not(:focus):before {
	content: attr(data-ph);
	color: #D3D3D3;
}

button {
border: 1px solid royalblue;
width: 80px;
height: 50px;
background : royalblue;
color: white;
}

button:hover{
border: 1px solid royalblue;
width: 80px;
height: 50px;
background : royalblue;
color: white;
text-decoration:underline white;


</style>


</head>
<body>
	<%@include file="../../header.jsp"%>

	<div class="main01">
		<img src="https://www.imgacademy.co.kr/sites/default/files/inline-images/coaching.jpg" style="width: 100%; height: auto">
		<div class=text01 style="font-size: 40px; font-weight: bold">
			게시판 입니다
		</div>
		<br>
		<div class=text02 style="font-size: 24px;">오늘도 즐거운 운동 즐기시길 바랍니다</div>
		<br>
	</div>


	<div class="main02" style="text-align: center">
		<div style="font-size: 40px; font-weight: bold">후기 게시판</div>
		<br>
		<p style="font-size: 16px">소중한 추억을 남겨보세요.</p>
		<br>
		<a href="  " class="btn btn02" style="font-size: 16px">
			메인 페이지
		</a>
		<a href="./board.do?command=list  " class="btn btn01" style="font-size: 16px">
			동행 구해요
		</a>
		<a href="./review.do?command=list  " class="btn btn01" style="font-size: 16px">
			사진 후기
		</a>
		<a href="./notice.do?command=list " class="btn btn01" style="font-size: 16px">
			공지사항
		</a>
	</div>
	<div class="board_wrap">
		<section id="">
			<form action="review.do" method="post">
				<input type="hidden" name="command" value="insertRes" />
				<input type="hidden" name="userNo" value="${Ldto.member_no }">
				<input type="hidden" name="postThumbNail" id="postThumbNail"/>


				<div class="board_title">
					<div class="board_view_wrap">
						<div class="board_view">
							<input type="text" name="postTitle"/>
							<div class="info">
								<dl>
									<dt>작성자</dt>
									<dd>${Ldto.member_id }</dd>
								</dl>
							</div>
							<textarea rows="30" cols="100" id="summernote" name="postContent"></textarea>
						</div>

						<div class="bt_wrap">
							<button type="submit" id="submit" style="border-radius: 100px;" >확인</button>
							<a href="review.do?command=list" class="on">취소</a>
						</div>
					</div>
				</div>
			</form>
		</section>
		</div>
	
	<%-- summernote관련 부트스트랩, api, js --%>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	<script src="assets/js/summernote.js"></script>
</body>
</html>