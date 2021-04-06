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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="assets/js/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
	#profile-img{
		width: 150px;
		height: 150px;
		border-radius: 50%;
	}
	.mypage-main-div{
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
	}
	.mypage-profile-div, .mypage-chart-div{
		float: left;
		align: center;
	}
	.mypage-profile-div, .profile-border{
		border: 1px solid black;
	}
	.profile-border{
		border: 1px soild black;
	}
	.profile-font{
		font-weight: bold;
		font-size: 20px;
	}
	.mypage-calendar-div{
		float: left;
		margin-left: 10%;
		margin-top: 10%;
		text-align: center;
	}
	.mypage-list-div{
		margin-top: 5%;
		float: right;
	}
	
	.list-ul{
		list-style: none;
	}
</style>
<script>
	function follow(){
		$("#follow").click(function(){
			open("follow.do?command=follow", "followList", "width=500; height=800;");
		});
	}
</script>
</head>
<body>
<%--마이페이지! --%>
<%@ include file="../../header.jsp" %>

	<div class="mypage-main-div">
		<div class="mypage-second-div1">
			<div class="mypage-profile-div">
				<table class="profile-border">
					<tr>
						<td colspan="2" align="center" class="profile-border">
							<c:choose>
								<c:when test="${Ldto.getMember_picture_path() == null}">
									대표 프로필 사진이 존재하지 않습니다<br>프로필 사진을 등록해주세요!
								</c:when>
								<c:otherwise>
									<img src="profileimg/<%=Ldto.getMember_picture_path()%>?" id="profile-img" />
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<form action="profile.do?member_email=<%=Ldto.getMember_email()%>" method="post" enctype="multipart/form-data">
								<input type="file" name="filename" size='20'><br>
								<input type="submit" value="프로필 사진 변경 하기">
							</form>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" class="profile-border"><%=Ldto.getMember_email() %>(<span style="font-weight: bold;"><%=Ldto.getMember_id() %></span>)</td>
					</tr>
					<tr>
						<td align="center" class="profile-font">회원등급</td>
						<td align="center" class="profile-font">매너점수</td>
					</tr>
					<tr>
						<td align="center" class="" style="color: blue;"><%=Ldto.getMember_role() %></td>
						<td align="center" class="" >
							<c:choose>
								<c:when test="${Ldto.getMember_review() == 0}">
									----------
								</c:when>
								<c:otherwise>
									<%=Ldto.getMember_review() %>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
				
			</div>
			<div class="mypage-calendar-div">
				<table id="calendar" align="center">
					<col width="25px">
					<col width="25px">
					<col width="25px">
					<col width="25px">
					<col width="25px">
					<col width="25px">
					<col width="25px">
				
					<tr>
						<td colspan="7">
							<a href="mypage.do?command=yearMinus&year=<%=year - 1%>&month=<%=month%> ">◁</a>
							<a href="mypage.do?command=monthMinus&year=<%=year%>&month=<%=month - 1%> ">◀</a> 
							<span class="y"><%=year%></span>년 
							<span class="m"><%=month%></span>월 
							<a href="mypage.do?command=monthPlus&year=<%=year%>&month=<%=month + 1%> ">▶</a>
							<a href="mypage.do?command=yearPlus&year=<%=year + 1%>&month=<%=month%> ">▷</a>
						</td>
					</tr>

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
							href="individual.do?command=individualList&individual_id=<%=Ldto.getMember_id()%>&year=<%=year%>&month=<%=month%>&date=<%=i%>"
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
			<div class="mypage-list-div">
				<table>
					<tr>
						<th style="font-size:30px;">계정 관리</th>
					</tr>
					<tr>
						<td>
							<ul class="list-ul">
								<li><a href="mypage.do?command=registUpdate">회원정보 수정</a></li>
								<li><a href="">찜한게시물</a></li>
								<li><div class="mypage-follw-div" onclick="follow();" id="follow">팔로우</div></li>
								<li><a href="payment.do?command=paymentRoleUp&member_role=<%=Ldto.getMember_role()%>">프리미엄 등록</a></li>
								<li><a href="payment.do?command=paymentRoleDown&member_role=<%=Ldto.getMember_role()%>">프리미엄 탈퇴</a></li>
								<li><a href="payment.do?command=paymentListMyPaging&member_email=<%=Ldto.getMember_email()%>">나의 결제내역</a></li>
								<li><a href="payment.do?command=paymentListPaging">모든회원결제내역(admin)</a></li>
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="mypage-second-div2">
			<div class="mypage-chart-div" style="width:800px" style="float: left;">
				<canvas id="myChart"></canvas>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
