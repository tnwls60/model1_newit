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
								<header>
									<div class="title">
										<h2><a href="single.html">자료실 글쓰기</a></h2>
									</div>
								</header>
								
									<section>
									<form method="post" id="fileForm" action="write_proc.jsp" enctype="multipart/form-data" accept-charset="UTF-8">
										<div class="row gtr-uniform">
											<div class="col-12">
										 		<input type="text" name="title" id="title" placeholder="제목을 입력하세요" />
											</div>
											<div class="col-12">
												<textarea name="content" id="content" placeholder="내용을 입력하세요" rows="6"></textarea>
											</div>
											<div class="col-12">
												<input type="file" name="file" id="file"/>
											</div>
											
											<div class="col-12 row aln-right">
												<ul class="actions">
													<li><input type="submit" value="글쓰기" /></li>
													<li><a href="library.jsp" class="button">목록으로</a></li>
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
