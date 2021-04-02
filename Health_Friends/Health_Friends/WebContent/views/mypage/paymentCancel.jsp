<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<table>
	<tr>
		<td>프리미엄 회원을 취소하시면 다시 돌리실수 없습니다... 저희 health friends는...</td>
	</tr>
	<tr>
		<td>
			<input type="button" value="프리미엄 탈퇴" onclick="location.href='../../payment.do?command=paymentDowndate&member_email=<%=dto.getMember_email()%>'"/>
			<input type="button" value="돌아가기" onclick="location.href='mypage.jsp'"/>
		</td>
	</tr>
</table>

<%@ include file="../common/footer.jsp" %>
</body>
</html>