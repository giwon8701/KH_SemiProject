<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        body {
            background-color: #f2f2f2;
            font-size: 14px;
        }

        h1 {
            font-size: 2em;
            color: #666;
        }

        a {
            padding: 5px 10px;
            background-color: lightpink;
            color: #444;
            font-size: 1em;
            text-decoration: none;
        }

        a:visited,
        a:hover,
        a:focused {
            color: #444;
        }
    </style>
    <!-- https://m.blog.naver.com/PostView.nhn?blogId=simpolor&logNo=220944466478&proxyReferer=https:%2F%2Fwww.google.com%2F -->
    <!-- include libraries(jQuery, bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <script type="text/javascript">
        
    </script>
    <script>
        $(document).ready(function () {
            $('#summernote').summernote({ // summernote를 사용하기 위한 선언
                height: 400,
                callbacks: { // 콜백을 사용
                    // 이미지를 업로드할 경우 이벤트를 발생
                    onImageUpload: function (files, editor, welEditable) {
                        console.log(files)
                        sendFile(files[0], this);
                    }
                }
            });
        });
    </script>
</head>

<body>
    <h1>insert form</h1>
    <img src="image/4.jpg" />
    <form action="selfBoard.do?command=insertRes" method="post">
        <label id="title">title</label> <input type="text" name="title" placeholder="writer title here" /><br /> <label
            id="memberId">memberId</label>
        <input type="text" name="memberId" value="1" readonly /> 임시로 멤버 아이디는
        1번을 넣어 놓았다.<br /> <label id="content">content</label>
        <textarea rows="30" cols="100" name="content" id="summernote" placeholder="write something"></textarea>
        <br />
        <br /> <input type="submit" value="submit" />
    </form>
</body>

</html>