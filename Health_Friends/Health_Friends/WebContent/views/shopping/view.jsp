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

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<script type="text/javascript">

	function getSearch() {
		let command = "search";
		let search = $("#txt_search").val();
		let keyword = encodeURIComponent(search);
		console.log("search : " +search)
		let url = "shopping.do?command="+command+"&keyword="+search;
		
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

	// div에 담아줘서 dom을 재구축해줌
	let wrapper = document.createElement('div');
	let cnt = 0;
	let result;
	// 엔터 쳤을때 검색기능 실행
	async function enter_event(event) {
		event.preventDefault();
		
		let res = await getSearch();
		result = res.result;
		
		for (cnt=0; cnt<20; cnt++) {
			let list = '<div class="col-md-3 col-sm-6"> <div class="product-grid3"> <div class="product-image3"> <a href="' 
			+ result[cnt].link + '" target=_sub > <img class="pic" src="' + result[cnt].image + '" + ""> </a> </div> <div class="product-content"> <h3 class="title">' + result[cnt].title + 
			'</a> </h3> <div class="price"> 최저가 : ' + result[cnt].lprice + '원 </div> <br> </div> </div> </div>'
			
			// 재구축한 dom에 태그들 넣어줌
			wrapper.innerHTML = list;
			// dom에 추가로 씌워진 div태그를 firstChild로 벗겨줌
			document.getElementById("start").append(wrapper.firstChild);
		}

		await scrollend();
	
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
	

	async function scrollend() {
		// 무한스크롤
		window.onscroll = await function(ev) {
    		if (((window.innerHeight + window.scrollY) >= document.body.offsetHeight) && result.length > cnt) {
    			let max = cnt + 20;
        		for (cnt; cnt<max; cnt++) {
        			console.log(cnt);
        			console.log(result)
        			let list = '<div class="col-md-3 col-sm-6"> <div class="product-grid3"> <div class="product-image3"> <a href="' 
        				+ result[cnt].link + '" target=_sub > <img class="pic" src="' + result[cnt].image + '" + ""> </a> </div> <div class="product-content"> <h3 class="title">' + result[cnt].title + 
        				'</a> </h3> <div class="price"> 최저가 : ' + result[cnt].lprice + '원 </div> <br> </div> </div> </div>'
        			
        				// 재구축한 dom에 태그들 넣어줌
        				wrapper.innerHTML = list;
        				// dom에 추가로 씌워진 div태그를 firstChild로 벗겨줌
        				document.getElementById("start").append(wrapper.firstChild);
        		}
    		}
		};
	}
	

	function GoTop() {
		window.scrollTo({
			top : 0,
			behavior : 'smooth'
		});
	}
</script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link href="assets/css/main.css" rel="stylesheet" type="text/css">
<link href="assets/css/shopping.css" rel="stylesheet" type="text/css" />
<title>우리동네 운동친구∴∵Heath Friends</title>

</head>

<body>

	<%@include file="../../header.jsp" %>

	<div style="text-align: center">
		<img
			src="images/shopping.jpeg"
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

	<div class="container">
		<h4>검색결과는 아래에 출력됩니다.</h4>
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