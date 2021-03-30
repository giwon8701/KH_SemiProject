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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">

* {
	font-family: 'Noto Sans KR', sans-serif;
}

#bus, subway {

}
		
.jumbotron {
	background-image:
		url("https://cdn.crowdpic.net/list-thumb/thumb_l_37B48B380D5AEB177BF931C56704AA5C.jpg");
	background-size: cover;
	text-shadow: block 0.2em 0.2em 0.2em;
}

#main01, #main02 {
	color: white;
}


#bus_text {
	font-size: 20px;
}

.btn_gotop {
	display:none;
	position:fixed;
	bottom:30px;
	right:30px;
	z-index:999;
	border:1px solid #ccc;
	outline:none;
	background-color:white;
	color:#333;
	cursor:pointer;
	padding:15px 20px;
	border-radius:100%;
}

</style>

<script>

$(window).scroll(function(){
	if ($(this).scrollTop() > 300){
		$('.btn_gotop').show();
	} else{
		$('.btn_gotop').hide();
	}
});

$('.btn_gotop').click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
});

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
							<li><a href="#move01">지도 보러가기</a></li>
							<li><a href="#move02">교통 보러가기</a></li>
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
				서울시 강남구 역삼역에 위치하고 있습니다.</h3>
			<br>
			<p class="text-center">
				<a class="btn btn-primary btn-lg" href="#move02" role="buttothn">교통
					보러가기
				</a>
			</p>
		</div>
	</div>
	<a name="move01"></a>
	<div class="container">
		<h2>지도로 찾기</h2>
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

	</div>

	<br>

	<div class="container">
		<br> <a name="move02"></a>
		<h2>대중교통</h2>
		<br><br>

		<div class="container">
			<div class="row">
				<div class="col-sm-4">
							<h3>우리 동네 운동 메이트 주소</h3>
		<h4>새주소 : 서울시 강남구 KH정보교육원 QClass</h4>
		<h4>기존 주소 : </h4>
		<h4>연락처 : 000-0000-0000</h4>
		<h4>fax : 000-0000-0000</h4>
		<h4>email : honggildong@gmail.com</h4>
				</div>
				<div class="col-sm-8" style="background-color: lavenderblush;">
					<h3 class="subheading" id="bus">버스 이용시</h3>
					<br>
					<p class="text-info" id="bus_text">
						버스 역삼역 포스코 P&S타워 정류장 하자 <br> <br> <img src=""> 146
						/ 740 / 341 / 360 <br> <img src=""> 1100 / 1700 / 2000
						/ 7007 / 8001 <br>
					</p>
					<br>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-sm-4">
				</div>
				<div class="col-sm-8" style="background-color: lavenderblush;">
					<h3 class="subheading" id="subway">지하철 이용시</h3>
					<br>
					<p class="text-info" id="bus_text">지하철 2호선 역삼역 3번 출구에서 나온 후 도보 100m 이동</p>
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
		
	<!-- 상단으로 이동하기 버튼 -->
	<a href="#" class="btn_gotop">
	  <span class="glyphicon glyphicon-chevron-up">
	  </span>
	</a>
			
	</footer>



</body>
</html>


