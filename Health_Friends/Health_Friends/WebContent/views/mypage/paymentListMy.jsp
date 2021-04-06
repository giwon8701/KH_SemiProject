<%@page import="com.common.Paging"%>
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

	<!--  pagination -->
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

	<script>
			function pageMove(page){
				location.href='payment.do?command=paymentListMyPaging&page='+page
			}
	</script>


</body>
</html>