<%@page import="com.login.biz.RegistBizImpl"%>
<%@page import="com.login.biz.RegistBiz"%>
<%@page import="com.common.Paging"%>
<%@page import="com.board.biz.BoardBizImpl"%>
<%@page import="com.board.biz.BoardBiz"%>
<%@page import="com.login.dto.RegistDto"%>
<%@page import="com.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="assets/css/commonBoard.css" rel="stylesheet" type="text/css" />
<title>우리동네 운동친구∴∵Heath Friends</title>
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
<!-- 페이징 관련 JS -->
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

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
<style type="text/css">

.main img {
	width: 100%;
	height: 2000px;
	vertical-align: middle;
}

.btn01 {
background: royalblue;
	border: 1px solid royalblue;

}

.btn01:hover {
	width: 130px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	background: white;
	text-decoration: underline royalblue;
	color: royalblue;
	display: inline-block;
	border: 1px solid royalblue;
}

.btn02 {
background : teal;
	border: 1px solid teal;
}

.btn02:hover {
	width: 130px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	background: white;
	text-decoration: underline teal;
	color: teal;
	display: inline-block;
	border: 1px solid teal;
}

.board_list {
	width: 100%;
	border-top: 1px solid Royalblue;
}

.board_list tbody tr td:nth-child(2) {
	text-align: center;
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
	border: 1px solid Royalblue;
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
	border: 1px solid Royalblue;
	font-weight: 600;
	color: Royalblue;
}

.board_list_wrap .paging a.num.on {
	background: Royalblue;
	color: #fff;
}

.bt_wrap a {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 8px;
	border: 1px solid Royalblue;
	border-radius: 2px;
	font-size: 14px;
}

.bt_wrap a {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 10px;
	border: 1px solid Royalblue;
	border-radius: 2px;
	font-size: 16px;
}

.bt_wrap a.on {
	background: Royalblue;
	color: white;
	border-radius: 100px;
}

.bt_wrap a.on:hover {
	background: Royalblue;
	color: white;
	text-decoration: underline white;
	border-radius: 100px;
}

img {
	width: 200px;
	height: 200px;
}

div .pagemove {
	width: 30px;
	height: 30px;
	border: 1px solid royalblue;
	border-radius: 100%;
	background-color: white;
	color: royalblue;
		
}

div .pagemove:hover {
	width: 30px;
	height: 30px;
	border: 1px solid lightgray;
	border-radius: 100%;
	background-color: lightgray;
	color: white;
		
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
	border: 1px solid royalblue;
	border-radius: 100%;
	background-color: royalblue;
	color: white;
	}

</style>

</head>
<body>
	
	<%@include file="../../header.jsp" %>
<%
	//RegistDto Ldto = (RegistDto)session.getAttribute("Ldto"); 
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
<!-- 페이징 관련 JS -->
<script type="text/javascript">

	function loginChk() {
		alert("로그인 이후 사용가능합니다");
	}


	$(document).ready(function(){
		
		var pageNum = <%=pageNum-1%>;
		
		if(pageNum >= 10){
			pageNum %= 10;
		}
		
		$(".pagination>a").eq(pageNum).addClass("on");
		
	})
</script>
	<div class="main01">
		<img
			src="https://www.imgacademy.co.kr/sites/default/files/inline-images/coaching.jpg"
			style="width: 100%; height: auto">
		<div class=text01 style="font-size: 40px; font-weight: bold">게시판
			입니다</div>
		<br>
		<div class=text02 style="font-size: 24px;">오늘도 즐거운 운동 즐기시길 바랍니다</div>
		<br>
	</div>

	<div class="main02" style="text-align: center">
		<div style="font-size: 40px; font-weight: bold">후기게시판</div>
		<br>
		<p>소중한 추억을 남겨보세요.</p>
		<br> <a href="index.jsp" class="btn btn02">메인 페이지</a> <a
			href="./board.do?command=list  " class="btn btn01">동행 구해요</a> <a
			href="./review.do?command=list  " class="btn btn01">사진 후기</a> <a
			href=" ./notice.do?command=list " class="btn btn01">공지사항</a>
	</div>

	<div class="board">
		<div class="board_list_wrap">
			<section id="photoReviewBoard_list">
				<table class="board_list">
					<caption>게시판 목록</caption>
					<thead>
						<tr>
							<th>글번호</th>
							<th>사진</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td>------------작성된 글이 없습니다-----------</td>
					</tr>
				</c:when>
				<c:otherwise>
<%
	for(int i = 0; i < list.size(); i++){
		RegistDto rdto = rbiz.selectByNo(list.get(i).getPostUserNo());
		String member_id = rdto.getMember_id();
		if(list.get(i).getpostDelflag().equals("Y")){
%>
				<tr>
					<td colspan="4">========삭제된 게시글 입니다=========</td>
				</tr>

<%			
		} else{
%>
			<tr>
				<td><%=list.get(i).getPostNo()%></td>
<%
			if(Ldto == null){
%>
				<td><a href="javascript:loginChk();"><img src=""></a></td>
				<td><a href="javascript:loginChk();"><%=list.get(i).getPostTitle()%></a></td>
<%
			} else{
%>
				<td><a href="./review.do?command=select&postId=<%=list.get(i).getPostId()%>"><img src=""></a></td>
				<td><a href="./review.do?command=select&postId=<%=list.get(i).getPostId()%>"><%=list.get(i).getPostTitle()%></a></td>		
<%
			}
%>
				<td><%=member_id%></td>
				<td><%=list.get(i).getPostRegdate()%></td>
			</tr>
				
<%	
		}
	}
%>
				</c:otherwise>
			</c:choose>
					</tbody>
				</table>
			</section>
				<div class="bt_wrap">
						<a href="review.do?command=insert" class="on" value="글작성">글작성</a>
				</div>
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


	<section class="boardlist">
		<a href="./board.do?command=list">동행 구해요</a> <a
			href="./review.do?command=list">후기</a> <a
			href="./notice.do?command=list">공지사항</a>
	</section>
	<br />
	<input type="button" value="글작성"
		onclick="location.href='review.do?command=insert'" />

	<h2>사진후기</h2>

	<section id="photoReviewBoard_list">
		<table border="1">
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td>------------작성된 글이 없습니다-----------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td><img src=""></td>
							<td>${dto.postNo}</td>
							<td>${dto.postTitle}</td>
							<td>${dto.postContent}</td>
							<td>${dto.postRegdate}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</section>



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
				location.href='review.do?command=list&page='+page
			}
	</script>

	<%--	
	<%@include file="footer.jsp" %>
--%>
</body>
</html>