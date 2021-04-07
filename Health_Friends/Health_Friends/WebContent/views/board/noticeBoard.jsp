<%@page import="com.login.biz.RegistBizImpl"%>
<%@page import="com.login.biz.RegistBiz"%>
<%@page import="com.common.Paging"%>
<%@page import="com.login.dto.RegistDto"%>
<%@page import="com.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.board.biz.BoardBizImpl"%>
<%@page import="com.board.biz.BoardBiz"%>
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
<title>우리동네 운동친구 Health Friends</title>
<%
	RegistDto Ldto = (RegistDto)session.getAttribute("Ldto"); 
	BoardBiz biz = new BoardBizImpl();
	
	RegistBiz rbiz = new RegistBizImpl();
	
	List<BoardDto> list = (List<BoardDto>) request.getAttribute("list");

	int pageNum = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
	int totalCount = Integer.parseInt(request.getAttribute("totalCount") + "");
	
	Paging paging = new Paging();
	paging.setPageNo(pageNum);
	paging.setPageSize(10);
	paging.setTotalCount(totalCount);
%>
<script type="text/javascript">
	function loginChk() {
		alert("로그인 이후 사용가능합니다");
	}
</script>
<script type="text/javascript">
	function loginChk2() {
		alert("관리자로그인 이후 사용가능합니다");
	}
</script>


	<!-- 페이징 관련 JS -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			var pageNum = <%=pageNum-1%>;
			
			if(pageNum >= 10){
				pageNum %= 10;
			}
			
			$(".pagination>a").eq(pageNum).addClass("on");
			
		})
	</script>
	<!-- 페이징 관련 CSS -->
	<style>
		.pagination {
			padding: 10px 0;
		}
		
		.pagination a {
			padding: 5px;
			margin: 5px;
			cursor: pointer;
		}
		
		.pagination a.on {
			font-weight: bold;
			font-size: 20px;
		}
	</style>
</head>

<body>
<%--
	<%@include file="../../views/common/header.jsp" %>
 --%>
	<section class="boardlist">
		<a href="./board.do?command=list">동행 구해요</a>
		<a href="./review.do?command=list">사진후기</a>
		<a href="./notice.do?command=list">공지사항</a>
	</section>
	
	<h2>공지사항</h2>
	
	<table border="1">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
			</tr>
<%
	for(int i = 0; i < list.size(); i++){
		RegistDto rdto = rbiz.selectByNo(list.get(i).getPostUserNo());
		String member_id = rdto.getMember_id();
		if(list.get(i).getPostDelflag().equals('Y')){
%>
			<tr>
				<td>======삭제된 게시글 입니다=========</td>
			</tr>
<%			
		} else{
%>
			<tr>
				<td><%=list.get(i).getPostNo()%></td>
				<td>
<%
			if(Ldto == null){
%>
					<a href="javascript:loginChk();"><%=list.get(i).getPostTitle()%></a>
<%
			} else{
%>
					<a href="./notice.do?command=select&postId=<%=list.get(i).getPostId()%>"><%=list.get(i).getPostTitle()%></a>		
<%
			}
%>
				</td>
				<td><%=member_id%></td>
				<td><%=list.get(i).getPostRegdate()%></td>
			</tr>
				
<%	
		}
	}
%>
	</table>
	<c:choose>
      <c:when test="${Ldto.member_no eq 1 }">
		<input type="button" value="글작성" onclick="location.href='./notice.do?command=insert'" />
	  </c:when>
	  <c:otherwise>
		<a href="javascript:loginChk2();"><input type="button" value="글작성"/></a>
	  </c:otherwise>
    </c:choose>

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
				location.href='notice.do?command=list&page='+page
			}
	</script>
<%---	
	<%@include file="../../views/common/footer.jsp" %>
--%>
</body>
</html>










