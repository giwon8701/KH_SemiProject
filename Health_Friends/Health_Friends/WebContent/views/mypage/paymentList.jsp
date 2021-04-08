<%@page import="com.mypage.dto.PaymentDto"%>
<%@page import="java.util.List"%>
<%@page import="com.login.dto.RegistDto"%>
<%@page import="com.common.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 운동친구∴∵Heath Friends</title>

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
color: DarkOrange;
}
.text02 {
padding: 5px 10px;
text-align: center;
position: absolute;
top: 47%;
left: 48%;
transform: translate( -53%, -52%);
color: DarkOrange;
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
	border-top: 1px solid #FFD700;
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
	border: 1px solid #FFD700;
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
border: 1px solid #FFD700;
font-weight: 600;
color: #FFD700;
}

.board_list_wrap .paging a.num.on{
background: #FFD700;
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
	background: #FFD700;
	color: white;
	border-radius: 100px;
}

#paging {
border:none;
background-Color:#F5F5F5;  
font:18px;     
border-radius: 100px;   
color:black;    
width:86px;height:32px; 
cursor: pointer;
}

#paging:hover {
border:none;
background-Color: lightgray;  
font:18px;     
border-radius: 100px;   
color:black;    
width:86px;height:32px; 
cursor: pointer;
}

	.pagination {
		padding: 0 0;
		text-align: center;
	}
	
	.pagination a {
		padding: 3px 8px;
		margin: 5px;
		cursor: pointer;
	}
	
	.pagination a.on {
	width: 30px;
	height: 30px;
	border: 1px solid Gold;
	border-radius: 100%;
	background-color: Gold;
	color: white;
	}
	
	
div .pagemove {
	width: 30px;
	height: 30px;
	border: 1px solid Gold;
	border-radius: 100%;
	color: Gold;
		
}

div .pagemove:hover {
	width: 30px;
	height: 30px;
	border: 1px solid lightgray;
	border-radius: 100%;
	background-color: lightgray;
	color: white;
		
}


</style>
</head>
<body>
<%@ include file="../../header.jsp" %>
<%
	List<PaymentDto> list = (List<PaymentDto>) request.getAttribute("list");

	int pageNum = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
	int totalCount = Integer.parseInt(request.getAttribute("totalCount") + "");
	
	Paging paging = new Paging();
	paging.setPageNo(pageNum);
	paging.setPageSize(10);
	paging.setTotalCount(totalCount);
%>

	<script type="text/javascript">
		$(document).ready(function(){
			
			var pageNum = <%=pageNum - 1%>;
			
			if(pageNum >= 10){
				pageNum %= 10;
			}
			
			$(".pagination>a").eq(pageNum).addClass("on");
			
		})
	</script>
	
	<div class="main01">
		<img
			src="images/credit.png"
			style="width: 100%; height: auto">
		<div class=text01 style="font-size: 40px; font-weight: bold">결제 내역 페이지 입니다</div>
		<br>
		<div class=text02 style="font-size: 24px;">충동구매를 조심합니다.</div>
		<br>
	</div>

	<div class="main02" style="text-align: center">
		<div style="font-size: 40px; font-weight: bold">회원 전체 결제 내역</div>
		<br>
		<p>회원 전체 결제 목록을 보여줍니다.</p>
	</div>
	
	
	 <div class="board">
	<div class="board_list_wrap">
		<table class="board_list">
			<caption>회원 전체 결제 목록</caption>
			<thead>
		<tr>
			
					<th>결제번호</th>
					<th>email</th>
					<th>결제금액</th>
					<th>결제일</th>
				</tr>
			</thead>
	<tbody>
	<tr>
			<%
			for (PaymentDto dto : list) {
		%>
			<td><%=dto.getPayment_no()%></td>
			<td><%=dto.getMember_email()%></td>
			<td><%=dto.getPayment_account()%></td>
			<td><%=dto.getPayment_date()%></td>
		</tr>
	<%
			}
		%>
		</tbody>
		</table>
		<br>
		<br>

				<div class="pagination board_list_warp02">
				<input type="button" onclick="pageMove(<%=paging.getFirstPageNo()%>)" value="첫 페이지" class="bt" id="paging">
				<input type="button" onclick="pageMove(<%=paging.getPrevPageNo()%>)" value="이전 페이지" class="bt" id="paging">
				<%
					for (int i = paging.getStartPageNo(); i <= paging.getEndPageNo(); i++) {
				%>
				<a class="pagemove" onclick="pageMove(<%=i%>)"><%=i%></a>
				<%
					}
				%>
				<input type="button" onclick="pageMove(<%=paging.getNextPageNo()%>)" value="다음 페이지" class="bt" id="paging">
				<input type="button" onclick="pageMove(<%=paging.getFinalPageNo()%>)" value="끝 페이지" class="bt" id="paging">
			</div>
			
		</div>
	</div>
		
	
<%--
	<table border="1">
		<tr>
			<th>결제번호</th>
			<th>email</th>
			<th>결제금액</th>
			<th>결제일</th>
		</tr>
		<%
			for (PaymentDto dto : list) {
		%>
		<tr>
			<td><%=dto.getPayment_no()%></td>
			<td><%=dto.getMember_email()%></td>
			<td><%=dto.getPayment_account()%></td>
			<td><%=dto.getPayment_date()%></td>
		</tr>

		<%
			}
		%>
	</table>

--%>
	
	
	<%--  pagination
	<div class="pagination">
		<input type="button" onclick="pageMove(<%=paging.getFirstPageNo()%>)"
			value="◀"> <input type="button"
			onclick="pageMove(<%=paging.getPrevPageNo()%>)" value="◁">

		<%
			for (int i = paging.getStartPageNo(); i <= paging.getEndPageNo(); i++) {
		%>
		<a onclick="pageMove(<%=i%>)"><%=i%></a>
		<%
			}
		%>

		<input type="button" onclick="pageMove(<%=paging.getNextPageNo()%>)"
			value="▷"> <input type="button"
			onclick="pageMove(<%=paging.getFinalPageNo()%>)" value="▶">
	</div>
--%>
	<script>
			function pageMove(page){
				location.href='payment.do?command=paymentListPaging&page='+page
			}
	</script>

	<%@include file="../../footer.jsp" %>
	


</body>
</html>