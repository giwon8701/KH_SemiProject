<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link href="assets/css/commonBoard.css" rel="stylesheet" type="text/css" />
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
	transform: translate(-63%, -50%);
	color: ghostwhite;
}

.text02 {
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 47%;
	left: 48%;
	transform: translate(-53%, -52%);
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
	border: 1px solid OrangeRed;
}

.btn01:hover {
	width: 130px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	background: white;
	text-decoration: underline OrangeRed;
	color: OrangeRed;
	display: inline-block;
	border: 1px solid OrangeRed;
}

.btn02 {
	background: Tan;
	border: 1px solid Tan;
}

.btn02:hover {
	width: 130px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	background: white;
	text-decoration: underline Tan;
	color: Tan;
	display: inline-block;
	border: 1px solid Tan;
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

.board_list_wrap .paging a.num.on {
	background: OrangeRed;
	color: #fff;
}

.bt_wrap a {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 8px;
	border: 1px solid OrangeRed;
	border-radius: 2px;
	font-size: 14px;
}

.bt_wrap a.on {
	background: OrangeRed;
	color: white;
	border-radius: 100px;
}

.bt_wrap a.on:hover {
	background: OrangeRed;
	color: white;
	border-radius: 100px;
	text-decoration: underline white;
}

.bt_wrap a.off {
	color: OrangeRed;
	border-radius: 100px;
}

.bt_wrap a.off:hover {
	color: OrangeRed;
	border-radius: 100px;
	text-decoration: underline OrangeRed;
}

div .pagemove {
	width: 30px;
	height: 30px;
	border: 1px solid OrangeRed;
	border-radius: 100%;
	color: OrangeRed;
}

div .pagemove:hover {
	width: 30px;
	height: 30px;
	border: 1px solid lightgray;
	border-radius: 100%;
	background-color: lightgray;
	color: white;
}

.paging {
	margin-top: 40px;
	margin-bottom: 50px;
	text-align: center;
	font-size: 0;
}

.paging a {
	display: inline-block;
	margin-left: 10px;
	padding: 5px 10px;
	border: 1px solid teal;
	border-radius: 100px;
	font-size: 14px;
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
	border: 1px solid OrangeRed;
	border-radius: 100%;
	background-color: OrangeRed;
	color: white;
}

</style>
<script type="text/javascript">
	function loginChk() {
		alert("로그인 이후 사용가능합니다");
	}
	function loginChk2() {
		alert("관리자로그인 이후 사용가능합니다");
	}
</script>
</head>
<body>
	<%@include file="../../header.jsp" %>
<%
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
	<script>
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
			페이지입니다</div>
		<br>
		<div class=text02 style="font-size: 24px;">오늘도 즐거운 운동 즐기시길 바랍니다</div>
		<br>
	</div>

	<div class="main02" style="text-align: center">
		<div style="font-size: 40px; font-weight: bold">공지사항</div>
		<br>
		<p>웹 이용 전 반드시 공지사항을 확인하시기 바랍니다.</p>
		<br>
		<section class="boardlist">
			<a href="  " class="btn btn02">메인 페이지</a> <a
				href="./board.do?command=list" class="btn btn01">동행 게시판</a> <a
				href="./review.do?command=list" class="btn btn01">후기 게시판</a> <a
				href="./notice.do?command=list" class="btn btn01">공지사항</a>
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
<%
	for(int i = 0; i < list.size(); i++){
		
		System.out.println("list.get(i).getPostUserNo() : " + list.get(i).getPostUserNo());
		RegistDto rdto = rbiz.selectByNo(list.get(i).getPostUserNo());
		String member_id = rdto.getMember_id();
		
		if(list.get(i).getPostDelflag().equals("Y")){
%>
			<tr>
				<td colspan="4">삭제된 게시글 입니다.</td>
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
				<td><fmt:formatDate value="<%=list.get(i).getPostRegdate()%>" pattern="yyyy-MM-dd HH:mm" /></td>
			</tr>
				
<%	
		}
	}
%>
				</tbody>

			</table>
			<div class="bt_wrap">
				<c:choose>
	      			<c:when test="${Ldto.member_no eq 1 }">	
						<a href="./notice.do?command=insert" class="on" value="글작성">글작성</a>
					</c:when>
					 <c:otherwise>
	 				 </c:otherwise>
				 </c:choose>		
			</div>
			<br> <br>


			<div class="pagination board_list_warp02">
				<input type="button"
					onclick="pageMove(<%=paging.getFirstPageNo()%>)" value="첫 페이지"
					class="bt" id="paging"> <input type="button"
					onclick="pageMove(<%=paging.getPrevPageNo()%>)" value="이전 페이지"
					class="bt" id="paging">
				<%
					for (int i = paging.getStartPageNo(); i <= paging.getEndPageNo(); i++) {
				%>
				<a class="pagemove" onclick="pageMove(<%=i%>)"><%=i%></a>
				<%
					}
				%>
				<input type="button" onclick="pageMove(<%=paging.getNextPageNo()%>)"
					value="다음 페이지" class="bt" id="paging"> <input type="button"
					onclick="pageMove(<%=paging.getFinalPageNo()%>)" value="끝 페이지"
					class="bt" id="paging">
						</div>
							
							<script>
					function pageMove(page){
						location.href='notice.do?command=list&page='+page
					}
			</script>
		
		</div>
	</div>

	<script>
			function pageMove(page){
				location.href='notice.do?command=list&page='+page
			}
	</script>
	<%---	
	<%@include file="../../footer.jsp" %>
--%>
</body>
</html>










