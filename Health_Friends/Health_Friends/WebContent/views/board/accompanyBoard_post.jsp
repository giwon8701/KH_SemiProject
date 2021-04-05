<%@page import="com.login.dto.RegistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 운동친구 Health Friends</title>
<!-- 
	kakao map javascript key :  c6a1fbbb0976413a4f4996beefa8a351
	naver calendar : id: p6N_JsQoah3hCrLJR428
					 pw: Ekh0RH5rfu
-->
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script src="/Health_Friends/assets/api/se2/js/HuskyEZCreator.js" type="text/javascript"></script>
<script src="/Health_Friends/assets/api/se2/init.js" type="text/javascript"></script>

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
	vertical-align: middle;
}

.text01 {
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 45%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: ghostwhite;
}

.text02 {
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-40%, -50%);
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
}

.btn02 {
	background: royalblue;
}

.board_warp {
	width: 100%;
	margin: 2% 260px;
	padding: 10px 10px;
}

a {
	text-decoration: none;
	color: inherit;
}

.board_write {
	border-top: 2px solid #000;
}

.board_write .title, .board_write .info {
	padding: 15px;
}

.board_write .info {
	border-top: 1px dashed #ddd;
	border-bottom: 1px solid #000;
	font-size: 0;
}

.board_write .title dt, .board_write .title dd, .board_write .info dt,
	.board_write .info dd {
	display: inline-block;
	vertical-align: middle;
	font-size: 14px;
}

.board_write .title dt, .board_write .info dt {
	width: 80px;
}

.board_write .title dd {
	width: calc(100% - 100px)
}

.board_write .title input[type="text"], .board_write .info input[type="text"],
	.board_write .info input[type="password"] {
	padding: 10px;
	box-sizing: border-box;
}

.board_write .title input[type="text"] {
	width: 80%;
}

.board_write .title dl {
	font-size: 0;
}

.board_write .info dl {
	display: inline-block;
	width: 50%;
	vertical-align: middle;
}

.board_write .cont {
	border-bottom: 1px solid #000;
}

.board_write .cont textarea {
	display: block;
	width: 100%;
	height: 300px;
	padding: 15px;
	box-sizing: border-box;
	border: 0;
	resize: vertical;
}

.bt-wrap {
	margin-top: 30px;
	text-align: center;
	font-size: 0;
}

.bt_wrap a {
	display: inline-block;
	min-width: 80px;
	padding: 10px;
	border: 1px solid #000;
	border-radius: 2px;
	font-size: 14px;
}

.bt_wrap a:first-child {
	margin-left: 0;
}

.bt_wrap a.on {
	background: #000;
	color: #fff;
}

	.map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    
	table{
		width: 580px;
	}
	tr > th{
		text-align: left;
	}
	
</style>

</head>
<body>

		<%--동행게시판 --%>

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
 
 <jsp:useBean id="dto" class="com.board.dto.BoardDto" scope="request"></jsp:useBean>
<% RegistDto Ldto = (RegistDto)session.getAttribute("Ldto"); %> 
 
 	<div class="main02" style="text-align: center">
		<div style="font-size: 40px; font-weight: bold">동행 게시판 글쓰기</div>
		<br>
		<p>아름다운 글이 아름다운 페이지를 만듭니다</p>
		<br> <a href="  " class="btn btn02">메인 페이지</a> <a href="  "
			class="btn btn01">동행 구해요</a> <a href="  " class="btn btn01">사진후기</a>
		<a href="  " class="btn btn01">공지사항</a>
	</div>
 
 	<div class="board_warp">
		<div class="board_write_wrap">
			<div class="board_write">
				<div class="title">
					<dl>
						<dt>제목</dt>
						<dd>
							<input type="text" placeholder="제목 입력">
						</dd>
					</dl>
				</div>
				<div class="info">
					<dl>
						<dt>작성자</dt>
						<dd>${Ldto.member_id } </dd>
					</dl>
					<dl>
						<dt>작성일</dt>
						<dd>${dto.postMdate }</dd>
					</dl>
				</div>
				
		<section id="Board_writePost">
		<form action="" method="post">
			<input type="hidden" name="command" value="insertres"/>
			<table >
				<tr>
					<th style="padding:10px 10px">동행구해요</th>
				</tr>
				<tr>
					<td>${dto.postId }</td>
					<td>${dto.postMdate }</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="postTitle" style="padding: 10px 10px; width: 500px; height: 30px" placeholder="게시글 제목을 적어주세요"/>
					</td>
				</tr>
				<tr>
					<td class="exercise" style="padding:10px 10px">
						운동종류	<br/><br>
						<select name="chooseExercise">
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
					<td style="width:100%; height: auto;">
						<!-- 지도API : c6a1fbbb0976413a4f4996beefa8a351 -->
						운동경로	<br/>
						<p><em>지도를 클릭해주세요!</em></p> 
						<div class="map_wrap">
						    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
						    <div class="hAddr">
						        <span class="title">지도중심기준 행정동 주소정보</span>
						        <span id="centerAddr"></span>
						    </div>
						</div>
					
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
					            
					            var MapAddress = '<div class="bAddr">' +
					                            '<span class="title">법정동 주소정보</span>' + 
					                            detailAddr + 
					                        '</div>';
					
					            // 마커를 클릭한 위치에 표시합니다 
					            marker.setPosition(mouseEvent.latLng);
					            marker.setMap(map);
					
					            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					            infowindow.setContent(MapAddress);
					            infowindow.open(map, marker);
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
						<td style="width:100%">
							약속시간	<br/>
							<!-- 달력API -->
						 	<link href='/Health_Friends/assets/api/fullcalendar-5.6.0/lib/main.css' rel='stylesheet' />
						    <script src='/Health_Friends/assets/api/fullcalendar-5.6.0/lib/main.js'></script>
						    <script>
						      document.addEventListener('DOMContentLoaded', function() {
						        var calendarEl = document.getElementById('calendar');
						        var calendar = new FullCalendar.Calendar(calendarEl, {
						        	 dateClick: function(date, jsEvent, view) {
						        		 alert('Clicked on: ');
						        	 }
						        });
						        calendar.render();
						      });
						    </script>
					    <div id='calendar'></div>
					</td>
				</tr>
			</table>
		</form>
	</section>

			
			</div>
			
	</div>
		</div>
			
	
	<a href="   " class="on">등록</a> <a href="#">취소</a>
</body>
</html>
















