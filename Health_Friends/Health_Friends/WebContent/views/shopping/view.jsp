<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


	function goSearch(event) {

		event.preventDefault();
		var command = "search";
		var search = $("#txt_search").val();
		var keyword = encodeURIComponent(search);

		if (!keyword) {
			alert("먼저 검색어를 입력해 주십시오");
			return false;
		}
		if (keyword) {

						$.ajax({
									url : "../../shopping.do",
									method : "GET",
									data : {
										"command" : "search",
										"keyword" : keyword,
										"responseBody" : "responseBody"
									},
									dataType : "json",
									success : function(msg) {
			
										var list = msg.result;
										
										$('#start').html("");
										
										for (var i = 0; i < list.length; i++) {
											
											$('#start').append(
													'<div class="col-md-3 col-sm-6"> <div class="product-grid3"> <div class="product-image3"> <a href="' + list[i].link + '" target=_sub > <img class="pic" src="' + list[i].image + '" + ""> </a> </div> <div class="product-content"> <h3 class="title">' + list[i].title + '</a> </h3> <div class="price"> 최저가 : ' + list[i].lprice + '원 </div> <br> </div> </div> </div>');
					
										}
									},
									error : function() {
										alert("통신 실패");
									}
								});
		}
		
		var count = 0;
		window.onscroll = function(e) {

			if (list.length > 19) {
				if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {

					//실행할 로직 (콘텐츠 추가)
					count++;
				}
			}
		};
	}

	
	function getSearch() {
		let command = "search";
		let search = $("#txt_search").val();
		let keyword = encodeURIComponent(search);
		
		let url = "../../shopping.do?command="+command+"&keyword="+search;
		
		if (!keyword) {
				alert("먼저 검색어를 입력해 주십시오");
				return false;
		} else {
			return fetch(url).then(function(response) {
				return response.json();
			}).catch(function(err) {
				console.log(err);
			});
		}
		
	}
	
	
	// 엔터 쳤을때 검색기능 실행
	async function enter_event(event) {
		event.preventDefault();
		
		let res = await getSearch();
		const result = res.result;
		
		let list = result.map((item.idx) => '<div class="col-md-3 col-sm-6"> <div class="product-grid3"> <div class="product-image3"> <a href="' + item.link + '" target=_sub > <img class="pic" src="' + item.image + '" + ""> </a> </div> <div class="product-content"> <h3 class="title">' + item.title + '</a> </h3> <div class="price"> 최저가 : ' + item.lprice + '원 </div> <br> </div> </div> </div>' 
				).join('');
		list[0]
		
		document.getElementById("start").innerHTML += list.slice(0, 19);
		
		
	}

	

	// 화면 위로 보내기
	function scrollFunction() {
		var btn = document.getElementById('btn');
		if (document.body.scrollTop > 20
				|| document.documentElement.scrollTop > 20) {
			btn.style.display = "block";
		} else {
			btn.style.display = "none";
		}
	}

	function GoTop() {
		window.scrollTo({
			top : 0,
			behavior : 'smooth'
		});
	}
</script>

<style type="text/css">
.product-grid3 {
	font-family: Roboto, sans-serif;
	text-align: center;
	position: relative;
	z-index: 1
}

.product-grid3 .product-image3 {
	position: relative
}

.product-grid3 .product-image3 a {
	display: block
}

.product-grid3 .product-image3 img {
	width: 100%;
	height: 240px;
}

.product-grid3 .pic-1 {
	opacity: 1;
}

.product-grid3 .pic-2 {
	position: absolute;
	top: 0;
	left: 0;
	opacity: 100;
}

.product-grid3 .social {
	width: 120px;
	padding: 0;
	margin: 0 auto;
	list-style: none;
	opacity: 0;
	position: absolute;
	right: 0;
	left: 0;
	bottom: -23px;
	transform: scale(0);
	transition: all .3s ease 0s
}

.product-grid3:hover .social {
	opacity: 1;
	transform: scale(1)
}

.product-grid3 .social li {
	display: inline-block
}

.product-grid3 .social li a {
	color: #e67e22;
	background: #fff;
	font-size: 18px;
	line-height: 50px;
	width: 50px;
	height: 50px;
	border: 1px solid rgba(0, 0, 0, .1);
	border-radius: 50%;
	margin: 0 2px;
	display: block;
	transition: all .3s ease 0s
}

.product-grid3 .social li a:hover {
	background: #e67e22;
	color: #fff
}

.product-grid3 .product-discount-label, .product-grid3 .product-new-label
	{
	background-color: #e67e22;
	color: #fff;
	font-size: 17px;
	padding: 2px 10px;
	position: absolute;
	right: 10px;
	top: 10px;
	transition: all .3s
}

.product-grid3 .product-content {
	z-index: -1;
	padding: 15px;
	text-align: left
}

.product-grid3 .title {
	font-size: 18px;
	text-transform: capitalize;
	margin: 0 0 7px;
	transition: all .3s ease 0s
}

.product-grid3 .title a {
	color: #414141
}

.product-grid3 .price {
	color: violet;
	font-size: 16px;
	float: right;
	letter-spacing: 1px;
	font-weight: 600;
	margin-right: 2px;
	display: inline-block
}

.top {
	margin-bottom: 50px;
}

#btn {
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 99;
	border: none;
	font-size: 20px;
	padding: 15px;
	background-color: white;
	color: rgb(0, 183, 255);
	cursor: pointer;
	transition: 0.5s;
	display: none;
	border: 1px solid;
}

#btn:hover {
	background-color: rgb(0, 183, 255);
	color: white;
	border: 2px solid;
}
</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">

<title>쇼핑 검색 페이지</title>

</head>

<body>

	<div style="text-align: center">
		<img
			src="https://image.freepik.com/free-vector/people-doing-different-actions_52683-2299.jpg"
			style="width: 850px; height: 550px"> <br>

		<form id="search_form" onsubmit="enter_event(event);">
			<!-- 
		 <form id="search_form" onsubmit="goSearch(event);">
		 -->
			<div style="width: 100%; margin-top: 40px; text-align: center">
				<input type="text" name="txt_search" id="txt_search"
					style="width: 300px; height: 38px; vertical-align: top"
					placeholder=" 검색어를 입력하세요"> <input type="submit"
					class="btn btn-info" value="제출" />
			</div>
		</form>
		<br> <br> <br>
	</div>

	<br>
	<br>

	<div class="container">
		<h6>검색결과는 아래에 출력됩니다.</h6>
		<br> <br>
		<div class=container>

			<div class="row" id="main"></div>

			<div class="row" id="start"></div>

		</div>
	</div>

	<!-- 상단으로 이동하기 버튼 -->
	<div class="top">
		<button id="btn" onClick="GoTop()">▲</button>
	</div>

</body>
</html>