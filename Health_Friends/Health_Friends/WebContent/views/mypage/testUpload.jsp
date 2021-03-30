<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
		border: 1px dotted blue;
	}
</style>
</head>
<form action="testImgup.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="command" value="aaa">
	<input type="file" name="filename" size='40'><br>
	<input type="submit" value="프사변경">
</form>

<img src="../../img/imposter.png" width=512 height=384></img> 

<body>
</body>
</html>