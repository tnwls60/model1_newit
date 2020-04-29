<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<head>
		<title>Library</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/Newit/assets/css/main.css" />
	</head>
	
	<body class="is-preload">
		<!-- Wrapper -->
		<div id="wrapper">
	
				<!-- Header -->
				<jsp:include page="../../inc/top.jsp"></jsp:include>
				<!-- Header -->
				
				
				<!-- Main -->
					<div id="main">
					
						<!-- Post -->
							<article class="post">
									<div class="title align-center">
										<h2>회원가입</h2>
									</div>
								
								<form action="/Newit/pages/member/signup_proc.jsp" name="signupForm" method="post">
								<div class="row aln-center gtr-uniform">
									<div class="col-5">
										 <ul class="actions stacked">
											<li>
												<input type="text" class="input" name="id" id="id" placeholder="아이디" required>
											</li>
											<li>
												<div class="checkid" id="checkid"></div>
												<input type="button" class="btn1 button fit" name="idcheck" value="중복확인" onclick="duplId();">
											</li>
											<li>
												<input type="password" class="input" name="password" id="password" placeholder="비밀번호" onblur="checkPw()" required>
												<div class="checkpw" id="checkpw"></div>
												<input type="password" class="input" name="password2" id="password2" placeholder="비밀번호 확인" onblur="equalPw()" required>
												<div class="equalpw" id="equalpw"></div>
											</li>
											
											<li>
												<input type="text" class="input" name="name" placeholder="이름" required>
								      		</li>
								      		
											<li>
												<input type="email" class="input" name="email" placeholder="이메일" required>
								        	</li>
								        	
								        	<li>
												<input type="text" class="input" name="zipcode" id="zipcode" placeholder="우편번호" required>
												<input type="button" class="btn1 button fit" name="postcheck" value="우편번호검색" onclick="DaumPostcode();">
											</li>
											
											<li>
												<input type="text" class="input" name="address1" id="address1" placeholder="주소" required>
												<input type="text" class="input" name="address2" id="address2" placeholder="상세주소" required>
											</li>
											
											<li>
												<input type="button" value="회원가입" class="btn2 button fit" onclick="checkSignup();">
											</li>
										</ul>
									</div>
								</div>
							</form>	
							</article>
					</div>

				<!-- Footer -->
				<jsp:include page="../../inc/bottom.jsp"></jsp:include>
				<!-- Footer -->
			</div>
			
		<!-- Scripts -->
		
		<script src="/Newit/assets/js/jquery.min.js"></script>
		<script src="/Newit/assets/js/browser.min.js"></script>
		<script src="/Newit/assets/js/breakpoints.min.js"></script>
		<script src="/Newit/assets/js/util.js"></script>
		<script src="/Newit/assets/js/main.js"></script>
		
		<!-- 다음 우편번호 API -->
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="/Newit/assets/js/DaumPostAPI.js"></script>
		
		<!-- 회원가입 유효성체크 -->
		<script src="/Newit/assets/js/signupCheck.js"></script>
		
		
	</body>
</html>