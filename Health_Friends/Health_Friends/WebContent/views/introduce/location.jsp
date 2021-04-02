<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=%{encoding}");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">

<title>오시는 길</title>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<link rel="stylesheet" href="location.css">


<script type="text/javascript">

// 글자 나타나기
$(document).ready(function(){
	$('.text01').fadeIn(2000);
	$('.text02').fadeIn(5000);
	$('.text03').fadeIn(7000);
});

// 글자 위로 올라오는 기능
function isElementUnderBottom(elem, triggerDiff) {
  const { top } = elem.getBoundingClientRect();
  const { innerHeight } = window;
  return top > innerHeight + (triggerDiff || 0);
}

function handleScroll() {
  const elems = document.querySelectorAll('.text04, .way01, .way02');
  elems.forEach(elem => {
    if (isElementUnderBottom(elem, 20)) {
      elem.style.opacity = "0";
      elem.style.transform = 'translateY(70px)';

    } else {
      elem.style.opacity = "1";
      elem.style.transform = 'translateY(0px)';

    }
  })
}
window.addEventListener('scroll', handleScroll);

// 화면 위로 보내기
function scrollFunction() { 
	var btn = document.getElementById('btn');
		if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) { btn.style.display = "block"; 
		} else { btn.style.display = "none"; } 
} 

function GoTop() { 
	window.scrollTo({top:0, behavior:'smooth'}); 
}

</script>

</head>
<body>

<!-- header 영역 시작 -->
	<header>
		<%@include file="../../views/common/header.jsp" %>
	</header>
<!-- header 영역 끝 -->
	
		<div class=background01>
		<div class="container01"><img src="https://cdn.crowdpic.net/list-thumb/thumb_l_37B48B380D5AEB177BF931C56704AA5C.jpg" style="width: 100%; height:auto;">
			<h1 class="text01" style="color: #FFFF00"><b>우리동네 운동메이트 오시는 길</b></h1>
			<br>
			<h3 class="text02" style="color: #E0FFFF">우리 동네 운동 서울시 강남구에 위치하고 있습니다.</h3>
			<br> <br>
			<h4 class="text03" style="color:#FFFAFA">
				승용차 이용시 건물 주차장에 주차하시고<br><br>
				대중교통 이용시 페이지 아래의 대중교통 이용방법을 참고하시길 바랍니다.</h4>
		</div>
	</div>
	
	<br>
	<a name="move01"></a>
	<div class="container">
		<div style="font-size: 36px; color: #00008B"><b>지도로 찾기</b></div>
		<br>
		<br>
		<div id="map" style="width: auto; height: 500px;"></div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6920574193fbd921283dd9d416ec4e77"></script>
	
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.49898969280782,
					127.03286905513882), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(37.49898969280782,
				127.03286905513882);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
	</script>

	<br>

	<div class="container">
	
	<div class="address">
		<h2 class="text04"><b>서울특별시 강남구 테헤란로 14길 6 <span style="color:hotpink">남도빌딩 2F, 3F, 4F, 5F, 6F</b></span></h2>
		<h2 class="text04">[TEL : 1544-9970]</h2>
		<h3 class="text04" style="color:grey">서울특별시 강남구 역삼동 남도빌딩(역삼동, 남도빌딩)</h3>
	</div>
	</div>
	<br>
	<br>
<hr>
<br>
<br>
	<div class="container">
	<div style="font-size: 36px; color: #00008B"><b>대중 교통 이용시</b></div><a name="move02"></a>
	<br><br>
		<div class="row">
			<div class="col-sm-6">
			 <img src="../../images/bus03.png" style="width:80px; height:80px;"><h3 class="way01"><b>&emsp;버스로 오시는 방법</b></h3><h4 style="color:gray" class="way01">&emsp;&nbsp;역삼역, 포스코P&S타워 정류장 하차</h4><br>
				<br><br>
				<img src="../../images/bus01.jpeg" style="width:20px; height:27px;"><h4 class="way02">&emsp;간선버스&emsp;146 / 740 / 341 / 360</h4><br>
				<img src="../../images/bus02.jpeg" style="width:20px; height:27px;"><h4 class="way02">&emsp;지선버스&emsp;1100 / 1700 / 2000 / 7007 / 8001</h4>
				<br>
				<br>
				<br>
				<br>
				<br>
			<img src="../../images/bus05.png" style="width:80px; height:80px;"><h3 class="way01"><b>&emsp;자가용 이용시</b></h3><h4 style="color:gray" class="way01">&emsp;&nbsp;자가용 이용시 <span style="color:hotpink"><b>반드시 주차권을 발급</b></span> 받으시길 바랍니다.</h4><br>			

	</div>

			<div class="col-sm-6">
				<img src="../../images/bus04.png" style="width:80px; height:80px;"><h3 class="way02"><b>&emsp;지하철로 오시는 방법</b></h3><h4 style="color:gray" class="way01">&emsp;&nbsp;지하철 2호선 <span style="color=pink">역삼역 3번 출구</span>로 나와서 100m 직진</h4>
				<br><br><br>
				<div></div><img src="../../images/yeoksam.png" style="width:450px; height:300px;"><div></div>

			</div>
		</div>
	</div>
	
    <div id="container"></div>
    	<div id="load" class="fa fa-circle-o-notch fa-spin"></div>
    		<button id="btn" onClick="GoTop()">▲</button>
    <script type="text/javascript" src="script.js"></script>


<br>
<br>
<br>
<br>

	<!-- 
	<div class="container">
	<table class="contact" cellpadding="0" cellspacing="0">
		<tbody>
			<tr>
				<th style="border-top:1px solid #222">주소</th>
				<td style="border-top:1px solid #222">서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F (T: 1544-9970 / F: 02-562-2378)</td>
			</tr>
			<tr>
				<th>버스</th>
				<td class="bus">
				역삼역, 포스코P&S타워 정류장
				<br>
				<img src="../../images/icon/bus01.jpeg" alt="">
				146 / 740 / 341 / 360 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="../../images/icon/bus02.jpeg" alt="">
				1100 / 1700 / 2000 / 7007 / 8001
			
				</td>
				</tr>
				<tr>
					<th style="border-bottom:1px solid #222">지하철</th>
					<td style="border0bottom:1px solid #222">지하철 2호선 역삼역 3번 출구 100m</td>
					</tr>
		</tbody>
	</table>
	</div>
-->

<!-- footer 시작 -->
	<footer style="background-color: #000000; color: #ffffff">
		<%@include file="../../views/common/footer.jsp" %>
	</footer>
<!-- footer 끝 -->

</body>
</html>