<%@page import="com.login.dto.RegistDto"%>
<%@page import="com.mypage.dto.IndividualDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		$("#muldelform").submit(function(){
			if($("#muldelform input:checked").length == 0){
				alert("하나 이상 체크해 주세요");
				return false;
			}
		});
		
		$("input[name=chk]").click(function(){
	        if($("input[name=chk]").length == $("input[name=chk]:checked").length){
	            $("input[name=all]").prop("checked",true);
	        }else{
	            $("input[name=all]").prop("checked",false);
	        }
	    });

	});
	
	function allCheck(bool){
		var chks = document.getElementsByName("chk");
		for(var i = 0; i < chks.length; i++){
			chks[i].checked = bool;
		}
	}
</script>
</head>
<body>
<%--캘린더 게시판 해당날짜 리스트 --%>
<% RegistDto Ldto = (RegistDto) session.getAttribute("Ldto"); %>
<%
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int date = Integer.parseInt(request.getParameter("date"));
	
	IndividualDto dto = new IndividualDto();
	
%>

	<jsp:useBean id="util" class="com.mypage.common.Util"></jsp:useBean>

	<h1>운동 기록</h1>
	
	<form action="individual.do" method="post">
		<input type="hidden" name="command" value="individualMultiDelete">
		<input type="hidden" name="individual_id" value="<%=Ldto.getMember_id()%>">
		<input type="hidden" name="year" value="<%=year %>">
		<input type="hidden" name="month" value="<%=month %>">
		<input type="hidden" name="date" value="<%=date %>">
		<table border="1">
			<tr>
				<th><input type="checkbox" name="all" onclick="allCheck(this.checked);"></th>
				<th>번호</th>
				<th>제목</th>
				<th>운동시간</th>
				<th>일정</th>
				<th>작성일</th>
			</tr>
			

			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<th colspan="6">----------기록이 없습니다----------</th>
					</tr>
				</c:when>
				
				<c:otherwise>
					<c:forEach items="${list}" var="dto">
					
						<tr>
							<th><input type="checkbox" name="chk" value="${dto.individual_no }"></th>
							<td>${dto.individual_no }</td>
							<td><a href="individual.do?command=individualSelectOne&individual_no=${dto.individual_no }&year=<%=year %>&month=<%=month %>&date=<%=date %>">${dto.individual_title }</a></td>
							<td>${dto.individual_time }</td>
							<td>
								<jsp:setProperty property="todates" name="util" value="${dto.individual_mdate }" />
								<jsp:getProperty property="todates" name="util" />
							</td>
							<td>
								<fmt:formatDate value="${dto.individual_regdate }" pattern="yyyy.MM.dd" />
							</td>
						</tr>

					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="6" align="right">
					<input type="button" value="작성" onclick="location.href='./views/mypage/individualInsert.jsp?year=<%=year %>&month=<%=month %>&date=<%=date %>'">
					<input type="submit" value="삭제">
					<input type="button" value="마이페이지" onclick="location.href='./views/mypage/mypage.jsp'">
				</td>
			</tr>
		</table>
	</form>



<%@ include file="../../footer.jsp" %>
</body>
</html>