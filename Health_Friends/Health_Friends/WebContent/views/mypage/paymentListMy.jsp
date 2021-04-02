<%@page import="com.mypage.dto.PaymentDto"%>
<%@page import="java.util.List"%>
<%@page import="com.login.dto.RegistDto"%>
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
<% RegistDto Ldto = (RegistDto) session.getAttribute("dto"); %>
<%
	List<PaymentDto> list = (List<PaymentDto>) request.getAttribute("list");
%>
<table border="1">
	<tr>
		<th>결제번호</th>
		<th>email</th>
		<th>결제금액</th>
		<th>결제일</th>
	</tr>
	<%
		for(int i = 0; i < list.size(); i++ ){
	%>
	<tr>
		<td><%=list.get(i).getPayment_no() %></td>
		<td><%=list.get(i).getMember_email() %></td>
		<td><%=list.get(i).getPayment_account() %></td>
		<td><%=list.get(i).getPayment_date() %></td>
	</tr>

	<%
		}
	%>
</table>



</body>
</html>