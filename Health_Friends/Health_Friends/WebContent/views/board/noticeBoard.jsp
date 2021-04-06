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
color: ghostwhite;
}
.text02 {
padding: 5px 10px;
text-align: center;
position: absolute;
top: 47%;
left: 48%;
transform: translate( -53%, -52%);
color: ghostwhite;
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
	border-top: 1px solid OrangeRed;
}

.board_list tr {
	border-bottom: 1px solid #ccc
}

.board_list th, .board_list td {
	padding: 10px;
	font-size: 14px;
}

.board_list td {
	text-align: center;
}

.board_list tbody tr td:nth-child(2) {
	text-align: left;
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
	border: 1px solid OrangeRed;
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
border: 1px solid OrangeRed;
font-weight: 600;
color: OrangeRed;
}

.board_list_wrap .paging a.num.on{
background: OrangeRed;
color: #fff;
}

</style>

<%
	RegistDto Ldto = (RegistDto)session.getAttribute("Ldto"); 
	BoardBiz biz = new BoardBizImpl();
	
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
 
 
<div class="main01">
	<img src="https://www.imgacademy.co.kr/sites/default/files/inline-images/coaching.jpg" style="width:100% ;height:auto">
	<div class=text01 style="font-size: 40px; font-weight:bold">게시판 페이지입니다</div><br>
	<div class=text02 style="font-size: 24px;">오늘도 즐거운 운동 즐기시길 바랍니다</div><br>
</div>


<div class="main02" style="text-align: center">
<div style="font-size: 40px; font-weight:bold">공지사항</div><br>
<p>웹 이용 전 반드시 공지사항을 확인하시기 바랍니다.</p><br> 
	<section class="boardlist">
<a href="  " class="btn btn02">메인 페이지</a>
<a href="./board.do?command=list" class="btn btn01">동행 게시판</a>
<a href="photoReviewBoard.jsp" class="btn btn01">후기 게시판</a>
<a href="./notice.do?command=list" class="btn btn01">공지사항</a>
	</section>
</div>
 
 <div class="board">
	<div class="board_list_wrap">
		<table class="board_list">
			<caption>게시판 목록</caption>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="dto">
			<tr>
				<td>${dto.postNo }</td>
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
									<a href="./notice.do?command=select&postId=${dto.postId }">${dto.postTitle }</a>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</td>
				<td>${Ldto.member_id }</td>
				<td>${dto.postRegdate }</td>
			</tr>
					</c:forEach>	
			</tbody>
			
		</table>
					<div class="bt_wrap">
					<a href="board.do?command=list" class="on">목록</a> <a
						href="board.do?command=updateform&postId=${dto.postId}" class="off">수정</a>
					<a
						href="board.do?command=delete&postId=${dto.postId}" class="off">삭제</a>
						</div>
		
		<div class="paging">
			<a href="#" class="bt">첫 페이지</a> 
			<a href="#" class="bt">이전 페이지</a> 
			<a href="#" class="num on">1</a>
			<a href="#" class="num">2</a>
			<a href="#" class="num">3</a>
			<a href="#" class="bt">다음 페이지</a> 
			<a href="#" class="bt">마지막 페이지</a>
		</div>

	</div>
	</div>
 
 
 
 
 
 
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
		<c:forEach items="${list }" var="dto">
			<tr>
				<td>${dto.postNo }</td>
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
									<a href="./notice.do?command=select&postId=${dto.postId }">${dto.postTitle }</a>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</td>
				<td>${Ldto.member_id }</td>
				<td>${dto.postRegdate }</td>
			</tr>
		</c:forEach>
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










