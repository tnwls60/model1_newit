<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<head>
		<title>Membership Withdrawal</title>
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
						<article class="row post aln-center">
						<div class="col-9">
							<form action="/Newit/pages/member/drop_proc.jsp" method="post">
								<div class="row aln-center gtr-uniform">
									<div class="col-12 align-center">
										<h2>회원탈퇴</h2>
									</div>
									<div class="col-9">
										<ul class="actions stacked align-center">
											<li>
												<label>비밀번호 확인</label>
												<input type="password" name="password" required>
											</li>
											<li>
												<input type="submit" name="login" value="탈퇴하기" class="button fit" >
											</li>
										</ul>
									</div>
								</div>
							</form>	
						</div>
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
		
		
		
	</body>
</html>