	
		//숫자 비밀번호 체크
		function checkPw(){
			var pw = $("#password").val();
			var reg = /^[0-9]+$/;
			
			
		 	if(!reg.test(pw)){
		 		alert("비밀번호는 숫자로 입력해주세요.");
		 	}
		}
