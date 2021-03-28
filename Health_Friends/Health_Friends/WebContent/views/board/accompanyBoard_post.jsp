<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
	kakao map javascript key :  c6a1fbbb0976413a4f4996beefa8a351
	naver calendar : id: p6N_JsQoah3hCrLJR428
					 pw: Ekh0RH5rfu
-->
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script src="/Health_Friends/assets/api/se2/js/HuskyEZCreator.js" type="text/javascript"></script>
<script src="/Health_Friends/assets/api/se2/init.js" type="text/javascript"></script>
<style type="text/css">
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
 	<section class="boardlist">
		<a href="">동행 구해요</a>
		
		<a href="">후기</a>
		<a href="">공지사항</a>
	</section>
 
	<section id="Board_writePost">
		<form action="" method="post">
			<input type="hidden" name="command" value=""/>
			<table border="1">
				<tr>
					<th colspan="3">동행구해요</th>
				</tr>
				<tr>
					<td colspan="3">
						<input type="text" placeholder="게시글 제목을 적어주세요"/>
					</td>
				</tr>
				<tr>
					<td>
						운동종류	<br/>
						<input type="text" id="exercise" placeholder="원하는 운동을 적어주세요">
					</td>
					<td>
						운동경로	<br/>
					<div id="map" style="width:100%;height:350px;"></div>
					<p><em>지도를 클릭해주세요!</em></p> 
					<div id="clickLatlng"></div>
					
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6a1fbbb0976413a4f4996beefa8a351"></script>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = { 
						        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 3 // 지도의 확대 레벨
						    };
						
						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						
						// 지도를 클릭한 위치에 표출할 마커입니다
						var marker = new kakao.maps.Marker({ 
						    // 지도 중심좌표에 마커를 생성합니다 
						    position: map.getCenter() 
						}); 
						// 지도에 마커를 표시합니다
						marker.setMap(map);
						
						// 지도에 클릭 이벤트를 등록합니다
						// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
						kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
						    
						    // 클릭한 위도, 경도 정보를 가져옵니다 
						    var latlng = mouseEvent.latLng; 
						    
						    // 마커 위치를 클릭한 위치로 옮깁니다
						    marker.setPosition(latlng);
						    
						    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
						    message += '경도는 ' + latlng.getLng() + ' 입니다';
						    
						    var resultDiv = document.getElementById('clickLatlng'); 
						    resultDiv.innerHTML = message;
						    
						});
					</script>
						<a href="">클릭!</a>
					</td>
					<td>
						약속시간	<br/>
					 	<link href='/Health_Friends/assets/api/fullcalendar-5.5.1/lib/main.css' rel='stylesheet' />
					    <script src='/Health_Friends/assets/api/fullcalendar-5.5.1/lib/main.js'></script>
					    <script>
					
					      document.addEventListener('DOMContentLoaded', function() {
					        var calendarEl = document.getElementById('calendar');
					        var calendar = new FullCalendar.Calendar(calendarEl, {
					          initialView: 'dayGridMonth'
					        });
					        calendar.render();
					      });
					
					    </script>	
					    <div id='calendar'></div>
						<a href="">클릭!</a>
					</td>
				</tr>
				<tr>
					<td colspan="3" id="Board_writeContent">
						<textarea id="se2" name="se2" class="smarteditor2"></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" value="글작성">
		</form>
	</section>
<%--	
	<%@include file="footer.jsp" %>
--%>
</body>
</html>















