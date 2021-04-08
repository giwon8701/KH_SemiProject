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
transform: translate( -63%, -50%);
color: ghostwhite;
}
.text02 {
padding: 5px 10px;
text-align: center;
position: absolute;
top: 47%;
left: 48%;
transform: translate( -53%, -52%);
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
background: #FF4500;
}
.btn02 {
background : Tan;
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
	
}


.board_list_wrap {
	padding: 50px;
}

.board_list {
	width: 100%;
	border-top: 1px solid OrangeRed;
}

.board_list tr {
	border-bottom: 1px solid #ccc
}

.board_list th, .board_list td {
	padding: 13px;
	font-size: 16px;
}

.board_list td {
	text-align: left;
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
	border: 1px solid OrangeRed;
	border-radius: 100px;
	font-size: 14px;
}.board_list_wrap .paging a:first-child {
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

.board_list_wrap .paging a.num.on{
background: OrangeRed;
color: #fff;
}
.bt_wrap a {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 8px;
	border: 1px solid OrangRed;
	border-radius: 2px;
	font-size: 14px;
}


.bt_wrap a.on {
	background: OrangeRed;
	color: white;
	border-radius: 100px;
}

#mpage01 {
border:none;
background-Color:OrangeRed;
border: 1px solid OrangeRed;  
font-size:14px;     
border-radius: 100px;   
color: white;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

#mpage01:hover {
border:none;
background-Color:OrangeRed;
border: 1px solid OrangeRed;  
font-size:14px;     
border-radius: 100px; 
text-decoration: underline white;    
color: white;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

#mpage02 {
border:none;
background-Color: white;
border: 1px solid OrangeRed;  
font-size:14px;     
border-radius: 100px;   
color: OrangeRed;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

#mpage02:hover {
border:none;
background-Color:white;
border: 1px solid OrangeRed;  
font-size:14px;     
border-radius: 100px;
text-decoration: underline OrangeRed;   
color: OrangeRed;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
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

<!-- 
	<section class="boardlist">
		<a href="../../board.do?command=list">동행 구해요</a>
		<a href="../../review.do?command=list">사진후기</a>
		<a href="../../notice.do?command=list">공지사항</a>
	</section>
	
	 -->
	
	 <div class="board">
	<div class="board_list_wrap">
	
	<section id="noticeBoard_post">
		<form action="../../notice.do" method="post">
			<input type="hidden" name="command" value="insertres"/>
				<table class="board_list">
				<tr>
					<td colspan="3">
						<input type="text" name="postTitle" style="background-color:transparent; border:0 solid black; text-align:left; font-size:18px;" placeholder="제목을 적어주세요"/>
					</td>
				</tr>
				<tr>	
				
				</tr>
				<tr>
					<td colspan="3">
						<textarea id="se2" name="postContent" class="smarteditor2" style="width:1000px"></textarea>
					</td>
				</tr>
			</table><br>
			
			<div class="individual01" style="text-align:right">
			
					<input type="submit" id="mpage01" value="등록">
					<input type="button" id="mpage02" value="취소" onclick="location.href='../../notice.do?command=list'">
			
			</div>
				</form>
	</section>
</div>
</div>
			
			
		<!-- 	
			
			<input type="submit" value="등록">
			<input type="button" value="취소" onclick="location.href='../../notice.do?command=list'" />
	
 -->
	
<%---	
	<%@include file="../../views/common/footer.jsp" %>
--%>

</body>
</html>



