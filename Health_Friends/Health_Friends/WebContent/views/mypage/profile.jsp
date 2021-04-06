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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="./assets/css/mypage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="assets/js/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	function unfollow(){
		var following = $("#Ldto").val();
		var followed = $("#dto").val();
		console.log("followed" + following);
		console.log("followed : " + followed);
		var queryString = "?command=unfollow&following="+following+"&followed="+followed;
		$.ajax({
			url : "follow.do" + queryString,
			dataType: "text",
			success: function(data){
				if(data > 0){
					$("#unfollowBttn").css("display","none");
					$("#followBttn").css("display","");
				}
			},
			error: function(err){
				alert(err);
			}
		});
		
	}
	
	function follow(){
		var following = $("#Ldto").val();
		var followed = $("#dto").val();
		console.log("followed" + following);
		console.log("followed : " + followed);
		var queryString = "?command=addfollow&following="+following+"&followed="+followed;
		$.ajax({
			url : "follow.do" + queryString,
			dataType: "text",
			success: function(data){
				if(data > 0){
					$("#followBttn").css("display","none");
					$("#unfollowBttn").css("display","");
				}
			},
			error: function(err){
				alert(err);
			}
		});
	}
	
</script>
<% RegistDto Ldto = (RegistDto) session.getAttribute("Ldto");
	RegistDto dto = (RegistDto) request.getAttribute("dto");
%>
<style type="text/css">
	#profile-img{
		width: 150px;
		height: 150px;
	}
</style>
</head>
<body>
<%--다른 회원 프로필 --%>


	<div class="mypage-main-div">
		<div class="mypage-second-div1">
			<div class="mypage-profile-div">
				<table border="1">
					<tr>
						<td colspan="3" align="center">
							<c:choose>
								<c:when test="${dto.getMember_picture_path() == null}">
									<img src="images/icon/nonprofile.png" style="width:100px; height:100px;">
								</c:when>
								<c:otherwise>
									<img src="../../profileimg/<%=dto.getMember_picture_path()%>?" id="profile-img" />
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th colspan="2" align="center"><%=dto.getMember_id() %></th>
						<td>
							<input type="hidden" id="Ldto" value="<%=Ldto.getMember_no()%>">
							<input type="hidden" id="dto" value="<%=dto.getMember_no()%>">
							<c:choose>
								<c:when test="${res eq 1 }">
									<button id="unfollowBttn" onclick="unfollow()">언팔로우</button>
									<button id="followBttn" onclick="follow()" style="display: none;">팔로우</button>
								</c:when>
								<c:otherwise>
									<button id="unfollowBttn" onclick="unfollow()" style="display: none;">언팔로우</button>
									<button id="followBttn" onclick="follow()">팔로우</button>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th colspan="3">매너점수</th>
					</tr>
					<tr>
						<td align="center" colspan="3">
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

				</table>
			</div>
		</div>
		<div class="mypage-second-div2">
		
		
			<div style="width:800px" style="float: left;">
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
		var individual_id = "<%=dto.getMember_id()%>";
		var today = new Date();
		var date = today.getDate();
		var month = today.getMonth()+1 ;
		var year = today.getFullYear();
		var yyyyMMdd = '' + year + isTwo(month) + isTwo(date);
		
		$.ajax({
			type: "post",
			url: "./chart.do?command=healthRecord&individual_id="+individual_id,
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
