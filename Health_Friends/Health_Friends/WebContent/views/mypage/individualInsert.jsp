<%@page import="com.login.dto.RegistDto"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인서트</title>

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
}.board_list_wrap .paging a:first-child {
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
<%--캘린더 게시판 insert --%>
<% RegistDto Ldto = (RegistDto) session.getAttribute("Ldto"); %>
<%

	Calendar cal = Calendar.getInstance();
	
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	
	if (paramYear != null) {
		year = Integer.parseInt(paramYear);
	}
	if (paramMonth != null) {
		month = Integer.parseInt(paramMonth);
	}
	
	if (month > 12) {
		month = 1;
		year++;
	}
	
	if (month < 1) {
		month = 12;
		year--;
	}
	
	cal.set(year, month - 1, 1);
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

	
	int date = Integer.parseInt(request.getParameter("date"));
	
	int hour = cal.get(Calendar.HOUR_OF_DAY);
	int min = cal.get(Calendar.MINUTE);
%>

<div class="main01">
	<img src="https://www.imgacademy.co.kr/sites/default/files/inline-images/coaching.jpg" style="width:100% ;height:auto">
	<div class=text01 style="font-size: 40px; font-weight:bold">마이 페이지입니다</div><br>
	<div class=text02 style="font-size: 24px;">오늘도 즐거운 운동 즐기시길 바랍니다</div><br>
</div>


<div class="main02" style="text-align: center">
<div style="font-size: 40px; font-weight:bold">운동 기록</div><br>
<p style="font-size: 16px;">자신의 운동 내용을 기록해보세요.</p><br> 

</div>>
	
	<form action="../../individual.do" method="post">
		<input type="hidden" name="command" value="individualInsert">
		
		
		
 <div class="board">
	<div class="board_list_wrap">
		<table class="board_list">
			<caption>일정 작성</caption>
			<thead>
		
			<tr>
				<th>아이디</th>
				<td><input type="text" name="individual_id" style="font-size: 18px; text-align:left; background-color:transparent;border:0 solid black;" value="<%=Ldto.getMember_id() %>" readonly="readonly"></td>
			</tr>
			<tr>
				<th>운동 날짜</th>
				<td>
					<select name="year">
<%
						for(int i = year-5; i <year+6; i++){
%>
							<option value="<%=i %>" <%=(year==i)?"selected":"" %> ><%=i %></option>
<%
						}
%>
					</select>년
					
					<select name="month">
<%
					for(int i = 1; i < 13; i++){
%>
						<option value="<%=i %>" <%=(month==i)? "selected": "" %> > <%=i %></option>
<%
					}
%>
					</select>월
					
					<select name="date">
<%
					for(int i = 1; i <=lastDay; i++){
%>
					<option value="<%=i %>" <%=(date == i)? "selected": "" %> ><%=i %></option>
<%
					}
%>
					</select>일
					
					<select name="hour">
<%
					for(int i = 0; i < 24; i++){
%>
						<option value="<%=i %>" <%=(hour == i)? "selected": "" %> ><%=i %></option>
<%
					}
%>
					</select>시
					
					<select name="min">
<%
					for(int i = 0; i < 60; i++){
%>
						<option value="<%=i%>" <%=(min == i)? "selected": "" %> ><%=i %></option>
<%
					}
%>
					</select>분
				</td>
			</tr>
			<tr>
				<th>운동 시간</th>
				<td><input type="text" name="individual_time" style="background-color:transparent; border:0 solid black; text-align:left; font-size:18px;">분</td>
			</tr>
			<tr>
				<th>요약</th>
				<td><input type="text" name="individual_title" style="text-align:left; background-color:transparent; border:0 solid black; font-size:18px;"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="30" cols="90" name="individual_content" placeholder="내용을 입력하세요" style="border: none; font-size: 18px; resize:none;"></textarea></td>
			</tr>
		</table>
		<div class="individual01" style="text-align:right">
			
					<input type="submit" id="mpage01" value="작성">
					<input type="button" id="mpage02" value="취소" onclick="location.href='../../individual.do?command=individualList&year=<%=year%>&month=<%=month%>&date=<%=date%>'">
			
			</div>
</div>
</div>
	</form>

</body>
</html>