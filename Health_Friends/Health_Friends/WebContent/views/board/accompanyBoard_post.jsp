<%@page import="com.login.dto.RegistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 운동친구 Health Friends</title>

<style type="text/css">
	.map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    
	table{
		width: 1000px;
	}
	tr > th{
		text-align: left;
	}
</style>
</head>
<body>

		<%--동행게시판 --%>

<%--
	<%@include file="header.jsp" %>
 --%>	
 
<jsp:useBean id="dto" class="com.board.dto.BoardDto" scope="request"></jsp:useBean>
<% RegistDto Ldto = (RegistDto)session.getAttribute("Ldto"); %> 
 	
	<section class="boardlist">
		<a href="./board.do?command=list">동행 구해요</a>
		<a href="./review.do?command=list">사진후기</a>
		<a href="./notice.do?command=list">공지사항</a>
	</section>
 
	<section id="Board_writePost">
		<form action="./board.do" id="Acform"  method="post">
			<input type="hidden" name="command" value="insertres"/>
			<table border="1">
				<tr>
					<th colspan="3">동행구해요</th>
				</tr>
				<tr>
					<td colspan="3">
						<input type="text" name="postTitle" placeholder="게시글 제목을 적어주세요"/>
					</td>
				</tr>
				<tr>
					<td>
						운동종류	<br/>
						<select name="postCategoryName">
							<optgroup label="맨발운동">
								<option value="walk">걷기</option>
								<option value="running">달리기</option>
							</optgroup>
							<optgroup label="라이딩">
								<option value="bike_riding">자전거</option>
								<option value="inline_skating">인라인스케이트(롤러브레이드)</option>
							</optgroup>
							<optgroup label="구기운동">
								<option value="basketball">농구</option>
								<option value="dodgeball">피구</option>
								<option value="tennis">테니스</option>
							</optgroup>
						</select>
					</td>
					
					<td>
						<!-- 지도API : c6a1fbbb0976413a4f4996beefa8a351 -->
						<p><em>지도를 클릭해주세요!</em></p>
						약속장소	<br/>
						<div id="makerSpace" >
					 지번주소<input type="text" name="postLongitude" value=""/>
						</div>					
						<input type="hidden" id="MapAddress" name="MapAddress" value="" /> 
						<div class="map_wrap">
						    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
						    <div class="hAddr">
						        <span class="title">지도중심기준 행정동 주소정보</span>
						        <span id="centerAddr"></span>
						    </div>
						</div> 
						
<%-- 카카오 맵 관련 api, js --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6a1fbbb0976413a4f4996beefa8a351&libraries=services"></script>
<script src="/Health_Friends/assets/js/kakaoMap.js"></script>

					</td>
					<td>
						<p><em>달력을 클릭해주세요!</em></p>
	<!-- 달력API -->		<div id='postMdate'></div>

						    <input type="hidden" name="postMdate" value="" />
					 	<div id='calendar'></div>
					</td>
				</tr> 
				<tr>
					<td colspan="3" id="Board_writeContent">
						<textarea rows="30" cols="100" id="summernote" name="postContent"></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" id="submit" value="등록">
			<input type="button" value="취소" onclick="location.href='./board.do?command=list'" />
		</form>
	</section>
<%--	
	<%@include file="footer.jsp" %>
--%>	
<%-- summernote관련 부트스트랩, api, js --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src="assets/js/summernote.js"></script>
<%-- 글쓰기에 들어가는 캘린더 api, js --%>
<link href='/Health_Friends/assets/api/fullcalendar-5.6.0/lib/main.css' rel='stylesheet' />
<script src='/Health_Friends/assets/api/fullcalendar-5.6.0/lib/main.js'></script>
<script src='/Health_Friends/assets/js/boardCalendar.js'></script>
</body>
</html>
















