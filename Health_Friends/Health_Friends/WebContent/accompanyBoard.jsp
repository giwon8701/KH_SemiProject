<%@page import="com.hf.biz.BoardBizImpl"%>
<%@page import="com.hf.biz.BoardBiz"%>
<%@page import="com.hf.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
.boardlist{

}
</style>
</head>
<%
	BoardBiz biz = new BoardBizImpl();
	List<BoardDto> list = biz.selectList();
	System.out.print(list);
%>
<body>

<%--
	<%@include file="header.jsp" %>
 --%>
 
<%--게시판목록 --%>	
	<section class="boardlist">
		<a href="">동행 구해요</a>
		<a href="">후기</a>
		<a href="">공지사항</a>
	</section>
	<br/>
	
	<a href="">글작성</a>
	
<%--게시글리스트 --%>
	<section id="Board_list">
		<table border="1">
<% 
			if (list.size() == 0){
%>
				<tr>
					<td>------작성된 글이 없습니다------</td>
				</tr>
<% 
			} else{
				for (BoardDto dto : list){
%>
				<tr>
					<td><%=dto.getPostTitle() %></td>
					<td>----</td>
				</tr>
<%
				}
			}
%>
		</table>
	</section>

<%--
	<%@include file="footer.jsp" %>
 --%>  

</body>
</html>















