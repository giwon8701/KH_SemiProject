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
	
	function following(){
		var queryString = "?command=following";
		$.ajax({
			url: "../../follow.do"+queryString,
			dataType: "json",
			success: function(data){
				if(data.length < 1) {
					$("#list").empty();
					$("#list").text('내가 팔로잉 하는 사람이 아직 없습니다.');
					$("#following").css("background-color", "skyblue");
					
				} else {
					$("#list").empty();
					$table = $("<table>");
					
					for(var i = 0; i < data.length; i++){
						$tr = $("<tr>");
						$td01 = $("<td>").append("<img src='../../profileimg/"+data[i].member_picture_path +"' style='width:100px; height:100px'>");
						$td02 = $("<td>").append(data[i].member_id);
						$tr.append($td01).append($td02);
						
						$table.append($tr);
					}
					$("#list").append($table);
					$("#following").css("background-color", "skyblue");
				}
			},
			error : function(err){
				alert(err);
			}
		});
	};
	
	function follower(){
		$.ajax({
			url: "../../follow.do?command=follower",
			dataType: "json",
			success: function(data){
				if(data.length < 1) {
					$("#list").empty();
					$("#list").text('나를 팔로우 하는 사람이 아직 없습니다.');
					$("#follower").css("background-color", "skyblue");
				} else {
					$("#list").empty();
					$table = $("<table>");
					
					for(var i = 0; i < data.length; i++){
						$tr = $("<tr>");
						$td01 = $("<td>").append("<img src='../../profileimg/"+data[i].member_picture_path +"' style='width:100px; height:100px'>");
						$td02 = $("<td>").append(data[i].member_id);
						$tr.append($td01).append($td02);
						
						$table.append($tr);
					}
					$("#list").append($table);
				}
			},
			error : function(err){
				alert('통신 에러');
			}
		});
	};
	
</script>
</head>
<body>
		
		
		<div>
			<div id="following" onclick="following()">팔로잉</div>
			<div id="follower" onclick="follower()">팔로워</div>
		</div>
		<div id="list"></div>
		
		
		<!--  
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
		-->
			
		
</body>
</html>