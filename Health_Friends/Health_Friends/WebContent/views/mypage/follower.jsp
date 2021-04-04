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
<script type="text/javascript">
	$("#following").click(function(){
		$.ajax({
			url: "../../follow.do?command=followingtest",
			dataType: "json",
			success: function(data){
				if(data.list.length < 1) {
					$("#list").text('내가 팔로잉 하는 사람이 아직 없습니다.');
					$("#following").css("background-color", "skyblue")
				} else {
					$table = $("<table>");
					
					for(var i = 0; i < data.list.length; i++){
						$tr = $("<tr>");
						for(var j = 0; j < 2; j++){
							$td = $("<td>").
						}
					}
				}
			},
			error : function(err){
				alert('통신 에러');
			}
		});
	});
</script>
</head>
<body>
		
		
		<div>
			<div id="following">팔로잉</div>
			<div id="follower"></div>
		</div>
		<div id="list"></div>
		
		
		
			<div>
				<c:forEach items="${list }" var="dto">
					<table>
						<tr>
							<c:choose>
								<c:when test="${dto.getMember_picture_path() == null}">
									<td>no_image</td>
								</c:when>
								<c:otherwise>
									<td>
										<img src="../../profileimg/${dto.member_picture_path }" id="profile-img" />
									</td>
								</c:otherwise>
							</c:choose>
							<td>${dto.member_id }</td>
						</tr>
					</table>
				</c:forEach>
			</div>
			
			
		
</body>
</html>