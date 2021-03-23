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
<title>우리 동네 운동 메이트 소개하기</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<style type="text/css">
.jumbotron {
	background-image: url(./image/back.jpeg);
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
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<h1 class="text-center">우리 동네 운동 메이트란?</h1>
			<br>
			<h4 class="text-center" style="text-color: write;">우리 동네 운동 메이트는
				어떻게 하면 모든 사람들이 행복한 운동을 할 수 있을까라는 사소한 생각으로부터 시작된 웹 프로젝트입니다.</h4>
			<br>
			<p class="text-center">
				<a class="btn btn-primary btn-lg" href="index.jsp" role="buttothn">소개
					보러 가기</a>
			</p>
		</div>
	</div>

	<div class="container">
		<a name="move01"></a>
		<h1>우리 동네 운동 메이트와 함께해요!</h1>
		<h3>우리 동네 운동 메이트는 이래서 만들어졌습니다.</h3>
		<br>
		<p>운동을 하고 싶지만 운동 메이트가 없어서 고민하시는 분을 위해 운동을 하고 싶지만 방법을 몰라 시작을 못하시는
			분을 위해 운동을 하고 싶지만 끈기가 없어서 쉽게 포기하시는 분을 위해 작은 만남을 제공함으로서 효과적인 운동 방법을
			제공합니다.</p>
		<br> <br> <br> <br> <br> <br>
		<br>
	</div>

	<div class=background02 style="background-color: #E8F5FF;">
		<br>
		<br>
		<br>
		<div class="container">
			<div class="row">
				<br>
				<div class="col-sm-6" style="background-color:;">
					<img
						src="https://health.chosun.com/site/data/img_dir/2019/04/29/2019042900839_0.jpg"
						class="img-circle" alt="Cinque Terre" height="300px" width="400px">
				</div>
				<div class="col-sm-6" style="background-color: lavenderblush;">
					<br> <br><br><br>
					 <a name="move02"></a>
					<h2>운동 메이트 구하기</h2>
					<h3 class="subheading">우리 동네 운동 메이트는 가까운 거리의 운동 메이트를 찾아줍니다</h3>
					<br> <br>
					<p class="text-muted">
					<p class="text-info">혼자 운동하기 지루하신 분들을 위해, 성격이 소극적이신 분들을 위해 가까운
						거리의 운동 메이트와 운동을 함으로서 건강과 친분을 동시에 챙길 수 있는 좋은 기회를 제공합니다.</p>
					<br> <br>
				</div>
			</div>
		</div>
		<br> <br> <br> <br> <br> <br> <br>


		<div class="container">
			<div class="row">
				<div class="col-sm-8" style="background-color: lavender;">
					<br> <br> <br> <a name="move03"></a>
					<h2>적절한 운동 방법</h2>
					<h3 class="subheading">우리 동네 운동 메이트는 적절한 운동 방법을 찾아줍니다.</h3>
					<br> <br>
					<p class="text-muted">게시판과 채팅을 통해 운동 방법을 공유하고 운동 메이트와 같이 운동을 통해
						올바른 운동 습관을 길러서 운동에 대한 관심과 흥미를 높일 수 있는 기회를 제공합니다.</p>
					<br> <br> <br>
				</div>
				<div class="col-sm-4" style="background-color:;">
					<br> <br> <br> <br> <br>
				</div>
			</div>
		</div>
		<br> <br> <br> <br> <br> <br>


		<div class="container">
			<div class="row">
				<div class="col-sm-4" style="background-color:;"></div>
				<div class="col-sm-8" style="background-color: lavenderblush;">
					<br> <br> <br> <a name="move04"></a>
					<h2>규칙적인 운동 계획</h2>
					<h3 class="subheading">우리 동네 운동 메이트는 꾸준한 운동을 할 수 있도록 도움을 줍니다.</h3>
					<p class="text-muted">스케쥴러를 통해 자신의 운동 일정을 스스로 정하여 꾸준한 운동 습관을 기룰
						수 있도록 도와주고 후기 게시판을 통해 좋은 정보를 공유하고 올바른 운동을 할 수 있도록 도움을 줍니다.</p>
					<br> <br> <br>
				</div>
			</div>
		</div>

		<br> <br> <br> <br>
</div>

<br><br>

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
							조장 : 임기원</br> 조원 : 강원기 소윤정 지 연 손승현
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
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
</html>


대한민국 국민들 모두가 친구가 되는 날까지 우리 동네 운동 메이트는 계속됩니다.





</body>
</html>