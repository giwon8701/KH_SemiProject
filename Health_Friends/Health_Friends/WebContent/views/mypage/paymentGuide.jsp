<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="assets/css/login.css" rel="stylesheet" type="text/css">
<style type="text/css">
.payment-table{
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}
</style>
</head>
<body>
<%-- 결제 전 안내 페이지... --%>
<%@ include file="../../header.jsp" %>

	<div class="payment-table">
		<table border="1">
			<tr>
				<th colspan="2">이용약관</th>
			</tr>
			<tr>
				<td colspan="2">
					<p>저희 health friends를 이용해주셔서 감사합니다....
				
				</td>
				
			</tr>
			<tr>
				<td align="center">
					<input type="button" class="btn solid" onclick="location.href='payment.do?command=payment'" value="결제하기">
					<input type="button" class="btn solid" onclick="location.href='mypage.do?command=mypage'" value="돌아가기">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>