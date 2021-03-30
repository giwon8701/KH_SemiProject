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

<title>우리 동네 운동 메이트 소개하기</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 슬라이드 라이브러리 -->
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">
<link rel="stylesheet" href="introduce.css">


<script>

	$(window).scroll(function() {
		if ($(this).scrollTop() > 300) {
			$('.btn_gotop').show();
		} else {
			$('.btn_gotop').hide();
		}
	});

	$('.btn_gotop').click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 400);
		return false;
	});
	
	// 글자 위로 올라오는 기능
	$(document).ready(function() {
	    $(window).scroll( function(){
	        $('.col-sm-5').each( function(i){
	            
	            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
	            var bottom_of_window = $(window).scrollTop() + $(window).height();
	            
	            if( bottom_of_window > bottom_of_element ){
	                $(this).animate({'opacity':'1','margin-left':'0px'},1000);
	            }
	            
	        }); 
	    });
	});
	
	// 슬라이드 기능
    $(document).ready(function(){
    	
        var slide1 = $('.slider').bxSlider({
        auto: true,
        pause: 2000
   	});
	
		$('.controls .play').on('click', function() {
			slide1.startAuto();
		})
		$('.controls .pause').on('click', function() {
			slide1.stopAuto();
		})
	
	});
	
</script>

</head>
<body>

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
				id="bs-example-naver-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">메뉴<span class="sr-only"></span></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">우리동네 운동 메이트<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#move01">함께해요</a>
							<li><a href="#move02">운동 메이트 구하기</a></li>
							<li><a href="#move03">적절한 운동 방법</a></li>
							<li><a href="#move04">규칙적인 운동 계획</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">오시는 길<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="location.jsp">교통과 지도</a></li>
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
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<div class="container">
		<div class="jumbotron">
			<h1 class="text-center" id="main01">우리 동네 운동 메이트란?</h1>
			<br>
			<h4 class="text-center" id="main02">우리 동네 운동 메이트는<span style="color: #ff1493">
				"어떻게 하면 모든 사람들이 행복한 운동을 할 수 있을까?"</span>라는 사소한 생각으로부터 시작된 웹 프로젝트입니다.</h4>
			<br>
			<p class="text-center">
				<a class="btn btn-primary btn-lg" href="#move02" role="buttothn">소개보러 가기</a>
			</p>
		</div>
	</div>
	<br>
	
<!-- 사진 전환 기능 시작 -->
	<div class="slider">
		<div><img src="https://i.medicaldevicetrend.com/img/informasi-kesehatan/53/olahraga-terlalu-lama-itu-tidak-perlu-ini-alasannya.jpg" alt="슬라이드 사진"></div>
		<div><img src="https://i.medicaldevicetrend.com/img/informasi-kesehatan/53/olahraga-terlalu-lama-itu-tidak-perlu-ini-alasannya.jpg" alt="슬라이드 사진"></div>
		<div><img src="https://i.medicaldevicetrend.com/img/informasi-kesehatan/53/olahraga-terlalu-lama-itu-tidak-perlu-ini-alasannya.jpg" alt="슬라이드 사진"></div>
		<div><img src="https://i.medicaldevicetrend.com/img/informasi-kesehatan/53/olahraga-terlalu-lama-itu-tidak-perlu-ini-alasannya.jpg" alt="슬라이드 사진"></div>
		<div><img src="https://i.medicaldevicetrend.com/img/informasi-kesehatan/53/olahraga-terlalu-lama-itu-tidak-perlu-ini-alasannya.jpg" alt="슬라이드 사진"></div>			
	</div>
	<div class="controls">
		<button class="play">재생</button>
		<button class="pause">정지</button>
	</div>
<!-- 사진 전환 기능 끝 -->
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
<!-- 개요 시작 -->
	<div class=background01 style="background-color: #FFFFF0">
		<br> <br> <br>
		<div class="container">
			<a name="move01"></a>
			<h1 style="text-align: center">우리 동네 운동 메이트와 함께해요!</h1>
			<br>
			<h3 style="text-align: center">우리 동네 운동 메이트는 이래서 만들어졌습니다.</h3>
			<br> <br>
			<h4 style="text-align: center">
				운동을 하고 싶지만 운동 메이트가 없어서 고민하시는 분을 위해,<br> <br> 운동을 하고 싶지만
				방법을 몰라 시작을 못하시는 분들을 위해,<br> <br> 운동을 하고 싶지만 끈기가 없어서 쉽게
				포기하시는 분을 위해,<br> <br> <br>
			</h4>
			<h3 style="text-align: center">작은 만남을 제공함으로서 효과적인 운동 방법을 제공합니다.</h3>
			<br> <br> <br> <br> <br>
		</div>
	</div>
