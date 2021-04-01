<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>우리 동네 운동 메이트</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<style>

.slide_wrapper {	
	position: relarive;
	width: 660px;
	margin : 0 auto;
	height: 200px;
	overflow:hidden
}

.slides {
	postion: absolute;
	left: 0; top: 0;
	
}

.pic01 > img {
	width: 240px;
	height: 280px
}

ul, ol {
list-style: none;
}

.board02 .board03 { list-style-type: none; float: left;}

.board01 .board03 .board05 a {
    display: block;
    width: 100px;
    height: 30px;
    line-height: 25px;
    margin: 0 auto;
    text-align: center;
    font-size: 15px;
    color: #7c808c;
    border: 1px solid #7c808c;
}

.board01 .board03 .board05 a:hover {
pointer: cursor;
color: hotpink;
}

.text01 {
	margin-top: 20px;
	transition: transform 0.7s, opacity 2.5s;
}


</style>

<script type="text/javascript">
		
	// 글자 위로 올라오는 기능
	function isElementUnderBottom(elem, triggerDiff) {
	  const { top } = elem.getBoundingClientRect();
	  const { innerHeight } = window;
	  return top > innerHeight + (triggerDiff || 0);
	}

	function handleScroll() {
	  const elems = document.querySelectorAll('.text01');
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

</script>



</head>
<body>
<%--메인페이지! --%>

<%-- header영역 --%>
	<header>
		<%@include file="header.jsp" %>
	</header>

<%-- Banner --%>

		<section class="banner full">
			<article>
				<img src="images/slide01.jpg" alt="" />
				<div class="inner">
					<header>
						<p style="font-size:40px"><b style="color:#FFD700">무료하시나요?</b></p>
						<h2><b style="color:#FFFAF0">밖에 나가 달려보는 건 어떠신가요</b></h2>
					</header>
				</div>
			</article>
			<article>
				<img src="images/slide02.jpg" alt="" />
				<div class="inner">
					<header>
						<p style="font-size:40px"><b style="color:#FFD700">외로우신가요?</b></p>
						<h2><b style="color:#FFFAF0">가까운 동네 친구를 만나보는 건 어떠신가요</b></h2>
					</header>
				</div>
			</article>
			<article>
				<img src="images/slide03.jpg"  alt="" />
				<div class="inner">
					<header>
						<p style="font-size:40px"><b style="color:#FFD700">귀찮으신가요?</b></p>
						<h2><b style="color:#FFFAF0">규칙적인 생활을 해보는 건 어떠신가요</b></h2>
					</header>
				</div>
			</article>
			<article>
				<img src="images/slide04.jpg"  alt="" />
				<div class="inner">
					<header>
						<p style="font-size:40px"><b style="color:#FFD700">우리동네 운동메이트</b></p>
						<h2><b style="color:#FFFAF0" >접속해 보는 건 어떠신가요</b></h2>
					</header>
				</div>
			</article>
			<article>
				<img src="images/slide05.jpg"  alt="" />
				<div class="inner">
					<header>
						<p style="font-size:40px"><b style="color:#FFD700">우리동네 운동메이트</b></p>
						<h2><b style="color:#FFFAF0">모든 것을 제공해 드립니다</b></h2>
					</header>
				</div>
			</article>
		</section>

<br>
<br>
<br>
<br>

<%--  --%>
<div class="container">
<div class="text01" style="font-size: 40px; text-align:center; color: black" ><b>우리 동네 운동 메이트</b>
<br><br>
<span class="text01" style="font-size: 25px; text-align:center">
우리동네 운동메이트는 <span><b style="color: hotpink">'국민 모두가 운동 친구가 되는 세상'</b></span>이라는 목표를 가지고<br>
전 국민이 건강한 생활을 지킬 수 있도록 만들어 갑니다.</span>
<br><br>
<p style="font-size: 20px; text-align:center;" class="text01">회원의 건강 증진을 최고의 가치로 삼으며 회원을 위해 최선을 다하자는 신념을 지켜 나가고 있는
<br>우리 동네 운동 메이트는 2021년 우리동네 운동 메이트 제작을 필두로 게시판, 쇼핑하기,<br>
채팅, 고객센터 등으로 구성된 헬스케어 웹 프로젝트입니다.
</p>

</div>
<br>
<br>
<br>

<%-- --%>

	<div class="board01" style="">
		<ul class="board02" style="">
			<li class="" style="">
			</li>
		<li class="board03">
			<div class="board04">
				<a href="" class="pic01"><img src="https://img4.yna.co.kr/photo/cms/2019/05/02/02/PCM20190502000402370_P2.jpg"></a>
			</div>
			<br>
			<div class="board05">
				<h4 class="board06" style="text-align: center">동행 게시판</h4>
				<a href="">상세보기 +</a>
			</div>
		</li>
		
		<li class="board03">
			<div class="board04">
			<a href="" class="pic01"><img src="https://img4.yna.co.kr/photo/cms/2019/05/02/02/PCM20190502000402370_P2.jpg">
			</a>
			</div>
			<br>
			<div class="board05">
				<h4 class="board06" style="text-align: center">후기 게시판</h4>
			<a href="">상세보기 +</a>
			</div>
		</li>
		
		<li class="board03">
			<div class="board04">
			<a href="" class="pic01"><img src="https://img4.yna.co.kr/photo/cms/2019/05/02/02/PCM20190502000402370_P2.jpg">
			</a>
			</div>
			<br>
			<div class="board05">
				<h4 class="board06" style="text-align: center">쇼핑 하기</h4>
			<a href="">상세보기 +</a>
			</div>
		</li>
		
		<li class="board03">
			<div class="board04">
			<a href="" class="pic01"><img src="https://img4.yna.co.kr/photo/cms/2019/05/02/02/PCM20190502000402370_P2.jpg">
			</a>
			</div>
			<br>
			<div class="board05">
				<h4 class="board06" style="text-align: center">고객 센터</h4>
			<a href="">상세보기 +</a>
			</div>
		</li>
		
		</ul>
	</div>
</div>
		

<%-- --%>
		<section>
			<span>
				<button class="main-button">
					운동약속<br> 하러가기
				</button>
			</span>
		</section>
	

	

	
	
	
	
	
	
		<!-- Section 나중에 세로길이 css 건들때 main.css에서 line-height: 2em; 수정-->
		
		<!-- 나중에 포문돌려서 3개정도 나오게 하던가 하면 될거같아요! -->
		<section id="main-board">
			<div class="inner">
				<h3>최근게시판</h3>
				<div class="box">
					<table class="main-board-table">
						<col width="100px">
						<col width="100px">
						<col width="300px">
						<col width="100px">
						<col width="100px">
						<col width="100px">
						<col width="100px">

						<tr>
							<td><a href=""><img src="images/pic01.jpg" class="profile"></a></td>
							<td rowspan="2">경로</td>
							<td rowspan="2">게시글</td>
							<td><img src="images/icon/running.png"></td>
							<td><img src="images/icon/man.png"></td>
							<td rowspan="2">찾는중</td>
							<td rowspan="2">글 등록시간</td>
							</tr>
							<tr>
							<td><a href="">닉네임</a></td>
							<td>약속장소</td>
							<td>약속시간</td>
						</tr>
					</table>
				</div>
			</div>
		</section>

<%-- footer 영역 --%>
	
	<footer>
		<%@include file="footer.jsp" %>
	</footer>
	
</body>
</html>