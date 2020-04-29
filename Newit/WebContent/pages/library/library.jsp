<%@page import="java.util.List"%>
<%@page import="library.LibraryDAO"%>
<%@page import="library.LibraryDTO"%>
<%@page import="java.util.ArrayList"%>
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
										<h2><a href="single.html">자료실</a></h2>
									</div>
								</header>
								
								
								<%
									request.setCharacterEncoding("UTF-8");
								
									LibraryDAO dao = new LibraryDAO();
									
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
									String search_op= request.getParameter("search_op");
									String search_key = request.getParameter("search_key");
									
									if(pageCount<endPage)
										endPage=pageCount;
									
									List<LibraryDTO> libraryList = dao.getBoardList(startRow, pageSize, search_op, search_key);
									List<LibraryDTO> list = null;
									
								%>
									<div class="table-wrapper">
										<table>
											<thead>
												<tr>
													<th>번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>조회수</th>
													<th>작성일</th>
												</tr>
											</thead>
											<tbody>
												<% 
													if(libraryList.isEmpty()){
												%>
														<tr>
															<td colspan="5">등록된 글이 없습니다.</td>
														</tr>
												<%	
													}
													else{
														for(int i=0; i<libraryList.size(); i++){
															LibraryDTO dto = libraryList.get(i);
												%>
															<tr>
																<td><%=dto.getNo() %></td>
																<td class="left">						
																	<a href="view.jsp?no=<%=libraryList.get(i).getNo()%>&nowPage=<%=nowPage%>">
																		<%=dto.getTitle()%></a>
																</td>
																<td><%=dto.getId() %></td>
																<td><%=dto.getReadcount() %></td>
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
										
										<form id="library_search" action="library.jsp">
										<div class="row aln-center">
											<div class="col-2">
												<select name="search_op">
													<option value="no">번호</option>
													<option value="title" selected>제목</option>
													<option value="content">내용</option>
													<option value="id">작성자</option>
												</select>
											</div>
											<div class="col-4">
													<input type="text" name="search_key" placeholder="검색할 내용을 입력해주세요">
											</div>
											<div class="col-1">
													<input type="submit" value="검색">
											</div>
										</div>
										</form>
										
										
										<div id="pageBox" class="row aln-center">
									<%
										if(startPage > pageBlock){
									%>
										<a href="library.jsp?reqPage=<%=startPage - pageBlock%>">≪</a>
									<%
										}
										if(nowPage!=1){
									%>
										<a href="library.jsp?reqPage=<%=nowPage-1%>">＜</a>
									<%			
										}
									
										for(int i=startPage;i<=endPage;i++){
											if(i==nowPage){
									%>
										<a href="library.jsp?reqPage=<%=i%>" style="text-decoration: underline; color: red;"><%=i%></a>
									<%				
											}else{
									%>
										<a href="library.jsp?reqPage=<%=i%>"><%=i%></a>
									<%
											}
										}
									
										if(nowPage!=pageCount){
									%>
										<a href="library.jsp?reqPage=<%=nowPage+1%>">＞</a>
									<%			
										}
									
										//[다음] : 끝 페이지 번호가 전체 페이지 수보다 작을 때
										if(endPage < pageCount){
									%>
										<a href="library.jsp?reqPage=<%=startPage + pageBlock%>">≫</a>
									<%
										}
									%>
									</div>
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
