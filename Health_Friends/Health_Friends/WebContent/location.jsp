<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=%{encoding}"); %>

<!DOCTYPE html>
<html>
<head>
   
    <meta charset="utf-8">
    <title>마커 생성하기</title>
    
</head>

<body>

	<h2>우리 동네 운동 메이트 찾아오시는 길</h2>
	<div id="map" style="width:800px;height:500px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6920574193fbd921283dd9d416ec4e77"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.49898969280782, 127.03286905513882), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.49898969280782, 127.03286905513882); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>
</body>
</html>

<h3>우리 동네 운동 메이트 본사</h2>
<h4>주소 : 서울시 강남구 KH정보교육원 QClass</h3>
<h4>연락처 : 000-0000-0000</h3>
<h4>email : honggildong@gmail.com</h3>


<h3>대중교통<h3>

버스 이용시에는 

버스 역삼역 포스코 P&S타워 정류장 하자
<img src="">146 / 740 / 341 / 360        
<img src="">1100 / 1700 / 2000 / 7007 / 8001
<br>
<
<br>
<br>



지하철 이용시에는

지하철 2호선 역삼역 3번 출구에서 나온 후 도보 100m 이동.


<h4> about us<br>
우리 동네 운동 메이트<br>
조장 : 임기원<br> 
조원 : 강원기, 소윤정, 지 연, 손승현<br>
E-mail : honggildong@gmail.com<br>
주소 : 서울시 강남구 KH정보교육원<br>
전화번호 : 000-0000-0000<br></h4> 

</body>
</html>


