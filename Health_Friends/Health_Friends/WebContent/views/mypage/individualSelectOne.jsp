<%@page import="com.login.dto.RegistDto"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.mypage.biz.IndividualBizImpl"%>
<%@page import="com.mypage.biz.IndividualBiz"%>
<%@page import="com.mypage.dto.IndividualDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
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
	padding: 13px;
	font-size: 16px;
	text-align: center;
}

.board_list td {
	text-align: left;
}

.board_list tbody tr td:nth-child(2) {
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
font-size:14px;     
border-radius: 100px;   
color: white;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

#mpage01:hover {
border:none;
background-Color:#9932CC;
border: 1px solid #9932CC;  
font-size:14px;     
border-radius: 100px; 
text-decoration: underline white;    
color: white;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

#mpage02 {
border:none;
background-Color: white;
border: 1px solid #9932CC;  
font-size:14px;     
border-radius: 100px;   
color: #9932CC;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

#mpage02:hover {
border:none;
background-Color:white;
border: 1px solid #9932CC;  
font-size:14px;     
border-radius: 100px;
text-decoration: underline #9932CC;   
color: #9932CC;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

.individual01 {
margin-top:10px;
}

</style>

</head>
<body>
<%--캘린더 게시판 하나선택하여 자세히보기 --%>
<% RegistDto Ldto = (RegistDto) session.getAttribute("Ldto"); %>
<%
	Calendar cal = Calendar.getInstance();

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;

	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	
	int date = Integer.parseInt(request.getParameter("date"));
	
	int individual_no = Integer.parseInt(request.getParameter("individual_no"));
	IndividualBiz biz = new IndividualBizImpl();
	IndividualDto dto = biz.individualSelectOne(individual_no);
%>
	<jsp:useBean id="util" class="com.mypage.common.Util"></jsp:useBean>
	
<div class="main01">
	<img src="https://www.imgacademy.co.kr/sites/default/files/inline-images/coaching.jpg" style="width:100% ;height:auto">
	<div class=text01 style="font-size: 40px; font-weight:bold">마이 페이지입니다</div><br>
	<div class=text02 style="font-size: 24px;">오늘도 즐거운 운동 즐기시길 바랍니다</div><br>
</div>


<div class="main02" style="text-align: center">
<div style="font-size: 40px; font-weight:bold">운동 기록 보기</div><br>
<p style="font-size: 16px;">자신의 운동 내용을 기록해보세요.</p><br> 

</div>	

		 <div class="board">
	<div class="board_list_wrap">
		<table class="board_list">
		
					<caption>운동 기록 보기</caption>
		
			<tr>
				<th>ID</th>
				<td><%=Ldto.getMember_id() %></td>
			</tr>
			<tr>
				<th>운동 날짜</th>
				<td>
					<jsp:setProperty property="todates" name="util" value="${dto.individual_mdate }" />
					<jsp:getProperty property="todates" name="util" />
				</td>
			</tr>
			<tr>
				<th>요약</th>
				<td>${dto.individual_title }</td>
			</tr>
			<tr>
				<th>운동 시간</th>
				<td>${dto.individual_time }</td>
			</tr>
			<tr>
				<td colspan="2"><textarea style="resize:none; border:none; font-size:18px;" rows="30" cols="90" name="content" readonly="readonly" >${dto.individual_content }</textarea></td>
			</tr>
		</table>
			<div class="individual01" style="text-align:right">
		<input type="button" id="mpage01" value="수정" onclick="location.href='individual.do?command=individualUpdate&individual_no=${dto.individual_no }&date=<%=date%>'">
					<input type="button" id="mpage01" value="삭제" onclick="location.href='individual.do?command=individualDelete&individual_no=${dto.individual_no }'">
	
				<input type="button" id="mpage02" value="목록" onclick="location.href='individual.do?command=individualList&individual_id=<%=Ldto.getMember_id()%>&year=<%=year%>&month=<%=month%>&date=<%=date%>'">
</div>
</div>
</div>

</body>
</html>