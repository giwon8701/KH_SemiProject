<%@page import="com.login.biz.RegistBiz"%>
<%@page import="com.login.biz.RegistBizImpl"%>
<%@page import="com.board.biz.BoardBizImpl"%>
<%@page import="com.board.biz.BoardBiz"%>
<%@page import="com.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.login.dto.RegistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 운동친구∴∵Heath Friends</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">
	table{
		width: 580px;
	}
	tr > th{
		text-align: left;
	}
</style>
</head>
<body>
<%--  
	<%@include file="../../views/common/header.jsp" %>
--%>	
	
	<section class="boardlist">
		<a href="../../board.do?command=list">동행 구해요</a>
		<a href="../../review.do?command=list">사진후기</a>
		<a href="../../notice.do?command=list">공지사항</a>
	</section>
	
	<section id="noticeBoard_post">
		<form action="../../notice.do" method="post">
			<input type="hidden" name="command" value="insertres"/>
			<table border="1">
				<tr>
					<th colspan="2">
						공지사항
					</th>
				</tr>
				<tr>
					<td colspan="3">
						<input type="text" name="postTitle" placeholder="제목을 적어주세요"/>
					</td>
				</tr>
				<tr>	
				
				</tr>
				<tr>
					<td colspan="3">
						<textarea rows="30" cols="100" id="summernote" name="postContent"  ></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" value="등록">
			<input type="button" value="취소" onclick="location.href='../../notice.do?command=list'" />
		</form>
	</section>
<%---	
	<%@include file="../../views/common/footer.jsp" %>
--%>

<%-- summernote관련 부트스트랩, api, js --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src="assets/js/summernote.js"></script>
</body>
</html>



