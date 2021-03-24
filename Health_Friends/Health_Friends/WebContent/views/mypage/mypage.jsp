<%@page	import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@page import="com.mypage.dto.IndividualDto"%>
<%@page import="java.util.List"%>
<%@page import="com.mypage.common.Util"%>
<%@page import="com.mypage.biz.IndividualBizImpl"%>
<%@page import="com.mypage.biz.IndividualBiz"%>
<%@page import="com.mypage.dao.IndividualDao"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%>
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="./assets/css/mypage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="assets/js/chart.js"></script>
</head>
<body>
<%--마이페이지! --%>
<style>
*{border: 1px dotted red;}
</style>
	<div class="mypage-main-div">
		<div class="mypage-second-div1">
			<div class="mypage-profile-div">
				<table>
					<tr>
						<td>프로필사진</td>
						<td rowspan="2">프로필수정</td>
					</tr>

					<tr>
						<td>닉네임</td>
					</tr>

					<tr>
						<td colspan="2">자기소개란!</td>
					</tr>

				</table>
			</div>
			<div class="mypage-list-div">
				<table>
					<tr>
						<th>계정 관리</th>
					</tr>
					<tr>
						<td>
							<ol>
								<li><a href="">회원정보 수정</a></li>
								<li><a href="payment.do?command=payment">프리미엄 등록</a></li>
								<li><a href="">프리미엄 취소</a></li>
							</ol>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="mypage-second-div2">
			<div id="chart_div" class="mypage-graph-div" style="widt:500px; height: 180px;"></div>
			<div class="mypage-calendar-div">





				<table id="calendar">
					<caption>
						<a href="mypage.jsp?year=<%=year - 1%>&month=<%=month%> ">◁</a> <a
							href="mypage.jsp?year=<%=year%>&month=<%=month - 1%> ">◀</a> <span
							class="y"><%=year%></span>년 <span class="m"><%=month%></span>월 <a
							href="mypage.jsp?year=<%=year%>&month=<%=month + 1%> ">▶</a> <a
							href="mypage.jsp?year=<%=year + 1%>&month=<%=month%> ">▷</a>
					</caption>

					<tr>
						<th>일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th>토</th>
					</tr>

					<tr>
						<%
							for (int i = 0; i < dayOfWeek - 1; i++) {
								out.print("<td></td>");
							}
						for (int i = 1; i <= lastDay; i++) {
						%>
						<td><a class="countview"
							href="individual.do?command=individualList&year=<%=year%>&month=<%=month%>&date=<%=i%>"
							style="color: <%=Util.fontColor(i, dayOfWeek)%>"><%=i%></a></td>
						<%
							if ((dayOfWeek - 1 + i) % 7 == 0) {
								out.print("</tr><tr>");
							}
						}

						for (int i = 0; i < (7 - (dayOfWeek - 1 + lastDay) % 7) % 7; i++) {
							out.print("<td></td>");
						}
						%>
					</tr>

				</table>

			</div>
		</div>
		<div class="mypage-second-div3">
			<div class="mypage-basket-div">찜한게시물</div>
			<div class="mypage-follw-div">팔로우</div>
		</div>
	</div>

	<%@ include file="../common/footer.jsp" %>

</body>
</html>