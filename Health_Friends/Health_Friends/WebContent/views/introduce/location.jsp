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
<link rel="stylesheet" href="location.css">

<script type="text/javascript">

// 글자 위로 올라오는 기능
function isElementUnderBottom(elem, triggerDiff) {
  const { top } = elem.getBoundingClientRect();
  const { innerHeight } = window;
  return top > innerHeight + (triggerDiff || 0);
}

function handleScroll() {
  const elems = document.querySelectorAll('.way01, .way02');
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
	
	<header>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">소개하기</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navber-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">메뉴<span class="sr-only"></span></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">우리동네 운동 메이트<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="introduce.jsp">우리 동네 운동 메이트란?</a>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">오시는 길<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#move01">지도 보기</a></li>
							<li><a href="#move02">교통 보기</a></li>
						</ul>
					</li>
				</ul>
				<form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form=control" placeholder="내용을 입력하세요.">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
				</form>
				<ul class="nav navbar=nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">로그인</a></li>
							<li><a href="#">회원가입</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	</header>	
	
	<br><br>
	
	<div class="container">
		<div class="jumbotron">
			<h1 class="text-center" id="main01">오시는 길</h1>
			<br>
			<h3 class="text-center" id="main02">우리 동네 운동메이트는
				<span style="color:#F08080">서울시 강남구 역삼역</span>에 위치하고 있습니다.</h3>
			<br>
			<p class="text-center">
				<a class="btn btn-primary btn-lg" href="#move02" role="buttothn">교통
					보기
				</a>
			</p>
		</div>
	</div>
	<br>
	<a name="move01"></a>
	<div class="container">
		<h2>지도로 찾기</h2>
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
		<h2>서울특별시 강남구 테헤란로 14길 6 <span style="color:hotpink">남도빌딩 2F, 3F, 4F, 5F, 6F</span></h2>
		<h2>[TEL : 1544-9970]</h2>
		<h3 style="color:grey">서울특별시 강남구 역삼동 남도빌딩(역삼동, 남도빌딩)</h3>
	</div>
	</div>
	<br>
<hr>
<br>
<br>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
			 <img src="../../images/bus03.png" style="width:80px; height:80px;"><h3 class="way01">&emsp;버스로 오시는 방법</h3><h4 style="color:gray" class="way01">&emsp;&nbsp;역삼역, 포스코P&S타워 정류장 하차</h4><br>
				<br><br>
				<img src="../../images/bus01.jpeg" style="width:20px; height:27px;"><h4 class="way02">&emsp;간선버스&emsp;146 / 740 / 341 / 360</h4><br>
				<img src="../../images/bus02.jpeg" style="width:20px; height:27px;"><h4 class="way02">&emsp;지선버스&emsp;1100 / 1700 / 2000 / 7007 / 8001</h4>
				<br>
				<br>
				주변 건물
			
			</div>

			<div class="col-sm-6">
				<img src="../../images/bus04.png" style="width:80px; height:80px;"><h3 class="way02">&emsp;지하철로 오시는 방법</h3><h4 style="color:gray" class="way01">&emsp;&nbsp;지하철 2호선 <span style="color=pink">역삼역 3번 출구</span>로 나와서 100m 직진</h4>
				<br><br>
				<div></div><img src="../../images/yeoksam.png" style="width:400px; height:250px;"><div></div>
				<br>
			
				<h4 class="text-info">주변 건물 : 신한은행 역삼지점, 코리아 IT 아카데미</h4>
				<h2 class="subheading" style="text-align: right">
				</h2>
				<br>
				<br>
				<div>
				<p class="text-muted">
				<h4 class="text-info" style="text-align: right">
				</h4>
				<br> <br> <br>
			</div>
		</div>
	</div>
</div>

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
<br>
<br>

<div class="top"> 
	<button id="btn" onClick="GoTop()">▲</button> 
</div> 
 <script type="text/javascript" src="script.js"></script>

	<footer style="background-color: #000000; color: #ffffff">
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-2" style="text-align: center;">
					<h5>Copyright &copy;</h5>
					<h5>우리동네 운동메이트</h5>
				</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-4">
					<h4>만든이 소개</h4>
					<p>
						조장 : 임기원<br> 조원 : 강원기 소윤정 지 연 손승현
					</p>
				</div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2"></div>
				<div class="col-sm-2">
					<h4 style="text-align: center;">
						<span class="glyphicon glyphicon-ok"></span>&nbsp; by 세미 5조
					</h4>
				</div>
			</div>
		</div>		
	</footer>

</body>
</html>


