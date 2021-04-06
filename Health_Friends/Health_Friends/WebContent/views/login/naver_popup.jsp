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
	
	async function naverSignInCallback() {
		let member_name = naver_id_login.getProfileData("name");
		let member_email = naver_id_login.getProfileData("email");
		let member_id = member_email.split("@")[0];
		let member_gender = naver_id_login.getProfileData("gender");
		let birthmmdd = naver_id_login.getProfileData("birthday");
		const member_birthday_month = birthmmdd.substring(0, 2);
		const member_birthday_date =  birthmmdd.substring(3);
		let phone = naver_id_login.getProfileData("mobile");
		console.log(member_name);
		console.log(member_email);
		console.log(member_id);
		console.log(member_gender);
		//console.log(member_birthday);
		opener.console.log(phone);
		//let member_phone = phone.replace("-", "");
		var exist = await fetch("../../naver.do?member_name="+member_name+"&member_email="+member_email)
			.then(response => {
				return response.text();
			});
		
		if (exist === "exist") {
			opener.alert(member_name+"님, 환영합니다.");
			opener.location.href = "../../index.jsp";
			window.close();
		} else {
			opener.document.getElementById("id").value = member_id;
			opener.document.getElementById("name").value = member_name;
			opener.document.getElementById("email").value = member_email;
			//opener.document.getElementById("birthday").value = member_birthday;
			//opener.document.getElementById("phone").value = member_phone;
			//opener.document.getElementById("id").value = member_gender;
			
			opener.document.getElementById("name").readOnly = true;
			opener.document.getElementById("email").readOnly = true;
			opener.document.getElementById("name").style.color = "gray";
			opener.document.getElementById("email").style.color = "gray";
			opener.document.getElementById("email").title = "y";
			opener.document.getElementById("sign-up-btn").click();
			opener.idCheck();
			
			//opener.emailChk();
			window.close();
		}
	}
	
</script>
<body>
    
</body>

</html>