function onSubmitLogin(){
	if($("[name=loginMemberId]").val() == null || $("[name=ㅣloginMemberId]").val() == "" || $("[name=loginMemberPw]").val() == null || $("[name=loginMemberPw]").val() == ""){
		
		$("#loginchk").text("아이디와 비밀번호를 입력해주세요.");
		$("#loginchk").css("font-size", "10px").css("color", "red");
			
	} else{
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
            	$.ajax({
	            	 url: "../../kakao.do?command=registChk&email=" + res.kakao_account.email,
	            	 success: function(cnt){
	            		 var email = res.kakao_account.email;
	            		 var birthday = res.kakao_account.birthday;
	            		 var gender = res.kakao_account.gender;
	            		 
	            		 if(cnt == 0){
	            			var queryString = "?command=kakaoRegist&email="+email+"&birthday="+birthday+"&gender="+gender;
	            			alert("회원정보가 존재하지 않습니다! 간편 회원가입 페이지로 이동합니다.");
	            			location.href="../../kakao.do"+queryString;
	            		 } else if(cnt > 0){
	            			 location.href="../../kakao.do?command=kakaoLogin&email="+email;
	            		 }
	            	 }		 
	              });
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