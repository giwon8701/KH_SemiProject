<%@page import="com.login.dto.RegistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/27.0.0/classic/ckeditor.js"></script>

<style type="text/css">
	table{
		width: 600px;
	}
	tr > th{
		text-align: left;
	}
</style>
</head>
<body>


 
 <% RegistDto Ldto = (RegistDto) session.getAttribute("Ldto"); %>
 	<section class="boardlist">
		<a href="">동행 구해요</a>
		<a href="">후기</a>
		<a href="">공지사항</a>
	</section>
	
	<section id="">
		<form action="../../review.do" method="post">
			<input type="hidden" name="command" value="insertRes"/>
			<input type="hidden" name="userNo" value="${Ldto.getMember_no() }">
			<table border="1">
				<tr>
					<th colspan="3">사진후기</th>
				</tr>
				<tr>
					<td colspan="3">
						<input type="text" placeholder="게시글 제목을 적어주세요" name="postTitle"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<textarea id="editor" name="postContent" placeholder="내용을 입력해주세요"></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" value="등록" />
			<input type="button" value="취소" onclick="location.href='../../review.do?command=list'" />
		</form>
	</section>
	<script>
	    ClassicEditor
	        .create( document.querySelector( '#editor' ), {
	        	ckfinder: {
	        		uploadUrl: '../../fileupload.do'
	        	}
	        }).then(editor => {
	        	window.editor = editor
	        })
	        .catch( error => {
	            console.error( error );
	        } );
	</script>
	
</body>
</html>















