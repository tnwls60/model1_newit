	
	var pwCheck = false;
	var pwEqual = false;

	//비밀번호 유효성검사
	function checkPw(){
		var pw = $("#password").val();
		var check = $("#checkpw");
		var reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		
	 	if(!reg.test(pw)){
	 		check.html("<font color='red'>비밀번호는 숫자,알파벳,특수문자 조합으로 8자리 이상 입력해야 합니다.</font>");
	 	}else{
	 		check.html("<font color='green'>유효한 비밀번호 형식입니다.</font>");
	 		pwCheck = true;
	 	}
	}
	
	
	//비밀번호확인 일치 여부 검사
	function equalPw(){
		var pw = $("#password").val();
		var pw2 = $("#password2").val();
		var check = $("#equalpw");
		if(pw2 != ""){
			if(pw == pw2){
				check.html("<font color='green'>비밀번호가 일치합니다.</font>");
				pwEqual = true;
			}else{
				check.html("<font color='red'>비밀번호가 일치하지 않습니다.</font>");
			}
		}else{
			check.html("<font color='red'>비밀번호를 입력하십시오.</font>");
		}
	}
	
	function checkMypage(){
		if(pwCheck == true && pwEqual == true){
			modifyForm.submit();
		}else{
			alert("올바르지 않은 형식이 있습니다.");
			return false;
		}
	}