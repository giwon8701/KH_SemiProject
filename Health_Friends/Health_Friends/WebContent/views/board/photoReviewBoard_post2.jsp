<%@page import="com.login.dto.RegistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 운동친구 Health Friends</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

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
	border-top: 1px solid royalblue;
}

.board_list tr {
	border-bottom: 1px solid #ccc
}

.board_list th, .board_list td {
	padding: 13px;
	font-size: 16px;
}

.board_list td {
	text-align: left;
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
	border: 1px solid royalblue;
	border-radius: 100px;
	font-size: 14px;
}.board_list_wrap .paging a:first-child {
	margin-left: 0;
}

.board_list_wrap .paging a.bt {
border: 1px solid #eee;
background: #eee;
}


.board_list_wrap .paging a.num {
border: 1px solid royalblue;
font-weight: 600;
color: royalblue;
}

.board_list_wrap .paging a.num.on{
background: royalblue;
color: #fff;
}
.bt_wrap a {
	display: inline-block;
	min-width: 80px;
	margin-left: 10px;
	padding: 8px;
	border: 1px solid OrangRed;
	border-radius: 2px;
	font-size: 14px;
}


.bt_wrap a.on {
	background: royalblue;
	color: white;
	border-radius: 100px;
}

#reviewsubmit {
border:none;
background-Color:royalblue;
border: 1px solid royalblue;  
font-size:14px;     
border-radius: 100px;   
color: white;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

#reviewsubmit:hover {
border:none;
background-Color:royalblue;
border: 1px solid royalblue;  
font-size:14px;     
border-radius: 100px; 
text-decoration: underline white;    
color: white;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

#mpage02 {
border:none;
background-Color: white;
border: 1px solid royalblue;  
font-size:14px;     
border-radius: 100px;   
color: royalblue;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

#mpage02:hover {
border:none;
background-Color:white;
border: 1px solid royalblue;  
font-size:14px;     
border-radius: 100px;
text-decoration: underline royalblue;   
color: royalblue;    
width: 86px;height:32px; 
cursor: pointer;
vertical-align: 4px;
}

</style>

<body>

<div class="main01">
	<img src="https://www.imgacademy.co.kr/sites/default/files/inline-images/coaching.jpg" style="width:100% ;height:auto">
	<div class=text01 style="font-size: 40px; font-weight:bold">게시판 페이지입니다</div><br>
	<div class=text02 style="font-size: 24px;">오늘도 즐거운 운동 즐기시길 바랍니다</div><br>
</div>
	
<div class="main02" style="text-align: center">
<div style="font-size: 40px; font-weight:bold">후기게시판 글작성</div><br>
<p style="font-size: 16px">소중한 추억을 남겨보세요.</p><br> 	
		<br> <a href="../../index.jsp" class="btn btn02"  style="font-size:16px">메인 페이지</a> <a
			href="./board.do?command=list  " class="btn btn01"  style="font-size:16px">동행 구해요</a> <a
			href="./review.do?command=list  " class="btn btn01"  style="font-size:16px">사진 후기</a> <a
			href=" ./notice.do?command=list " class="btn btn01"  style="font-size:16px">공지사항</a>	
</div>

	 <div class="board">
	<div class="board_list_wrap">




	<form id="reviewForm" action="./review.do" method="post">
			<input type="hidden" name="command" value="insertRes" /> <input
				type="hidden" name="userNo" value="${Ldto.getMember_no() }">
			<table class="board_list" style="width: 1000px">
			<caption>일정 작성</caption>
			<thead>
			<tr>
					<td colspan="3"><input type="text" id="postTitle" style="background-color:transparent; border:0 solid black; text-align:left; font-size:18px; width:970px" placeholder="게시글 제목을 적어주세요"
						name="postTitle" /></td>
				</tr>
				<tr>
					<td colspan="3"><textarea id="summernote" class="form-control" name="postContent"
							placeholder="내용을 입력해주세요"></textarea></td>
				</tr>
			</table>
			<br>
			<div class="individual01" style="text-align:right">
			<input type="submit" id="reviewsubmit" value="등록" /> <input type="button" id="mpage02" value="취소"
				onclick="location.href='../../review.do?command=list'" />
				</div>
		</form>
		</div>
		</div>
		
		<script>
      $('#summernote').summernote({
        placeholder: 'postContent',
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
     /*   callbacks: {
            onImageUpload: function(files, editor, welEditable) {
              for (var i = files.length - 1; i >= 0; i--) {
                sendFile(files[i], this);
              }
            }
          }
      });
      
      function sendFile(file, el) {
          var form_data = new FormData();
          form_data.append('file', file);
          $.ajax({
            data: form_data,
            type: "POST",
            url: '/image.do',
            cache: false,
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
            success: function(url) {
              $(el).summernote('editor.insertImage', url);
              $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
            }
          });
        }*/
    </script>
		

		
</body>
</html>