<!-- 개요 끝 -->
	<br>
	<br>
	<br>


<!-- 소개하기 시작 -->
<div class=background02 style="background-color: #F8F8FF;">
	<br> <br> <br>
	<div class="container">
		<div class="row">

			<div class="col-sm-7" style="background-color:">
				<br>
				<br> <img
					src="https://health.chosun.com/site/data/img_dir/2019/04/29/2019042900839_0.jpg"
					class="img-thumbnail" alt="Cinque Terre"><br>
				<br>
				<br>
				<br>
				<br>

			</div>

			<div data-trigger class="col-sm-5" style="background-color:">
				<br> <br> <a name="move02"></a>
				<h1 class="title01"
					style="font-family: Jua, sans-serif">운동 메이트
					구하기</h1>
				<br>
				<h2 class="subheading">
					우리 동네 운동 메이트는<br>가까운 거리의 운동 메이트를<br>찾아줍니다
				</h2>
				<br> <br>
				<p class="text-muted">
				<h4 class="text-info">
					"혼자 운동하기 지루하신 분들을 위해,<br>
					<br>성격이 소극적이신 분들을 위해<br>
					<br>가까운 거리의 운동 메이트와 운동을 함으로서<br>
					<br>건강과 친분을 동시에 챙길 수 있는 기회를 제공합니다."
				</h4>
				<br> <br>
			</div>
		</div>
	</div>
	<br> <br> <br> <br> <br> <br> <br>


	<div class="container">
		<div class="row">
			<div class="col-sm-5" style="background-color:">
				<br> <br> <br> <a name="move03"></a>
				<h1 class="title01" style="font-family: Jua, sans-serif; text-align: left;">적절한 운동
					방법</h1>
				<br>
				<h2 class="subheading" style="text-align: left" >
					우리 동네 운동 메이트는<br>적절한 운동 방법을<br>찾아줍니다.
				</h2>
				<br> <br>
				<p class="text-muted">
				<h4 class="text-info" style="text-align: left">
					"게시판과 채팅을 통해 운동 방법을 공유하고<br>
					<br>운동 메이트와 같이 운동을 통해 <br>
					<br>올바른 운동 습관을 길러서<br>
					<br>운동에 대한 관심과 흥미를 높이는 기회를 제공합니다."
				</h4>
				<br> <br> <br>
			</div>
			<div class="col-sm-7" style="background-color:">
				<br>
				<br>
				<br>
				<br> <img
					src="https://health.chosun.com/site/data/img_dir/2018/09/03/2018090301669_0.jpg"
					class="img-thumbnail" alt="Cinque Terre" style="float: right"><br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>

			</div>
		</div>
	</div>
	<br> <br> <br> <br> <br> <br>


	<div class="container">
		<div class="row">

			<div class="col-sm-7" style="background-color:">
				<br>
				<br>
				<br>
				<br>
				<br> <img
					src="https://t1.daumcdn.net/cfile/tistory/145C4A4150E5381F2E?original"
					class="img-thumbnail" alt="Cinque Terre"><br>
				<br>
				<br>
				<br>
				<br>
				<br>

			</div>

			<div class="col-sm-5" style="background-color:">
				<br> <br> <br> <a name="move04"></a>
				<h1 class="title01"
					style="font-family: Jua, sans-serif; text-align: right">규칙적인
					운동 계획</h1>
				<br>
				<h2 class="subheading" style="text-align: right">
					우리 동네 운동 메이트는<br>꾸준한 운동을 할 수 있도록<br>도움을 줍니다.
				</h2>
				<br>
				<br>
				<p class="text-muted">
				<h4 class="text-info" style="text-align: right">
					"스케쥴러를 통해 자신의 운동 일정을 스스로 정하여<br>
					<br>꾸준한 운동 습관을 기룰 수 있도록 도와주고<br>
					<br> 후기 게시판을 통해 좋은 정보를 공유하고<br>
					<br>올바른 운동을 할 수 있도록 도움을 줍니다."
				</h4>
				<br> <br> <br>
			</div>
		</div>
	</div>
