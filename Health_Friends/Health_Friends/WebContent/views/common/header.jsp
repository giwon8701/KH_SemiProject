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
<title>Insert title here</title>
<link href="assets/css/main.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
<% RegistDto Ldto = (RegistDto) session.getAttribute("Ldto"); %>
<%
String clientId = "WSSex0InjkcHuJcQW5ov";//애플리케이션 클라이언트 아이디값";
String redirectURI = URLEncoder.encode("http://localhost:8787/Health_Friends/naver.do", "UTF-8");
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString();
String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
apiURL += "&client_id=" + clientId;
apiURL += "&redirect_uri=" + redirectURI;
apiURL += "&state=" + state;
session.setAttribute("state", state);
%>

	
	<header id="header">
        <div class="main">
            <div class="logo">
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
				<input type="text" size="35" placeholder="동네 또는 운동명을 검색해 보세요!">
			</span>
            
            <ul class="border-ul">
                <li class="border-li"><a href="./views/introduce/introduce.jsp">소개</a></li>
                <li class="border-li"><a href="notice.do?command=list">공지사항</a></li>
                <li class="border-li"><a href="board.do?command=list">동행게시판</a></li>
                <li class="border-li"><a href="views/board/photoReviewBoard.jsp">후기게시판</a></li>
                <li class="border-li"><a href="shopping.do?command=shopping">쇼핑</a></li>
                <li class="border-li"><a href="">고객센터</a></li>
            </ul>
        </div>

    </header>
</body>
</html>