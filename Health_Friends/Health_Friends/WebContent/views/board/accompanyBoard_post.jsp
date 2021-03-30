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
						<select name="exercise">
							<optgroup label="맨발운동">
								<option value="slow_walk">느리게 걷기</option>
								<option value="fast_walk">빠르게 걷기</option>
								<option value="running">달리기</option>
							</optgroup>
							<optgroup label="라이딩">
								<option value="bike_riding">자전거</option>
								<option value="skate_boarding">스케이트보드</option>
								<option value="inline_skating">인라인스케이트(롤러브레이드)</option>
							</optgroup>
							<optgroup label="구기운동">
								<option value="basket_ball">농구</option>
								<option value="dodge_ball">피구</option>
								<option value="tennis">테니스</option>
							</optgroup>
						
						</select>
					</td>
					<td>
						운동경로	<br/>
						<p><em>지도를 클릭해주세요!</em></p> 
						<div id="map" style="width:100%;height:350px;"></div>
						<div id="clickLatlng"></div>
						
						<!-- 지도API -->
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
						</td>
						<td>,ㅡ 
							약속시간	<br/>
							<!-- 달력API -->
						 	<link href='/Health_Friends/assets/api/fullcalendar-5.6.0/lib/main.css' rel='stylesheet' />
						    <script src='/Health_Friends/assets/api/fullcalendar-5.6.0/lib/main.js'></script>
						    <script>
						      document.addEventListener('DOMContentLoaded', function() {
						        var calendarEl = document.getElementById('calendar');
						        var calendar = new FullCalendar.Calendar(calendarEl, {
						        	 dateClick: function(date, jsEvent, view) {
						        		 alert("--");
						        	 }
						        });
						        calendar.render();
						      });
						    </script>
						    
					    <div id='calendar'></div>
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















