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
		let gender = naver_id_login.getProfileData("gender");
		let birthmmdd = naver_id_login.getProfileData("birthday");
		opener.console.log(gender);
		const birthmonth = birthmmdd.substring(0, 2);
		const birthdate =  birthmmdd.substring(3);
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
			let month = opener.document.getElementsByName("mm")[0];
			let date = opener.document.getElementsByName("dd")[0];
			for (let i=0; i<month.length; i++) {
				if (month[i].value == birthmonth) {
					month[i].selected = "selected";
				}
			}
			for (let i=0; i<date.length; i++) {
				if (date[i].value == birthdate) {
					date[i].selected = "selected";
				}
			}
			if (gender == "M") opener.document.getElementById("m").checked = true;
			else if (gender == "F") opener.document.getElementById("f").checked = true;
			
			opener.document.getElementById("name").readOnly = true;
			opener.document.getElementById("email").readOnly = true;
			opener.document.getElementById("name").style.color = "gray";
			opener.document.getElementById("email").style.color = "gray";
			opener.document.getElementById("email").title = "y";
			opener.document.getElementById("sign-up-btn").click();
			opener.idCheck();
			
			window.close();
		}
	}
	
</script>
<body>
    
</body>

</html>