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
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link href="assets/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<% RegistDto Ldto = (RegistDto) session.getAttribute("dto"); %>

<%--header 로그인 상황에 따라 다르게 나와야함...! --%>
		<!-- Header -->
		<header id="header" class="alt navbar navbar-light">
			<div class="logo"><a href="../../index.jsp">우리 동네 <span>운동 친구</span></a></div>
			<div class="header-list">
				<a href="">소개</a>
				<a href="">공지사항</a>
				<a href="">동행게시판</a>
				<a href="">후기게시판</a>
				<a href="shopping.do?command=shopping">쇼핑</a>
				<a href="">고객센터</a>
			</div>

			<input type="text" size="50" placeholder="동네 이름 또는 운동명을 검색해 보세요!" class="header-search">
			
			<c:choose>
				<c:when test="${Ldto.getMember_id() == null}">
					<a href="regist.do?command=login">로그인</a>
					<a href="regist.do?command=registForm">회원가입</a>
				</c:when>
				
				<c:otherwise>
					<a href="mypage.do?command=mypage">마이페이지</a>
					<a href="regist.do?command=logout">로그아웃</a>
				</c:otherwise>
			</c:choose>
		</header>
</body>
</html>