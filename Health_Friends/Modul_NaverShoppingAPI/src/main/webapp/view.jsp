<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">

	let count = 1;
	
	// 엔터 쳤을때 검색기능 실행
	async function enter_event(event) {
		event.preventDefault();		// submit 클릭시 새로고침 방지
		
		// res에 getSearch()의 리턴값이 담길때 까지 대기함
		let res = await getSearch();
		// 위에서 받아온 res의 리턴값에서 key: "result" 만 가져옴
		let result = res.result;
		
		for (let cnt=0; cnt<result.length; cnt++) {
			// 위의 result를 우리가 html에 표현하기위해서 아래와 같이 작성해줌
			let list =  count++ +" 번째 값<br>"
						+ "result["+cnt+"].link = " + result[cnt].link + "<br>"
						+ "result["+cnt+"].image = " + result[cnt].image + "<br>"
						+ "result["+cnt+"].title = " + result[cnt].title + "<br>"
						+ "result["+cnt+"].lprice = " + result[cnt].lprice + "<br>"
						+ "result["+cnt+"].brand = " + result[cnt].brand + "<br>"
						+ "result["+cnt+"].category3 = " + result[cnt].category3 + "<br><br>";

			// div에 담아줘서 dom을 재구축해줌
			let wrapper = document.createElement('p');
			
			// 재구축한 dom에 태그들 넣어줌
			wrapper.innerHTML = list;
			
			// dom에 추가로 씌워진 div태그를 firstChild로 벗겨줌
			document.getElementById("start").append(wrapper);
		}
	}
	
	function getSearch() {
		let search = document.getElementById("txt_search").value;	// 검색한 값을 가져옴
		let keyword = encodeURIComponent(search);	// URI인코딩을 해줌
		let url = "shopping.do?keyword="+search;	// 서블릿으로 보내줄 url을 만들어줌
		
		if (!keyword) {	// keyword(검색어)가 없을 때
				alert("먼저 검색어를 입력해 주십시오");
				return false;
		} else {	// keyword(검색어)가 있을 때
			// fetch = url을 실행시켜줌
			// then() {} = fetch를 통해 가져온 리턴값을 파라미터로 받아옴
			return fetch(url).then(function(response) {
				return response.json();	// 리턴값을 json형식으로 변환함
			}).catch(function(err) {	// 에러 발생시 catch해줌
				console.log(err);
			});
		}
	}
</script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>우리동네 운동친구∴∵Health Friends</title>
</head>

<body>

		<%-- 검색을 하면 enter_event(event)를 실행시킴 --%>
		<%-- onsubmit = submit이 실행되기전에 특정 함수를 실행시켜줌 --%>
		<form onsubmit="enter_event(event);" style="text-align: center; margin-top: 50px;">
			<input type="text" name="txt_search" id="txt_search" style="width: 300px; height: 38px; vertical-align: top" placeholder=" 검색어를 입력하세요">
			<input type="submit" class="btn btn-info" value="제출" />
		</form>

	<br>

	<%-- 검색결과가 아래에 출력됨 --%>
	<div class="container">
			<div class="row" id="start"></div>
	</div>

</body>
</html>