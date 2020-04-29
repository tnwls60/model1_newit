<%@page import="java.util.List"%>
<%@page import="qna.CommentDTO"%>
<%@page import="qna.CommentDAO"%>
<%@page import="qna.QnaDAO"%>
<%@page import="qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<%
		int no = Integer.parseInt(request.getParameter("no"));	
		
		QnaDAO dao = new QnaDAO();
		QnaDTO dto = dao.getBoard(no);
		CommentDAO c_dao = new CommentDAO();
	%>


	<head>
		<title>Q&amp;A view</title>
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
										<h2><a href="single.html">Q&amp;A</a></h2>
									</div>
								</header>
								
									<section>
										<div class="row gtr-uniform">
											<div class="col-12">
												<input type="text" value=<%=dto.getCategory() %> readonly="readonly">
											</div>
											<div class="col-12">
												<textarea name="content" id="content" rows="6" readonly="readonly"><%=dto.getContent()%></textarea>
											</div>
											
											<div class="col-12 row aln-right">
												<ul class="actions">
													<li><a href="qna.jsp" class="button">목록으로</a></li>
													<li><a href="modify.jsp?no=<%=no %>" class="button">수정하기</a></li>
											<%
												if(session.getAttribute("id")!=null && session.getAttribute("id").equals("admin")){
											%>	
													<li><a href="delete_proc.jsp?no=<%=no %>" class="button">삭제</a></li>
											<%
												}
											%>
												</ul>
											</div>
											
				
											<div id="commentBox" class="col-12">
												<form method="post" id="commentForm" action="insertComment_proc.jsp">
													<input type="hidden" value=<%=session.getAttribute("id")%> name="id">
													<input type="hidden" value=<%=no%> name="qna_no">
													<input type="text" name="comment">
													<div class="row aln-right">
														<input type="submit" value="작성">
													</div>
												</form>
												
												<hr>
												<%
												if(c_dao.getCommentCount(no)>0){
													List<CommentDTO> list = c_dao.getCommentList(no);
													
													for(int i=0;i<list.size();i++){
														CommentDTO c_dto = list.get(i);
												%>
															<form method="get" id="commentDel" action="deleteComment_proc.jsp?no=<%=c_dto.getNo()%>">
																<input type="hidden" value=<%=c_dto.getNo()%> name="no">
																<div>
																	<span><%=c_dto.getId()%></span>
																	<input type="text" value="<%=c_dto.getComment()%>" readonly>
												<%
																if(session.getAttribute("id")!=null && session.getAttribute("id").equals(c_dto.getId())){
												%>
																<div class="row aln-right">
																	<input type="submit" value="삭제">
																</div>
												<%		
																}
												%>
																</div>
															</form>
												<%
													}
														
												}
												%>
											
											
											
											
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
