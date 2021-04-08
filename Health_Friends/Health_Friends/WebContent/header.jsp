<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.login.dto.RegistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 운동친구∴∵Heath Friends</title>
<link href="assets/css/main.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(window).scroll(function(evt) {
	   var y = $(this).scrollTop();
	   if (y > 10) {
	      $('#header').css("background-color", "rgba(030,144,255,.8)")

	   } else{
	      $('#header').css("background-color", "rgba(0,0,0,0)")
	   }
	});
</script>
<!-- 검색관련 -->
<script type="text/javascript">
      
  	function filter(){
  		var searchId = document.getElementById("search").value;
  		var queryString = "?command=searching&searchId="+searchId;
  		
		open("follow.do"+queryString, "searching", "width=600; height=600;");
	};
</script>
</head>
<body>
<% RegistDto Ldto = (RegistDto) session.getAttribute("Ldto"); %>
	<header id="header">
        <div class="main inner">
            <div class="logo logo-top">
                <a href="index.jsp"><img src="images/logo.png"></a>
            </div>
            <ul class="login-ul">
	            <c:choose>
					<c:when test="${Ldto.getMember_id() == null}">
						<li class="login-li"><a href="regist.do?command=login">로그인</a></li>
					</c:when>
					
					<c:otherwise>
						<li class="login-li"><a href="mypage.do?command=mypage">마이페이지</a></li>
						<li class="login-li"><a href="regist.do?command=logout">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
            </ul>
            
           	<span class="header-search">
				<input type="text" size="25" class="search-input" placeholder="유저를 검색해 보세요!" id="search" onkeyup="if(window.event.keyCode==13){filter()}" />
			</span>
            
            <ul class="border-ul">
                <li class="border-li"><a href="introduce.do?command=introduce">소개</a></li>
                <li class="border-li"><a href="notice.do?command=list">공지사항</a></li>
                <li class="border-li"><a href="board.do?command=list">동행게시판</a></li>
                <li class="border-li"><a href="review.do?command=list">후기게시판</a></li>
                <li class="border-li"><a href="shopping.do?command=shopping">쇼핑</a></li>
            </ul>
        </div>

    </header>
</body>
</html>