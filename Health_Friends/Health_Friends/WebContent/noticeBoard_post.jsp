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
<link href="assets/css/commonBoard.css" rel="stylesheet" type="text/css" />


<style type="text/css">

.main img {
width: 100%;
height: 2000px;
vertical-align: middle;

}

.btn01 {
	background: #FF4500;
	border: 1px solid OrangeRed;
}

.btn01:hover {
	width: 130px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	background: white;
	text-decoration: underline OrangeRed;
	color: OrangeRed;
	display: inline-block;
	border: 1px solid OrangeRed;
}

.btn02 {
	background: Tan;
	border: 1px solid Tan;
}

.btn02:hover {
	width: 130px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	background: white;
	text-decoration: underline Tan;
	color: Tan;
	display: inline-block;
	border: 1px solid Tan;
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
	font-size: 0;
}

.bt_wrap a {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 10px;
	border: 1px solid #FF4500;
	border-radius: 2px;
	font-size: 1.4rem;
}

.bt_wrap a.off {
	background: OrangeRed;
	color: white;
	border-radius: 100px;
}

.bt_wrap a.off:hover {
	background: OrangeRed;
	color: white;
	border-radius: 100px;;
	text-decoration: underline white;
	border-radius: 100px;
}

.bt_wrap a.on {
	color: OrangeRed;
	border-radius: 100px;
	background:white;
}

.bt_wrap a.on:hover {
	color: OrangeRed;
	border-radius: 100px;
	background:white;
	text-decoration: underline OrangeRed;
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

<div class="main01">
	<img src="https://www.imgacademy.co.kr/sites/default/files/inline-images/coaching.jpg" style="width:100% ;height:auto">
	<div class=text01 style="font-size: 40px; font-weight:bold">게시판 페이지입니다</div><br>
	<div class=text02 style="font-size: 24px;">오늘도 즐거운 운동 즐기시길 바랍니다</div><br>
</div>
	
<div class="main02" style="text-align: center">
<div style="font-size: 40px; font-weight:bold">공지사항 글수정</div><br>
<p style="font-size: 16px">웹 이용 전 반드시 공지사항을 확인하시기 바랍니다.</p><br> 	
		<br> <a href="../../index.jsp" class="btn btn02"  style="font-size:16px">메인 페이지</a> <a
			href="./board.do?command=list  " class="btn btn01"  style="font-size:16px">동행 구해요</a> <a
			href="./review.do?command=list  " class="btn btn01"  style="font-size:16px">사진 후기</a> <a
			href=" ./notice.do?command=list " class="btn btn01"  style="font-size:16px">공지사항</a>	
</div>










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
						<textarea id="se2" name="postContent" class="smarteditor2" ></textarea>
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



