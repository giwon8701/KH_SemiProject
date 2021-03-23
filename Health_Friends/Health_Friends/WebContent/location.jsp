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
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<style type="text/css">
.jumbotron {
	background-image:
		url('https://wonderfulmind.co.kr/_next/image?url=https%3A%2F%2Fwonderfulmind.co.kr%2Fwp-content%2Fuploads%2F2017%2F09%2F%EC%9A%B4%EB%8F%99%ED%95%98%EB%8A%94-%EC%BB%A4%ED%94%8C.jpg&w=2048&q=75');
	background-size: cover;
	text-shadow: block 0.2em 0.2em 0.2em;
	color: black;
}
</style>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">우리동네 운동메이트</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-naver-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">소개<span class="sr-only"></span></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">우리동네 운동 메이트<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="index.jsp">우리 동네 운동 메이트란?</a>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">오시는 길<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#move01">지도 보러가기</a></li>
							<li><a href="#move02">교통 보러가기</a></li>
						</ul></li>
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
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<h1 class="text-center">오시는 길</h1>
			<br>
			<h4 class="text-center" style="text-color: write;">우리 동네 운동메이트는
				서울시 강남구에 위치하고 있습니다.</h4>
			<br>
			<p class="text-center">
				<a class="btn btn-primary btn-lg" href="#move02" role="buttothn">교통
					보러가기</a>
			</p>
		</div>
	</div>
	<a name="move01"></a>
	<div class="container">
		<h2>찾아오시는 길</h2>
		<div id="map" style="width: 940px; height: 500px;"></div>
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
		<h3>우리 동네 운동 메이트 본사</h3>
		<h4>주소 : 서울시 강남구 KH정보교육원 QClass</h4>
		<style>
.indent {
	text-indent: 30px;
}
</style>
		<a><h4 class=indent>연락처 : 000-0000-0000</h4></a> <a><h4
				class=indent>fax : 000-0000-0000</h4></a> <a><h4 class=indent>email
				: honggildong@gmail.com</h4></a>
	</div>

	<br>

	<div class="container">
		<br> <a name="move02"></a>
		<h2>대중교통</h2>

		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<img src=./image/bus.png alt="버스" height="160" width="160">
				</div>
				<div class="col-sm-8" style="background-color: lavenderblush;">
					<h3 class="subheading">버스 이용시에는</h3>
					<br>
					<p class="text-muted">
						버스 역삼역 포스코 P&S타워 정류장 하자 <br> <br> <img src=""> 146
						/ 740 / 341 / 360 <br> <img src=""> 1100 / 1700 / 2000
						/ 7007 / 8001 <br>
					</p>
					<br>
				</div>
			</div>
		</div>

		<br>

		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<img src=./image/metro.png alt="지하철" height="160" width="160">
				</div>
				<div class="col-sm-8" style="background-color: lavenderblush;">
					<h3 class="subheading">지하철 이용시에는</h3>
					<br>
					<p class="text-muted">지하철 2호선 역삼역 3번 출구에서 나온 후 도보 100m 이동</p>
					<br>
				</div>
			</div>
		</div>
		<br> <br> <br> <br> <br> <br> <br>
	</div>

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
						조장 : 임기원</br> 조원 : 강원기 소윤정 지 연 손승현
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
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>


