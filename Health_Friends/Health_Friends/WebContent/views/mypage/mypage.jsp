<%@page import="com.login.dto.RegistDto"%>
<%@page	import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@page import="com.mypage.dto.IndividualDto"%>
<%@page import="java.util.List"%>
<%@page import="com.mypage.common.Util"%>
<%@page import="com.mypage.biz.IndividualBizImpl"%>
<%@page import="com.mypage.biz.IndividualBiz"%>
<%@page import="com.mypage.dao.IndividualDao"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<% RegistDto dto = (RegistDto) session.getAttribute("dto"); %>
<script type="text/javascript">
	function js(){
		var year = $(".y").text().trim();
		var month = $(".m").text().trim();
		var date = countView.text().trim();
		var yyyyMMdd = year + isTwo(month) + isTwo(date);
		
		if(count > 0){
			document.getElementsByClassName("countBackground").style.backgroundColor="gray";
		}
	}
	
</script>
<style type="text/css">
	#profile-img{
		width: 150px;
		height: 150px;
	}
</style>
</head>
<body>
<%--마이페이지! --%>


	<div class="mypage-main-div">
		<div class="mypage-second-div1">
			<div class="mypage-profile-div">
				<table border="1">
					<tr>
						<td colspan="2">
							<c:choose>
								<c:when test="${dto.getMember_picture_path() == null}">
									대표 프로필 사진이 존재하지 않습니다<br>프로필 사진을 등록해주세요!
								</c:when>
								<c:otherwise>
 
									<img src="../../profileimg/<%=dto.getMember_picture_path()%>?" id="profile-img" />

								</c:otherwise>
							</c:choose>
						</td>
						<td rowspan="4">
							<form action="../../profile.do?member_email=<%=dto.getMember_email()%>" method="post" enctype="multipart/form-data">
								<input type="file" name="filename" size='20'><br>
								<input type="submit" value="프사변경">
							</form>
						</td>
					</tr>
					<tr>
						<th colspan="2" align="center"><%=dto.getMember_id() %></th>
					</tr>
					<tr>
						<th>회원등급</th>
						<th>매너점수</th>
					</tr>
					<tr>
						<td align="center"><%=dto.getMember_role() %></td>
						<td align="center">
							<c:choose>
								<c:when test="${dto.getMember_review() == 0}">
									----------
								</c:when>
								<c:otherwise>
									<%=dto.getMember_review() %>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td colspan="3">자기소개란!</td>
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
							<ul>
								<li><a href="../../mypage.do?command=registUpdate">회원정보 수정</a></li>
								<li><a href="../../payment.do?command=paymentRoleUp&member_role=<%=dto.getMember_role()%>">프리미엄 등록</a></li>
								<li><a href="../../payment.do?command=paymentRoleDown&member_role=<%=dto.getMember_role()%>">프리미엄 탈퇴</a></li>
								<li><a href="../../payment.do?command=paymentList">결제내역</a>
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="mypage-second-div2">
			<div style="width:800px"><canvas id="myChart"></canvas></div>
			<div class="mypage-calendar-div">





				<table id="calendar">
					<caption>
						<a href="mypage.jsp?year=<%=year - 1%>&month=<%=month%> ">◁</a>
						<a href="mypage.jsp?year=<%=year%>&month=<%=month - 1%> ">◀</a> 
						<span class="y"><%=year%></span>년 
						<span class="m"><%=month%></span>월 
						<a href="mypage.jsp?year=<%=year%>&month=<%=month + 1%> ">▶</a>
						<a href="mypage.jsp?year=<%=year + 1%>&month=<%=month%> ">▷</a>
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
						<td class="countBackground"><a class="countview"
							href="../../individual.do?command=individualList&year=<%=year%>&month=<%=month%>&date=<%=i%>"
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
	
	
<script type="text/javascript">
	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	
	if(dd<10) {
	    dd='0'+dd
	} 
	
	if(mm<10) {
	    mm='0'+mm
	} 
	
	var ctx = document.getElementById("myChart").getContext('2d');
	/*
	- Chart를 생성하면서, 
	- ctx를 첫번째 argument로 넘겨주고, 
	- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줌
	*/
	var myChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	        labels: [yyyy+'/'+mm+'/'+(dd-6), yyyy+'/'+mm+'/'+(dd-5), yyyy+'/'+mm+'/'+(dd-4), yyyy+'/'+mm+'/'+(dd-3), yyyy+'/'+mm+'/'+(dd-2), yyyy+'/'+mm+'/'+(dd-1), yyyy+'/'+mm+'/'+dd],
	        datasets: [{
	            label: '운동시간(분)',
	            data: [33, 15, 53, 45, 29, 31, 67],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        }
	    }
	});
</script>
	<%@ include file="../common/footer.jsp" %>

</body>
</html>
