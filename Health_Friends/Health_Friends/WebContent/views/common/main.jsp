<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 동네 운동 메이트</title>
</head>
<body>
<%--메인페이지! --%>

	<%@include file="header.jsp" %>



		<!-- Banner -->
		<section class="banner full">
			<article>
				<img src="images/slide01.jpg" alt="" />
				<div class="inner">
					<header>
						<p>운동하고 싶으신가요?</p>
						<h2>우리</h2>
					</header>
				</div>
			</article>
			<article>
				<img src="images/slide02.jpg" alt="" />
				<div class="inner">
					<header>
						<p>혼자 하기는 싫으신가요?</p>
						<h2>동네</h2>
					</header>
				</div>
			</article>
			<article>
				<img src="images/slide03.jpg"  alt="" />
				<div class="inner">
					<header>
						<p>가나다라마바사아자차카타파하</p>
						<h2>운동</h2>
					</header>
				</div>
			</article>
			<article>
				<img src="images/slide04.jpg"  alt="" />
				<div class="inner">
					<header>
						<p>오요우유으이</p>
						<h2>아야어여</h2>
					</header>
				</div>
			</article>
			<article>
				<img src="images/slide05.jpg"  alt="" />
				<div class="inner">
					<header>
						<p>태정태세</p>
						<h2>문단세</h2>
					</header>
				</div>
			</article>
		</section>


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
				<h1>최근게시판</h1>
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
							<td><a href=""><img src="../../images/pic01.jpg" class="profile"></a></td>
							<td rowspan="2">경로</td>
							<td rowspan="2">게시글</td>
							<td><img src="../../images/icon/running.png"></td>
							<td><img src="../../images/icon/man.png"></td>
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





	<%@include file="footer.jsp" %>
	
</body>
</html>