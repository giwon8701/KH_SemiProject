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

<style>
* {
	margin: 0;
	padding: 0;
}

.main01 {
	width: 100%;
	margin: 10px auto;
	position: relative;
}

.main img {
width: 100%;
height: 2000px;
vertical-align: middle;

}

.text01 {
padding: 5px 10px;
text-align: center;
position: absolute;
top: 37%;
left: 50%;
transform: translate( -63%, -50%);
color: ghostwhite;
}
.text02 {
padding: 5px 10px;
text-align: center;
position: absolute;
top: 47%;
left: 48%;
transform: translate( -53%, -52%);
color: ghostwhite;
}


.btn {
    width: 130px;
    height: 40px;
    line-height: 40px;
    text-align: center;
    background: #1f1f39;
    color: #fff;
    display: inline-block;
}

.btn01 {
background: #FF4500;
}
.btn02 {
background : Tan;
}


.board {
margin: 0 260px;
}

table {
	border-collapse: collapse;
}

caption {
	display: none;
}

a {
	text-decoration: none;
	color: inherit;
}

.board_list_wrap {
	
}

.board_list_wrap {
	padding: 50px;
}

.board_list {
	width: 100%;
	border-top: 1px solid #9932CC;
}

.board_list tr {
	border-bottom: 1px solid #ccc
}

.board_list th, .board_list td {
	padding: 10px;
	font-size: 16px;
	text-align: center;
}

.board_list td {
	text-align: center;
}

.board_list tbody tr td:nth-child(1) {
	text-align: left;
}

.board_list .tit:hover {
	text-decoration: underline;
}

.board_list_wrap .paging {
	margin-top: 20px;
	text-align: center;
	font-size: 0;
}

.board_list_wrap .paging a {
	display: inline-block;
	margin-left: 10px;
	padding: 5px 10px;
	border: 1px solid #9932CC;
	border-radius: 100px;
	font-size: 14px;
}
.board_list_wrap .paging a:first-child {
	margin-left: 0;
}

.board_list_wrap .paging a.bt {
border: 1px solid #eee;
background: #eee;
}

.board_list_wrap .paging a.num {
border: 1px solid #9932CC;
font-weight: 600;
color: #9932CC;
}

.board_list_wrap .paging a.num.on{
background: #9932CC;
color: #fff;
}

.bt_wrap a {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 8px;
	border: 1px solid OrangRed;
	border-radius: 2px;
	font-size: 14px;
}

.bt_wrap a.on {
	background: #9932CC;
	color: white;
	border-radius: 100px;
}

#mpage01 {
border:none;
background-Color:#9932CC;
border: 1px solid #9932CC;  
font-size:16px;     
border-radius: 100px;   
color: white;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

#mpage02 {
border:none;
background-Color: white;
border: 1px solid #9932CC;  
font-size:16px;     
border-radius: 100px;   
color: #9932CC;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

</style>


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

 
<div class="main01">
	<img src="https://www.imgacademy.co.kr/sites/default/files/inline-images/coaching.jpg" style="width:100% ;height:auto">
	<div class=text01 style="font-size: 40px; font-weight:bold">마이 페이지입니다</div><br>
	<div class=text02 style="font-size: 24px;">오늘도 즐거운 운동 즐기시길 바랍니다</div><br>
</div>


<div class="main02" style="text-align: center">
<div style="font-size: 40px; font-weight:bold">운동 기록</div><br>
<p style="font-size: 16px;">자신의 운동 내용을 기록해보세요.</p><br> 

</div>


<jsp:useBean id="util" class="com.mypage.common.Util"></jsp:useBean>
	
	<form action="individual.do" method="post">
		<input type="hidden" name="command" value="individualMultiDelete">
		<input type="hidden" name="individual_id" value="<%=Ldto.getMember_id()%>">
		<input type="hidden" name="year" value="<%=year %>">
		<input type="hidden" name="month" value="<%=month %>">
		<input type="hidden" name="date" value="<%=date %>">


 <div class="board">
	<div class="board_list_wrap">
		<table class="board_list">
			<caption>운동 기록</caption>
			<thead>
				<tr>
				<th><input type="checkbox" name="all" onclick="allCheck(this.checked);"></th>
					<th>요약</th>
					<th>운동시간</th>
					<th>운동날짜</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
		
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
			
			</tbody>
			<tr>
				<td colspan="6" style="text-align:right">
					<input type="button" id="mpage01" value="작성" onclick="location.href='./views/mypage/individualInsert.jsp?year=<%=year %>&month=<%=month %>&date=<%=date %>'">
					<input type="submit" id="mpage01" value="삭제">
					<input type="button" id="mpage02" value="마이페이지" onclick="location.href='./views/mypage/mypage.jsp'">
				</td>
			</tr>
		</table>
		</div>
</div>
	</form>
		









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
				<th>요약</th>
				<th>운동시간</th>
				<th>운동날짜</th>
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
				<td colspan="6" style="text-align:right">
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