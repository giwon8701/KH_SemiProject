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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link href="assets/css/commonBoard.css" rel="stylesheet" type="text/css" />

<style>

.main img {
width: 100%;
height: 2000px;
vertical-align: middle;

}

.btn01 {
background: royalblue;
	border: 1px solid royalblue;

}

.btn01:hover {
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

.btn02 {
background : teal;
	border: 1px solid teal;
}

.btn02:hover {
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

.bt_wrap input {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 10px;
	border: 1px solid #FF4500;
	border-radius: 2px;
	font-size: 1.4rem;
}

.bt_wrap input.on {
	background: OrangeRed;
	color: white;
	border-radius: 100px;
}

.bt_wrap input.on:hover {
	background: OrangeRed;
	color: white;
	border-radius: 100px;
	text-decoration: underline white;
	border-radius: 100px;
}

.bt_wrap a.off {
	color: OrangeRed;
	border-radius: 100px;
	background:white;
}

.bt_wrap a.off:hover {
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
</style>

</head>
<body>

	<%@include file="../../header.jsp" %>

<div class="main01">
	<img src="https://www.imgacademy.co.kr/sites/default/files/inline-images/coaching.jpg" style="width:100% ;height:auto">
	<div class=text01 style="font-size: 40px; font-weight:bold">게시판 페이지입니다</div><br>
	<div class=text02 style="font-size: 24px;">오늘도 즐거운 운동 즐기시길 바랍니다</div><br>
</div>
	
<div class="main02" style="text-align: center">
<div style="font-size: 40px; font-weight:bold">후기 게시판 글수정</div><br>
<p style="font-size: 16px">우리 동네 운동 친구를 만나보세요.</p><br> 	
		<br> <a href="index.jsp" class="btn btn02"  style="font-size:16px">메인 페이지</a> <a
			href="./board.do?command=list  " class="btn btn01"  style="font-size:16px">동행 구해요</a> <a
			href="./review.do?command=list  " class="btn btn01"  style="font-size:16px">사진 후기</a> <a
			href=" ./notice.do?command=list " class="btn btn01"  style="font-size:16px">공지사항</a>	
</div>


	  <div class="board">
	<div class="board_list_wrap">
	
	<form action="board.do" method="post">
		<input type="hidden" name="command" value="updateres"/>
		<c:forEach items="dto">
			<input type="hidden" name="postId" value=${dto.postId } />
			<input type="hidden" name="postUserNo" value=${dto.postUserNo } />
		<table class="board_list">
			<caption>일정 작성</caption>
			<thead>
				<tr>
					<th colspan="2">
						<input type="text" name="postTitle" style="background-color:transparent; border:0 solid black; text-align:left; font-size:18px; width:1200px;" value="${dto.postTitle }"/>
					</th>		
				</tr>
				<tr>
					<td>작성자 <span style="color:lightgray">&emsp;|&emsp;</span> ${Ldto.member_id }</td>
					
					<td>작성일 <span style="color:lightgray">&emsp;|&emsp;</span> ${dto.postRegdate } </td>
				</tr>
				<tr>
					<td>
						운동종류	&emsp;
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
					<br/>
						<input type="hidden" id="MapAddress" name="MapAddress" value="" /> 
						<div class="map_wrap">
						    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
						    <div class="hAddr">
						        <span class="title">지도중심기준 행정동 주소정보</span>
						        <span id="centerAddr"></span>
						    </div>
						   
						</div>
					 <br><br><br><br>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6a1fbbb0976413a4f4996beefa8a351&libraries=services"></script>
						<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							    mapOption = {
							        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
							        level: 1 // 지도의 확대 레벨
							    };  
							
							// 지도를 생성합니다    
							var map = new kakao.maps.Map(mapContainer, mapOption); 
							
							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder();
							
							var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
							    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
							
							    
							// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
							searchAddrFromCoords(map.getCenter(), displayCenterInfo);
							
							// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
							kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
							    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
							        if (status === kakao.maps.services.Status.OK) {
							        	
							            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
							            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
							            
							            var MapAddresss = '<div class="bAddr">' +  '<span class="title">법정동 주소정보</span>' + detailAddr + '</div>';
							                    
							            var roadAddr = !!result[0].road_address ? '<div>' + result[0].road_address.address_name + '</div>' : '';
							            var Addr = '<div>' + result[0].address.address_name + '</div>';
							            
							            $("#MapAddress").val(mouseEvent)
										
							           // var markerSpace = document.getElementById("makerSpace");
							           // makerSpace.innerHTML = detailAddr;
							         	
							         	var test2 = document.getElementsByName("postLongitude")[0];
								        var afterString2 = Addr.slice(Addr.indexOf(">")+1, Addr.lastIndexOf("<"));
								        test2.value = afterString2;
							            
							            // 마커를 클릭한 위치에 표시합니다 
							            marker.setPosition(mouseEvent.latLng);
							            marker.setMap(map);
							            
							            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
							            infowindow.setContent(MapAddress);
							            
							        }   
							    });
							});
							
							// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
							kakao.maps.event.addListener(map, 'idle', function() {
							    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
							});
							
							function searchAddrFromCoords(coords, callback) {
							    // 좌표로 행정동 주소 정보를 요청합니다
							    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
							}
							
							function searchDetailAddrFromCoords(coords, callback) {
							    // 좌표로 법정동 상세 주소 정보를 요청합니다
							    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
							}
							
							// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
							function displayCenterInfo(result, status) {
							    if (status === kakao.maps.services.Status.OK) {
							        var infoDiv = document.getElementById('centerAddr');
							
							        for(var i = 0; i < result.length; i++) {
							            // 행정동의 region_type 값은 'H' 이므로
							            if (result[i].region_type === 'H') {
							                infoDiv.innerHTML = result[i].address_name;
							                break;
							            }
							        }
							    }    
							}
							
						</script>
						</td>
						
						<td style="width:600px; height:400px">
							<p><em>달력을 클릭해주세요!</em></p>
	<!-- 달력API -->			<div id='postMdate'></div>

						    <input type="hidden" name="postMdate" value="" />
					   	 <div id='calendar'></div>
						</td>
				</tr>
				<tr>
					<td colspan="3" id="Board_writeContent">
						<textarea rows="30" cols="100" id="summernote" name="postContent">${dto.postContent }</textarea>
					</td>
				</tr>
		</table>
		</c:forEach>
	<div class="individual01" style="text-align:right">
				
						<input type="submit" id="submit" value="확인"/>
						<input type="button" id="cancel" value="취소" onclick="location.href='board.do?command=list'" />
				
				</div>
	</form>
</div>
</div>

<%---	
	<%@include file="../../views/common/footer.jsp" %>
--%>
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