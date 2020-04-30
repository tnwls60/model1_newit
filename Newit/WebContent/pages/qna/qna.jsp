<%@page import="java.util.List"%>
<%@page import="qna.QnaDAO"%>
<%@page import="qna.QnaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<head>
		<title>Q&amp;A</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/Newit/assets/css/main.css" />
	</head>
	
								<%
									request.setCharacterEncoding("UTF-8");
									QnaDAO dao = new QnaDAO();
									
									String id = (String)session.getAttribute("id");
									int count = dao.getBoardCount();
									//한 페이지당 보여줄 글 개수
									int pageSize = 5;
									String reqPage = request.getParameter("reqPage");
									int nowPage; //보여질 페이지
									
									if (reqPage == null)//요청된 페이지가 없으면 즉, 첫 클릭때는 1 페이지를 출력
										nowPage=1;
									else
										nowPage = Integer.parseInt(request.getParameter("reqPage"));
									
									int startRow = (nowPage-1)*pageSize;
									int pageBlock = 5;
									int pageCount = (count-1)/pageSize+1;
									int startPage = (nowPage-1)/pageBlock * pageBlock+1;
									int endPage = startPage+pageBlock-1;									
									
									if(pageCount<endPage)
										endPage=pageCount;
									
									List<QnaDTO> qnaList = dao.getBoardList(startRow, pageSize);
									
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
										<h2><a href="single.html">Q&amp;A</a></h2>
									</div>
								</header>
								
								<div class="table-wrapper">
										<table>
											<thead>
												<tr>
													<th>번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>작성일</th>
												</tr>
											</thead>
											<tbody>
												<% 
													if(qnaList.isEmpty()){
												%>
														<tr>
															<td colspan="5">등록된 글이 없습니다.</td>
														</tr>
												<%	
													}
													else if(!qnaList.isEmpty() && (id == null  ||  !id.equals("admin")) ){
															for(int i=0; i<qnaList.size(); i++){
																QnaDTO dto = qnaList.get(i);
													%>
															<tr>
																<td><%=dto.getNo() %></td>
																<td class="left">
																	<a href="view.jsp?no=<%=qnaList.get(i).getNo()%>" onclick="passchk(<%=dto.getNo() %>); return false;">
																	<%=dto.getCategory()%>
																	</a>
																</td>
																<td><%=dto.getId() %></td>
																<td><%=dto.getWritedate() %></td>
														</tr>
														<tr id="viewPw<%=dto.getNo() %>" style="display:none;">
																<td colspan="8">
																	<form name="passForm" id="passForm" action="passchk_proc.jsp" method="post">
																			<div class="row aln-center">
																				<label>▲ 비밀번호 입력</label> 
																			</div>
																	        <div class="row aln-center">
																	            <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요" onblur="checkPw();" required="required" class="col-4">
																	            <input type="hidden" name="no" value="<%=dto.getNo() %>">
																	            <input type="submit" value="입력">
																	        </div>
																	</form>
																</td>
														</tr>
													<%
															}
													}else if(!qnaList.isEmpty() && id.equals("admin")){
															for(int i=0; i<qnaList.size(); i++){
															QnaDTO dto = qnaList.get(i);
													%>
															<tr>
																	<td><%=dto.getNo() %></td>
																	<td class="left">
																		<a href="view.jsp?no=<%=qnaList.get(i).getNo()%>">
																		<%=dto.getCategory()%>
																		</a>
																	</td>
																	<td><%=dto.getId() %></td>
																	<td><%=dto.getWritedate() %></td>
															</tr>
												<%
														}
													}
												%>
													
											</tbody>
										</table>
										
										<div class="col-6 col-12-medium row aln-right">
											<ul class="actions">
												<li><a href="write.jsp" class="button">글쓰기</a></li>
											</ul>
										</div>
							
							
							<div id="pageBox" class="row aln-center">
									<%
										if(startPage > pageBlock){
									%>
										<a href="qna.jsp?reqPage=<%=startPage - pageBlock%>">≪</a>
									<%
										}
										if(nowPage!=1){
									%>
										<a href="qna.jsp?reqPage=<%=nowPage-1%>">＜</a>
									<%			
										}
									
										for(int i=startPage; i<=endPage; i++){
											if(i==nowPage){
									%>
										<a href="qna.jsp?reqPage=<%=i%>" style="text-decoration: underline; color: red;"><%=i%></a>
									<%				
											}else{
									%>
										<a href="qna.jsp?reqPage=<%=i%>"><%=i%></a>
									<%
											}
										}
									
										if(nowPage!=pageCount){
									%>
										<a href="qna.jsp?reqPage=<%=nowPage+1%>">＞</a>
									<%			
										}
									
										//[다음] : 끝 페이지 번호가 전체 페이지 수보다 작을 때
										if(endPage < pageCount){
									%>
										<a href="qna.jsp?reqPage=<%=startPage + pageBlock%>">≫</a>
									<%
										}
									%>
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
		<script src="/Newit/assets/js/qnaReadCheck.js"></script>
		
		<script type="text/javascript">
			function passchk(no) {
				$("#viewPw"+no).toggle();
			}
		</script>
		  
	</body>
</html>
