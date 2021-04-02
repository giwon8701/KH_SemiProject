<%@page import="com.login.dto.RegistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<style>

.dropdown {
font-size : 18px;
}

.dropdown:hover { color:pink }

</style>


<head>

<meta charset="UTF-8">

<title>header 영역</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

</head>

<link href="assets/css/main.css" rel="stylesheet" type="text/css">

<body>

<% RegistDto Ldto = (RegistDto) session.getAttribute("Ldto"); %>

<%--header 로그인 상황에 따라 다르게 나와야함...! --%>
		<nav class="navbar navbar-light" style="background-color:#F8F8FF">
		<div class="container-fluid">
			<div class="navbar-header"><br>
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#" style="color:#696969; font-size:23px">&emsp;&emsp;우리동네 운동메이트</a><br>
			</div><br>
			
			<div class="collapse navbar-collapse"
				id="bs-example-naver-collapse-1">
				<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">&emsp;&nbsp;소개하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="     ">소개 하기</a>
							<li><a href="     ">오시는 길</a></li>
						</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">&emsp;&nbsp;공지사항<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="location.jsp">교통과 지도</a></li>
						</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">&emsp;&nbsp;동행게시판<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="location.jsp">교통과 지도</a></li>
						</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">&emsp;&nbsp;후기게시판<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="location.jsp">교통과 지도</a></li>
						</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">&emsp;&nbsp;쇼핑하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="shopping.do?command=shopping">쇼핑하기 페이지</a></li>
						</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">&emsp;&nbsp;고객센터<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="location.jsp">교통과 지도</a></li>
						</ul>
					</li>
				</ul>
				
				<form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form=control" placeholder="내용을 입력하세요." style="width:200px; height:33px; font-size:16px;">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
				</form>
				
				<ul class="nav navbar=nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="regist.do?command=login">로그인</a></li>
							<li><a href="regist.do?command=registForm">회원가입</a></li>
							
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>

</body>
</html>