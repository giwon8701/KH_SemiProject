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
	
<body>

	<form id="reviewForm" action="../../review.do" method="post">
			<input type="hidden" name="command" value="insertRes" /> <input
				type="hidden" name="userNo" value="${Ldto.getMember_no() }">
			<table border="1" style="width: 1000px">
				<tr>
					<th colspan="3">사진후기</th>
				</tr>
				<tr>
					<td colspan="3"><input type="text" id="postTitle" placeholder="게시글 제목을 적어주세요"
						name="postTitle" /></td>
				</tr>
				<tr>
					<td colspan="3"><textarea id="summernote" class="form-control" name="postContent"
							placeholder="내용을 입력해주세요"></textarea></td>
				</tr>
			</table>
			<input type="submit" id="reviewsubmit" value="등록" /> <input type="button" value="취소"
				onclick="location.href='../../review.do?command=list'" />
		</form>
		
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
        ],
        callbacks: {
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
        }
    </script>
		

		
</body>
</html>