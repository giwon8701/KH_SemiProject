<%@page import="com.login.dto.RegistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 운동친구∴∵Heath Friends</title>
<link href="/assets/css/commonBoard.css" rel="stylesheet" type="text/css" />
<link href='/Health_Friends/assets/api/fullcalendar-5.6.0/lib/main.css' rel='stylesheet' />
<script src='/Health_Friends/assets/api/fullcalendar-5.6.0/lib/main.js'></script>
<script type="text/javascript" src="/Health_Friends/assets/js/boardSelectCalendar.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
var postPlace = document.getElementsByName("postPlace")[0];
var afterString = postPlace.slice(0,2);
postPlace.value = afterString;

</script>
<style>

.main img {
width: 100%;
height: 2000px;
vertical-align: middle;

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
	border: 1px solid teal;
	border-radius: 2px;
	font-size: 1.4rem;
}

.bt_wrap a.off {
	background: teal;
	color: white;
	border-radius: 100px;
}

.bt_wrap a.off:hover {
	background: teal;
	color: white;
	text-decoration: underline white;
	border-radius: 100px;
}

.bt_wrap a.on {
	color: teal;
	background:white;
	border-radius: 100px;
}

.bt_wrap a.on:hover {
	color: teal;
	background:white;
	text-decoration: underline teal;
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


</style>

<script>
	function scrap(){
		var post_id = $("#post_id").val();
		var queryString = "post_id="+ post_id;
		$.ajax({
			url: "scrap.do?command=addScrap&" + queryString,
			dataType: "text",
			success: function(data){
				if(data > 0){
					$("#unscrapBttn").css("display", "");
					$("#scrapBttn").css("display", "none");
				}
			},
			error: function(err){
				alert(err);
			}
		});
	}
					
	function unscrap(){
		var post_id = $("#post_id").val();
		var queryString = "post_id="+ post_id;
		$.ajax({
			url: "scrap.do?command=delScrap&" + queryString,
			dataType: "text",
			success: function(data){
				if(data > 0){
					$("#unscrapBttn").css("display", "none");
					$("#scrapBttn").css("display", "");
				}
			},
			error: function(err){
				alert(err);
			}
		});
	}
</script>

</head>
<body>
	<%--  
	<%@include file="../../views/common/header.jsp" %>
--%>

	<%
		RegistDto Ldto = (RegistDto) session.getAttribute("Ldto");
	%>
	
	<div class="main01">
		<img
			src="https://www.imgacademy.co.kr/sites/default/files/inline-images/coaching.jpg"
			style="width: 100%; height: auto">
		<div class=text01 style="font-size: 40px; font-weight: bold">게시판
			페이지입니다</div>
		<br>
		<div class=text02 style="font-size: 24px;">오늘도 즐거운 운동 즐기시길 바랍니다</div>
		<br>
	</div>

	<div class="main02" style="text-align: center">
		<div style="font-size: 40px; font-weight: bold">동행 게시판 글보기</div>
		<br>
		<p style="font-size: 16px">우리 동네 운동 친구를 만나보세요.</p>
		<br> <br> <a href="../../index.jsp" class="btn btn02"
			style="font-size: 16px">메인 페이지</a> <a
			href="./board.do?command=list  " class="btn btn01"
			style="font-size: 16px">동행 구해요</a> <a
			href="./review.do?command=list  " class="btn btn01"
			style="font-size: 16px">사진 후기</a> <a href="./notice.do?command=list "
			class="btn btn01" style="font-size: 16px">공지사항</a>
	</div>

	<div class="board_wrap">
		<div class="board_title">
			<div class="board_view_wrap">
				<div class="board_view">
					<div class="title">
					${dto.postTitle }
					</div>
					<c:forEach items="dto">
						<div class="info">
							<dl>
								<dt>작성자</dt>
								<dd>${member_id }</dd>
							</dl>
							<dl>
								<dt>작성일</dt>
								<dd>
								<fmt:formatDate value="${dto.postRegdate}" pattern="yyyy-MM-dd HH:mm" />
								</dd>
							</dl>
							<dl></dl>
						</div>
						<div class="cont">${dto.postContent }</div>
					</c:forEach>
				</div>
				<div class="bt_wrap">
					<a href="board.do?command=list" class="on">목록</a> 
					<a href="board.do?command=updateform&postId=${dto.postId}" class="off">수정</a>
					<a href="board.do?command=delete&postId=${dto.postId}" class="off">삭제</a>
				</div>
			</div>
		</div>
	</div>

	<section class="boardlist">
		<a href="./board.do?command=list">동행 구해요</a> <a
			href="./review.do?command=list">사진후기</a> <a
			href="./notice.do?command=list">공지사항</a>
	</section>
	<table border="1">
		<c:forEach items="dto">
			<tr>
				<th colspan="3">${dto.postTitle }</th>
			</tr>
			<tr>
				<td>${member_id }</td>
				<td colspan="2">작성일 ${dto.postRegdate }</td>
			</tr>
			<tr>
				<td>
					운동종목	<br/>
					<c:choose>
						<c:when test="${dto.postCategoryName eq 'walk'}">
							<c:out value="걷기"></c:out>
						</c:when>
						<c:when test="${dto.postCategoryName eq 'running'}">
							<c:out value="달리기"></c:out>
						</c:when>
						<c:when test="${dto.postCategoryName eq 'bike_riding'}">
							<c:out value="자전거"></c:out>
						</c:when>
						<c:when test="${dto.postCategoryName eq 'inline_skating'}">
							<c:out value="인라인스케이팅(롤러브레이드)"></c:out>
						</c:when>
						<c:when test="${dto.postCategoryName eq 'basketball'}">
							<c:out value="농구"></c:out>
						</c:when>
						<c:when test="${dto.postCategoryName eq 'dodgeball'}">
							<c:out value="피구"></c:out>
						</c:when>
						<c:when test="${dto.postCategoryName eq 'tennis'}">
							<c:out value="테니스"></c:out>
						</c:when>
					</c:choose>
				</td>
				<td>약속시간<br/>
					 <div id='calendar'></div>
				</td>
				<td>약속장소<br/>
					${dto.postLongitude}
					<div id="map" style="width:100%;height:350px;"></div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6a1fbbb0976413a4f4996beefa8a351&libraries=services"></script>
						<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = {
						        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 3 // 지도의 확대 레벨
						    };  
						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption); 
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch('${dto.postLongitude}', function(result, status) {
						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {
						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });
						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;paddin0g:6px 0;">여기서 만나요</div>'
						        });
						        infowindow.open(map, marker);
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});    
					</script>
				</td>	
			</tr>
			<tr>
				<td>
					<input type="hidden" id="post_id" value="${dto.postId }">
					<c:choose>
						<c:when test="${res eq 1 }">
							<button id="unscrapBttn" onclick="unscrap()">찜하기해제</button>
							<button id="scrapBttn" onclick="scrap()" style="display: none;">찜하기</button>
						</c:when>
						<c:otherwise>
							<button id="unscrapBttn" onclick="unscrap()" style="display: none;">찜하기해제</button>
							<button id="scrapBttn" onclick="scrap()">찜하기</button>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			
			<tr>
				<td colspan="3">${dto.postContent }</td>
			</tr>
			<tr>
				<td colspan="3">
					<c:choose>
	      				<c:when test="${Ldto.member_no eq 1 || Ldto.member_no eq dto.postUserNo }">	
							<input type="button" value="목록" onclick="location.href='board.do?command=list'" />
							<input type="button" value="수정" onclick="location.href='board.do?command=updateform&postId=${dto.postId}'" />
							<input type="button" value="삭제" onclick="location.href='board.do?command=delete&postId=${dto.postId}'" />
						</c:when>
						 <c:otherwise>
						 	<input type="button" value="목록" onclick="location.href='board.do?command=list'" />
		 				 </c:otherwise>
					 </c:choose>		
				</td>
			</tr>
		</c:forEach>
	</table>

<%---	
	<%@include file="../../views/common/footer.jsp" %>
--%>

</body>
</html>













