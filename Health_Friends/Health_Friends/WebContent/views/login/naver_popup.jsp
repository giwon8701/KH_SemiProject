<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>자식창</title>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<script type="text/javascript">
	var naver_id_login = new naver_id_login("WSSex0InjkcHuJcQW5ov", "http://localhost:8787/views/login/naver_popup.jsp");
	
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	
	function naverSignInCallback() {
		let member_name = naver_id_login.getProfileData("name");
		let member_email = naver_id_login.getProfileData("email");
		let member_id = member_email.split("@")[0];
		let member_gender = naver_id_login.getProfileData("gender");
		let birthmmdd = naver_id_login.getProfileData("birthday");
		let member_birthday = birthmmdd.substring(0, 2) + birthmmdd.substring(3);
		//let phone = naver_id_login.getProfileData("mobile");
		console.log(naver_id_login);
		console.log(member_name);
		console.log(member_email);
		console.log(member_id);
		console.log(member_gender);
		console.log(member_birthday);
		//console.log(phone);
		//let member_phone = phone.replace("-", "");

		opener.document.getElementById("id").value = member_id;
		opener.document.getElementById("name").value = member_name;
		opener.document.getElementById("email").value = member_email;
		//opener.document.getElementById("birthday").value = member_birthday;
		//opener.document.getElementById("phone").value = member_phone;
		//opener.document.getElementById("id").value = member_gender;
		window.close();
		
	}
</script>
<body>
    
</body>

</html>