<%@page import="com.login.dto.RegistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 운동친구∴∵Heath Friends</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$("#submit").click(function(){
		oEditors.getById["postContent"].exec("POST_CONTENT");
		$("Acform").submit();
	})
})

$(function(){
	$("#submit").click(function(){
		oEditors.getById["postMdate"].exec("POST_MDATE");
		$("Acform").submit();
	})
})
</script>

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
background: teal;
	border: 1px solid teal;

}

.btn01:hover {
	width: 130px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	background: white;
	text-decoration: underline teal;
	color: teal;
	display: inline-block;
	border: 1px solid teal;
}

.btn02 {
background : royalblue;
	border: 1px solid royalblue;
}

.btn02:hover {
	width: 130px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	background: white;
	text-decoration: underline royalblue;
	color: royalblue;
	display: inline-block;
	border: 1px solid royalblue;
}
.board {
margin: 0 150px;
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
	border-top: 1px solid teal;
}

.board_list tr {
	border-bottom: 1px solid #ccc
}

.board_list th, .board_list td {
	padding: 15px;
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
	border: 1px solid teal;
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
border: 1px solid teal;
font-weight: 600;
color: teal;
}

.board_list_wrap .paging a.num.on{
background: teal;
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
	background: teal;
	color: white;
	border-radius: 100px;
}

#submit {
border:none;
background-Color:teal;
border: 1px solid teal;  
font-size:14px;     
border-radius: 100px;   
color: white;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

#submit:hover {
border:none;
background-Color:teal;
border: 1px solid teal;  
font-size:14px;     
border-radius: 100px; 
text-decoration: underline white;    
color: white;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

#cancel {
border:none;
background-Color: white;
border: 1px solid teal;  
font-size:14px;     
border-radius: 100px;   
color: teal;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

#cancel:hover {
border:none;
background-Color:white;
border: 1px solid teal;  
font-size:14px;     
border-radius: 100px;
text-decoration: underline teal;   
color: teal;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

.individual01 {
margin-top:10px;

}



	.map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    
	table{
		width: 1000px;
	}
	tr > th{
		text-align: left;
	}
</style>
</head>
<body>

		<%--동행게시판 --%>


	<%@include file="../../header.jsp" %>

 
<jsp:useBean id="dto" class="com.board.dto.BoardDto" scope="request"></jsp:useBean>
 	
	
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
		<div style="font-size: 40px; font-weight: bold">동행 게시판</div>
		<br>
		<p>우리 동네 운동 친구를 만나보세요.</p>
		<br> <a href="index.jsp" class="btn btn02">메인 페이지</a> <a
			href="./board.do?command=list  " class="btn btn01">동행 구해요</a> <a
			href="./review.do?command=list  " class="btn btn01">사진 후기</a> <a
			href="./notice.do?command=list " class="btn btn01">공지사항</a>
	</div>
	
  <div class="board">
	<div class="board_list_wrap">
	<section id="Board_writePost">
		<form action="./board.do" id="Acform"  method="post">
			<input type="hidden" name="command" value="insertres"/>
				<table class="board_list">
			<caption>일정 작성</caption>
			<thead>
				<tr>
					<td colspan="3">
						<input type="text" name="postTitle" style="background-color:transparent; border:0 solid black; text-align:left; font-size:18px; width:1200px;" placeholder="게시글 제목을 적어주세요"/>
					</td>
				</tr>
				<tr>
					<td>
						운동종류 &emsp;
						<select name="postCategoryName" style="font-size:16px;">
							<optgroup label="맨발운동">
								<option value="walk">걷기</option>
								<option value="running">달리기</option>
							</optgroup>
							<optgroup label="라이딩">
								<option value="bike_riding">자전거</option>
								<option value="inline_skating">인라인스케이트(롤러브레이드)</option>
							</optgroup>
							<optgroup label="구기운동">
								<option value="basketball">농구</option>
								<option value="dodgeball">피구</option>
								<option value="tennis">테니스</option>
							</optgroup>
						</select>
					</td>
					</tr>
					<tr>
					<td>
						<!-- 지도API : c6a1fbbb0976413a4f4996beefa8a351 -->
						<p><em>지도를 클릭해주세요!</em></p>
						약속장소	<br/>
						<div id="makerSpace" >
					 지번주소&emsp;<input type="text" name="postLongitude" value=""/>
					
						</div>
						<br>
						<input type="hidden" id="MapAddress" name="MapAddress" value="" /> 
						<div class="map_wrap">
						    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
						    <div class="hAddr">
						        <span class="title">지도중심기준 행정동 주소정보</span>
						        <span id="centerAddr"></span>
						    </div>
						</div> 
						
<%-- 카카오 맵 관련 api, js --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6a1fbbb0976413a4f4996beefa8a351&libraries=services"></script>
<script src="/Health_Friends/assets/js/kakaoMap.js"></script>

					</td>
					<td>
						<p><em>달력을 클릭해주세요!</em></p>
	<!-- 달력API -->		<div id='postMdate'></div>

						    <input type="hidden" name="postMdate" value="" />
					 	<div id='calendar'></div>
					</td>
				</tr> 
				<tr>
					<td colspan="3" id="Board_writeContent">
						<textarea rows="30" cols="100" id="summernote" name="postContent"></textarea>
					</td>
				</tr>
			</table>
				<div class="individual01" style="text-align:right">
			<input type="submit" id="submit" value="등록">
			<input type="button" id="cancel" value="취소" onclick="location.href='./board.do?command=list'" />
			</div>
		</form>
	</section>
<%--	
	<%@include file="footer.jsp" %>
--%>	
<%-- summernote관련 부트스트랩, api, js --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src="assets/js/summernote.js"></script>
<%-- 글쓰기에 들어가는 캘린더 api, js --%>
<link href='/Health_Friends/assets/api/fullcalendar-5.6.0/lib/main.css' rel='stylesheet' />
<script src='/Health_Friends/assets/api/fullcalendar-5.6.0/lib/main.js'></script>
<script src='/Health_Friends/assets/js/boardCalendar.js'></script>
</body>
</html>
















