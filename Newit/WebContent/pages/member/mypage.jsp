<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<head>
		<title>Mypage</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/Newit/assets/css/main.css" />
		
		<%
		String id = (String)session.getAttribute("id");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.callMemInfo(id);
		
		String name = dto.getName();
		String email = dto.getEmail();
		int zipcode = dto.getZipcode();
		String address1 = dto.getAddress1();
		String address2 = dto.getAddress2();
		%>
		
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
										<h2>회원수정</h2>
									</div>
								
								<form action="modify_proc.jsp" name="modifyForm" method="post">
								<div class="row aln-center gtr-uniform">
									<div class="col-5">
										 <ul class="actions stacked">
											<li>
												<input type="text" class="input" name="id" id="id" placeholder="아이디" value="<%=id%>" required readonly>
											</li>
											<li>
												<input type="password" class="input" name="password" id="password" placeholder="새 비밀번호" onblur="checkPw()" required>
												<div class="checkpw" id="checkpw"></div>
												<input type="password" class="input" name="password2" id="password2" placeholder="비밀번호 확인" onblur="equalPw()" required>
												<div class="equalpw" id="equalpw"></div>
											</li>
											
											<li>
												<input type="text" class="input" name="name" id="name" placeholder="이름" value="<%=name%>" required readonly>
								      		</li>
								      		
											<li>
												<input type="email" class="input" name="email" id="email" placeholder="이메일" value="<%=email%>" required>
								        	</li>
								        	
								        	<li>
												<input type="text" class="input" name="zipcode" id="zipcode" placeholder="우편번호" value="<%=zipcode%>" required readonly>
												<input type="button" class="btn1 button fit" name="postcheck" value="우편번호검색" onclick="DaumPostcode();">
											</li>
											
											<li>
												<input type="text" class="input" name="address1" id="address1" placeholder="주소" value="<%=address1%>" required>
												<input type="text" class="input" name="address2" id="address2" placeholder="상세주소" value="<%=address2%>" required>
											</li>
											
											<li>
												<input type="button" onclick="checkMypage();" value="수정하기" class="btn2 button fit">
												<input type="button" value="탈퇴하기" class="btn2 button fit" onclick="location.href='drop.jsp'">
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
		
		<!-- 비밀번호 유효성, 일치 검사 -->
		<script src="/Newit/assets/js/pwCheck.js"></script>
		
	</body>
</html>