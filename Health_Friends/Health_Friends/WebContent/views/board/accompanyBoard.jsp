<%@page import="com.login.dto.RegistDto"%>
<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@page import="com.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.common.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function loginChk() {
		alert("로그인 이후 사용가능합니다");
	}
</script>
</head>
<body>
<%--
	<%@include file="header.jsp" %>
 --%>
 
<% RegistDto Ldto = (RegistDto)session.getAttribute("Ldto"); %> 
 
<%--게시판목록 --%>	
	<section class="boardlist">
		<a href="./board.do?command=list">동행 구해요</a>
		<a href="./review.do?command=list">사진후기</a>
		<a href="./notice.do?command=list">공지사항</a>
	</section>
	<br/>
	
<%--게시글리스트 --%>
	<section id="accompanyBoard_list">
	
		<c:choose>
			<c:when test="${empty Ldto.member_no}">
					<a href="javascript:loginChk();"><input type="button" value="글작성"/></a>
			</c:when>
			<c:otherwise>
				<input type="button" value="글작성" onclick="location.href='./board.do?command=insert'" />
			</c:otherwise>
		</c:choose>
		
		<table border="1">
			<c:forEach items="${list }" var="dto">
		
				<tr>
					<td>
					<c:choose>
						<c:when test="${dto.postDelflag eq'Y' }">
							<c:out value="---삭제된 게시글입니다---"></c:out>
						</c:when>
						<c:otherwise>
							 <c:choose>
							 	<c:when test="${empty Ldto.member_no}">
									<a href="javascript:loginChk();">${dto.postTitle}</a>
								</c:when>
								<c:otherwise>
									<a href="./board.do?command=select&postId=${dto.postId }">${dto.postTitle }</a>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					</td>
					<td>${Ldto.member_gender }</td>
					<td>${Ldto.member_id }</td>
					<td>${dto.postRegdate}</td>
				</tr>
			</c:forEach>
		</table>
	</section>
	
	
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

	<script>
			function pageMove(page){
				location.href='payment.do?command=paymentListPaging&page='+page
			}
	</script>--%>

<%--
	<%@include file="footer.jsp" %>
 --%>  

</body>
</html>















