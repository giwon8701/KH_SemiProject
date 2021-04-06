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
</head>
<body>
<%--캘린더 게시판 insert --%>
<%@ include file="../../header.jsp" %>
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


	<h1>일정 작성</h1>
	
	<form action="../../individual.do" method="post">
		<input type="hidden" name="command" value="individualInsert">
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="individual_id" value="<%=Ldto.getMember_id() %>" readonly="readonly"></td>
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
				<td><input type="text" name="individual_time">분</td>
			</tr>
			<tr>
				<th>요약</th>
				<td><input type="text" name="individual_title"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="10" cols="60" name="individual_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="일정작성">
					<input type="button" value="취소" onclick="location.href='../../individual.do?command=individualList&year=<%=year%>&month=<%=month%>&date=<%=date%>'">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>