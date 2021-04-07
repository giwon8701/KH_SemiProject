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
<%@ include file="../../header.jsp" %>

<div  class="payment-table">
	<table>
		<tr>
			<td>프리미엄 회원을 취소하시면 다시 돌리실수 없습니다... 저희 health friends는...</td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" class="btn solid" value="프리미엄 탈퇴" onclick="location.href='payment.do?command=paymentDowndate&member_email=<%=Ldto.getMember_email()%>'"/>
				<input type="button" class="btn solid" value="돌아가기" onclick="location.href='./mypage.do?command=mypage'"/>
			</td>
		</tr>
	</table>
</div>
</body>
</html>