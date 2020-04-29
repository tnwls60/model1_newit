<%@page import="qna.QnaDAO"%>
<%@page import="qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Q&amp;A 수정</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/Newit/assets/css/main.css" />
	</head>
	
	
	<%
		int no = Integer.parseInt(request.getParameter("no"));	
		
		QnaDAO dao = new QnaDAO();
		QnaDTO dto = dao.getBoard(no);
		
		String category = dto.getCategory();
		String content = dto.getContent();
		
	%>
	
	
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
								<header>
									<div class="title">
										<h2><a href="single.html">Q&amp;A 수정하기</a></h2>
									</div>
								</header>
								
									<section>
									<form action="modify_proc.jsp" method="post">
										<div class="row gtr-uniform">
											<div class="col-12">
												<input type="text" value=<%=category %> readonly="readonly">
											</div>
											<div class="col-12">
												<textarea name="content" id="content" rows="6"><%=content%></textarea>
												<input type="hidden" name="no" value=<%=no %>>
											</div>
											
											<div class="col-12">
												<ul class="actions">
													<li><a href="qna.jsp" class="button">목록으로</a></li>
													<li><button type="submit">수정하기</button></li>
												</ul>
											</div>
										</div>
										</form>
									</section>
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