function isTwo(n){
	n = n+'';
	return (n.length<2)?"0"+n:n;
}

$(function(){
	var individual_id = "<%=Ldto.getMember_id()%>";
	var today = new Date();
	var date = today.getDate();
	var month = today.getMonth()+1 ;
	var year = today.getFullYear();
	var yyyyMMdd = '' + year + isTwo(month) + isTwo(date);
	
	$.ajax({
		type: "post",
		url: "chart.do?command=healthRecord&individual_id="+individual_id,
		dataType: "json",
		success: function(msg){
			var todayHealth = msg.todayHealth;
			var yesterdayHealth = msg.yesterdayHealth;
			var twoAgodayHealth = msg.twoAgodayHealth;
			var threeAogdayHealth = msg.threeAogdayHealth;
			var fourAgodayHealth = msg.fourAgodayHealth;
			var fiveAgodayHealth = msg.fiveAgodayHealth;
			var sixAgodayHealth = msg.sixAgodayHealth;
			
			console.log(todayHealth);
			console.log(yesterdayHealth);

			var today = new Date();
			var todayDate = today.getFullYear()+'.'+(today.getMonth()+1)+'.'+today.getDate();

			new Date(today.setDate(today.getDate() - 1));
			var yesterdayDate = today.getFullYear()+'.'+(today.getMonth()+1)+'.'+today.getDate();

			new Date(today.setDate(today.getDate() - 1));
			var twoAgoDate = today.getFullYear()+'.'+(today.getMonth()+1)+'.'+today.getDate();
			
			new Date(today.setDate(today.getDate() - 1));
			var threeAgoDate = today.getFullYear()+'.'+(today.getMonth()+1)+'.'+today.getDate();
			
			new Date(today.setDate(today.getDate() - 1));
			var fourAgoDate = today.getFullYear()+'.'+(today.getMonth()+1)+'.'+today.getDate();
			
			new Date(today.setDate(today.getDate() - 1));
			var fiveAgoDate = today.getFullYear()+'.'+(today.getMonth()+1)+'.'+today.getDate();
			
			new Date(today.setDate(today.getDate() - 1));
			var sixAgoDate = today.getFullYear()+'.'+(today.getMonth()+1)+'.'+today.getDate();
			
			var ctx = document.getElementById("myChart").getContext('2d');
			/*
			- Chart를 생성하면서, 
			- ctx를 첫번째 argument로 넘겨주고, 
			- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줌
			*/
			var myChart = new Chart(ctx, {
			    type: 'line',
			    data: {
			        labels: [sixAgoDate, fiveAgoDate, fourAgoDate, threeAgoDate, twoAgoDate, yesterdayDate, todayDate],
			        datasets: [{
			            label: '운동시간(분)',
			            data: [sixAgodayHealth, fiveAgodayHealth, fourAgodayHealth, threeAogdayHealth, twoAgodayHealth, yesterdayHealth, todayHealth],
			            backgroundColor: [
			                'rgba(92, 209, 229, 0.2)'
			            ],
			            borderColor: [
			                'rgba(61, 183, 204, 1)'
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
			
		},
		error: function(){
			alert("통신실패");
		}
	});
});
</script>

<%--
	<%@ include file="../common/footer.jsp" %>
 --%>
</body>
</html>
