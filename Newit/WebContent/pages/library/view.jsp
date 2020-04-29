<%@page import="java.io.File"%>
<%@page import="library.LibraryDAO"%>
<%@page import="library.LibraryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<%
		int no = Integer.parseInt(request.getParameter("no"));	
		
		LibraryDAO dao = new LibraryDAO();
		LibraryDTO dto = dao.getBoard(no);
	%>


	<head>
		<title>Library view</title>
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
										<h2><a href="single.html">자료실</a></h2>
									</div>
								</header>
								
									<section>
										<div class="row gtr-uniform">
											<div class="col-12">
										 		<input type="text" name="title" id="title" value="<%=dto.getTitle()%>" readonly="readonly">
											</div>
											<div class="col-12">
												<textarea name="content" id="content" rows="6" readonly="readonly"><%=dto.getContent()%></textarea>
											</div>
											<div class="col-12">
											 	<label>파일다운로드</label>
											 	<%
											 	if(dto.getSavefile() != null){
													String directory = application.getRealPath("/pages/library/file/");
													
														out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file=" +
														java.net.URLEncoder.encode(dto.getSavefile(), "utf-8") + "\">" + dto.getSavefile() + "</a><br>");
											 	}else{
											 		out.write("<span>첨부파일 없음</span>");
											 	}
												%>
											
											</div>
											
											<div class="col-12 row aln-right">
												<ul class="actions">
													<li><a href="library.jsp" class="button">목록으로</a></li>
											<%
												if(session.getAttribute("id")!=null && session.getAttribute("id").equals("admin")){
											%>	
												<li><a href="delete_proc.jsp?no=<%=no %>" class="button">삭제</a></li>
											<%
												}
											%>
												</ul>
											</div>
											
										</div>
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
