	function chkPW() {
	    if ($("#pw").val() != '' && $("#pwchk").val() != '') {
	        if ($("#pw").val() == $("#pwchk").val()) {
	        	$("#same").text("비밀번호가 일치합니다");
	        	$("#same").css("color", "blue");
	        	$("#pwchk").prop("title", "y");
	        	$("#pw").css("background-color", "skyblue");
	        	$("#pwchk").css("background-color", "skyblue");
	          
	        } else {
	        	$("#same").text("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
	            $("#same").css("color", "red");
	            $("#pw").css("background-color", "red");
	            $("#pwchk").css("background-color", "red");
	            $("#pwchk").prop("title", "n");
	        }
	    }
	}
	
	function idCheck(){
		var newId = $("#id").val();
		if($.trim(newId) == "" || $.trim(newId) == null){
			$("#idchk").text("아이디를 입력해주세요").css("color","red");
		} else{
			var queryString = "?command=idCheck&memberId="+newId;
			$.ajax({
				url: "regist.do"+queryString,
				dataType: "text",
				success: function(data){
					if(data == 0){
						$("#idchk").text("사용가능한 아이디입니다.");
			            $("#idchk").css("color", "blue");
			            $("#id").prop("title", "y");
			            $("#id").css("background-color", "skyblue");
					} else if(data == 1) {
						$("#idchk").text("이미 사용중인 아이디입니다.");
			            $("#idchk").css("color", "red");
			            $("#id").css("background-color", "red");
			            $("#id").prop("title", "n");
			            $("#id").focus();
					}
				},
				error: function(){
					$("#idchk").text("통신오류");
		            $("#idchk").css("color", "blue");
				}
			});
		}
	}
	
	function phoneChk(){
		var newPhone = $("#phone").val();
		if($.trim(newPhone) == "" || $.trim(newPhone) == null){
			$("#phonechk").text("전화 번호를 입력해주세요").css("color", "red");
		} else{
			var queryString = "?command=phoneCheck&memberPhone="+newPhone;
			$.ajax({
				url: "regist.do"+queryString,
				dataType: "text",
				success: function(data){
					if(data == 0){
						$("#phonechk").text("등록 가능한 번호입니다.");
			            $("#phonechk").css("color", "blue");
			            $("#phone").prop("title", "y");
			            $("#phone").css("background-color", "skyblue");
			            
					} else if(data == 1) {
						$("#phonechk").text("이미 사용중인 번호입니다.");
			            $("#phonechk").css("color", "red");
			            $("#phone").prop("title", "n");
			            $("#phone").focus();
			            $("#phone").css("background-color", "red");
					}
				},
				error: function(){
					$("#phonechk").text("통신오류");
		            $("#phonechk").css("color", "blue");
				}
			});
		}
	}
	
	function emailChk(){
		var newEmail = $("#email").val();
		if($.trim(newEmail) == "" || $.trim(newEmail) == null){
			$("#emailchk").text("이메일을 입력해주세요").css("color", "red");
		} else{
			var queryString = "?command=emailCheck&memberEmail="+newEmail;
			$.ajax({
				url: "regist.do"+queryString,
				dataType: "text",
				success: function(data){
					if(data == 0){
						$("#emailchk").text("등록 가능한 이메일입니다.");
			            $("#emailchk").css("color", "blue");
			            $("#email").prop("title", "y");
			            $("#email").css("background-color", "skyblue");
			            
					} else if(data == 1) {
						$("#emailchk").text("이미 사용중인 이메일입니다.");
			            $("#emailchk").css("color", "red");
			            $("#email").prop("title", "n");
			            $("#email").focus();
			            $("#email").css("background-color", "red");
					}
				},
				error: function(){
					$("#emailchk").text("통신오류");
		            $("#emailchk").css("color", "blue");
				}
			});
		}
	}
	
	function addrCheck(){
		
		new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                    
                    roadAddr += extraRoadAddr;
                }
                
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("#addr").val(roadAddr);
            }

        }).open();
	}
	
	
	function onSubmit(){
		if($("#id").prop("title") == "y" && $("#email").prop("title") == "y" && $("#pwchk").prop("title") == "y"){
			
			$("#registform").submit();
		} else{
			alert("입력하신 정보를 다시 확인해주세요.");
		}
	}