	var pwCheck = false;
		
		//숫자 비밀번호 체크
		function checkPw(){
			var pw = $("#password").val();
			var check = $("#checkpw");
			var reg = /^[0-9]+$/;
			
		 	if(!reg.test(pw)){
		 		check.html("<font color='red'>비밀번호는 숫자만 입력해주세요.</font>");
		 	}else{
		 		check.html("<font color='green'>유효한 비밀번호 형식입니다.</font>");
		 		pwCheck = true;
		 	}
		}
		
		function checkQna(){
		if(pwCheck == true){
			qnaForm.submit();
		}else{
			alert("올바르지 않은 형식이 있습니다.");
			return false;
		}
	}