</div>
<!-- 소개하기 끝 -->

<br>
<br>
<br>

<!-- 조원 소개하기 시작 -->
<div style="font-size: 40px">우리 동네 운동 메이트 조원</div><br>

<div class="wrapper">
	<ul class="team">
		<li class="team-item">
			<div class="profile profile_red">
				<img
					src="https://post-phinf.pstatic.net/MjAyMTAzMDFfMTkz/MDAxNjE0NTgwNjMyNTM3.2O-VrXmnSaD-hK2loLB9uC5975b8Fo074VC2uMOw_zcg.2qrNXPHxyh_QtmTbwfSDTtx9SvxAEG8AGhY_cI1WHfYg.JPEG/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2021-03-01_%EC%98%A4%ED%9B%84_3.36.54.jpg?type=w1200">
				<div class="profile-contents">
					<h2>
						임기원 <span>조  장</span>
					</h2>
					<p>열심히 하겠습니다.</p>
				</div>
			</div>
		</li>
		<li class="team-item">
			<div class="profile profile_beige">
				<img
					src="https://post-phinf.pstatic.net/MjAyMTAzMDFfMTkz/MDAxNjE0NTgwNjMyNTM3.2O-VrXmnSaD-hK2loLB9uC5975b8Fo074VC2uMOw_zcg.2qrNXPHxyh_QtmTbwfSDTtx9SvxAEG8AGhY_cI1WHfYg.JPEG/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2021-03-01_%EC%98%A4%ED%9B%84_3.36.54.jpg?type=w1200">
				<div class="profile-contents">
					<h2>
						강원기 <span>조  원</span>
					</h2>
					<p>열심히 하겠습니다.</p>
				</div>
			</div>
		</li>
		<li class="team-item">
			<div class="profile profile_green">
				<img
					src="http://the-star.co.kr/site/data/img_dir/2020/10/30/2020103080040_0.jpg">
				<div class="profile-contents">
					<h2>
						소윤정 <span>조  원</span>
					</h2>
					<p>열심히 하겠습니다.</p>
				</div>
			</div>
		</li>
		<li class="team-item">
			<div class="profile profile_pink">
				<img
					src="http://the-star.co.kr/site/data/img_dir/2020/10/30/2020103080040_0.jpg">
				<div class="profile-contents">
					<h2>
						지  연 <span>조  원</span>
					</h2>
					<p>열심히 하겠습니다.</p>
				</div>
			</div>
		</li>
		<li class="team-item">
			<div class="profile profile_purple">
				<img
					src="https://post-phinf.pstatic.net/MjAyMTAzMDFfMTkz/MDAxNjE0NTgwNjMyNTM3.2O-VrXmnSaD-hK2loLB9uC5975b8Fo074VC2uMOw_zcg.2qrNXPHxyh_QtmTbwfSDTtx9SvxAEG8AGhY_cI1WHfYg.JPEG/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2021-03-01_%EC%98%A4%ED%9B%84_3.36.54.jpg?type=w1200">
				<div class="profile-contents">
					<h2>
						손승현 <span>조  원</span>
					</h2>
					<p>열심히 하겠습니다.</p>
				</div>
			</div>
		</li>
	</ul>
</div>
<!-- 조원 소개하기 끝 -->

<br>
<br>
<br>

<!-- footer 시작 -->
<footer style="background-color: #000000; color: #ffffff">

	<div class="container">
		<br>
		<div class="row">
			<div class="col-sm-3" style="text-align: left;">
				<h5>Copyright &copy;</h5>
				<h5>우리동네 운동메이트</h5>
			</div>
			<div class="col-sm-6">
				<h4>조원 소개</h4>
				<p>
					조장 : 임기원<br> 조원 : 강원기 소윤정 지 연 손승현
				</p>
			</div>
			<div class="col-sm-2">
				<h4 style="text-align: left;">
					<span class="glyphicon glyphicon-ok"></span>&nbsp; by 세미 5조
				</h4>
			</div>
		</div>
	</div>
	<br>	
	
</footer>

<!-- footer 끝 -->
	
<!-- 상단으로 이동하기 버튼 시작 -->
<a href="#" class="btn_gotop"> <span
	class="glyphicon glyphicon-chevron-up"> </span>
</a>
<!-- 상단으로 이동하기 버튼 끝 -->

</body>
</html>