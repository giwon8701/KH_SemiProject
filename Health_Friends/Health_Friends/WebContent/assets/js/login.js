function onSubmitLogin() {
	if ($("[name=loginMemberId]").val() == null || $("[name=ㅣloginMemberId]").val() == "" || $("[name=loginMemberPw]").val() == null || $("[name=loginMemberPw]").val() == "") {

		$("#loginchk").text("아이디와 비밀번호를 입력해주세요.");
		$("#loginchk").css("font-size", "10px").css("color", "red");

	} else {
		$("#loginForm").submit();
	}
}

Kakao.init('512a80154acbfb025784436cb05beaaf');

function loginWithKakao() {
	Kakao.Auth.login({
		success: function(authObj) {

			Kakao.API.request({
				url: '/v2/user/me',
				success: function(res) {
					kakaoRegistChk(res);
					
					
				},
				fail: function(error) {
					alert(
						'login success, but failed to request user information: ' +
						JSON.stringify(error)
					)
				},
			});
		},
		fail: function(err) {
			alert(JSON.stringify(err))
		},
	})
}


async function kakaoRegistChk(res) {
	let kakao = res.kakao_account;
	let cnt = await fetch('kakao.do?command=registChk&email='+kakao.email)
	.then(response => {
		return response.text();
	}).catch(err => {console.log(err)})
	
	// 회원이 아닐 때
	if (cnt == 0) {
		alert("회원정보가 존재하지 않습니다! 간편 회원가입 페이지로 이동합니다.");
		setRegistInfo(kakao);	// 회원가입 폼에 정보 넣어줌
		
	}
	// 회원일 때
	else if (cnt > 0) {
		location.href = "kakao.do?command=kakaoLogin&email=" + kakao.email;
	}
}

function setRegistInfo(kakao) {
	
	let email = kakao.email;
	let name = kakao.profile.nickname;
	let id = email.split("@")[0];
	let birthmonth = kakao.birthday.substring(0, 2);
	let birthdate = kakao.birthday.substring(2);
	let gender = kakao.gender;
	
	document.getElementById("id").value = kakao.email.split("@")[0];
	document.getElementById("name").value = kakao.profile.nickname;
	document.getElementById("email").value = kakao.email;
	let month = document.getElementsByName("mm")[0];
	let date = document.getElementsByName("dd")[0];
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
	if (gender == "male") document.getElementById("m").checked = true;
	else if (gender == "female") document.getElementById("f").checked = true;

	document.getElementById("name").readOnly = true;
	document.getElementById("email").readOnly = true;
	document.getElementById("name").style.color = "gray";
	document.getElementById("email").style.color = "gray";
	document.getElementById("email").title = "y";
	document.getElementById("sign-up-btn").click();
	
	idCheck();
}

function enter() {
	let id = document.getElementsByName("loginMemberId")[0];
	let pw = document.getElementsByName("loginMemberPw")[0];
	let form = document.getElementById("loginForm");
	if (window.event.keyCode == 13) {
		if (id.value == "") {
//			alert("아이디를 입력해주세요.");
			document.getElementById("id_alert").style.color="red";
			document.getElementById("id_alert").style.display="block";
			document.getElementById("pw_alert").style.display="none";
			id.focus();
		} else if (pw.value == "") {
//			alert("비밀번호를 입력해주세요.");
			document.getElementById("id_alert").style.display="none";
			document.getElementById("pw_alert").style.color="red";
			document.getElementById("pw_alert").style.display="block";
			pw.focus();
		} else {
			form.submit();
		}
	}
}