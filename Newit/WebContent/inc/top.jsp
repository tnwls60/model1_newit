<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
					<header id="header">
						<h1><a href="/Newit/pages/index.jsp">NEWIT</a></h1>
						<nav class="links">
							<ul>
								<li><a href="/Newit/pages/about/about.jsp">ABOUT</a></li>
								<li><a href="/Newit/pages/library/library.jsp">LIBRARY</a></li>
								<li><a href="/Newit/pages/qna/qna.jsp">Q&amp;A</a></li>
							<%
							String id = (String)session.getAttribute("id");
							if(id == null){
							%>	
								<li><a href="/Newit/pages/member/signup.jsp">SIGN UP</a></li>
								<li><a href="/Newit/pages/member/login.jsp">LOGIN</a></li>
							<%				
							}else {//session영역에 값이 저장되어 있다면?
							%>
								<li><a href="/Newit/pages/member/mypage.jsp">MYPAGE</a></li>
								<li><a href="/Newit/pages/member/logout.jsp">LOGOUT</a></li>
							<%		
							}
							%>
							</ul>
						</nav>
						
						<nav class="main">
							<ul>
								<li class="menu">
									<a class="fa-bars" href="#menu">Menu</a>
								</li>
							</ul>
						</nav>
					</header>

				
				<!-- Menu -->
					<section id="menu">

						<!-- Actions -->
							<section>
								<ul class="actions stacked alt">
									<li><a href="/Newit/pages/about/about.jsp">ABOUT</a></li>
									<li><a href="/Newit/pages/library/library.jsp">LIBRARY</a></li>
									<li><a href="/Newit/pages/qna/qna.jsp">Q&amp;A</a></li>
									<%
										if(id == null){
										%>	
											<li><a href="/Newit/pages/member/login.jsp" class="button large fit">Log In</a></li>
											<li><a href="/Newit/pages/member/signup.jsp" class="button large fit">Sign Up</a></li>
										<%				
										}else {//session영역에 값이 저장되어 있다면?
										%>
											<li><a href="/Newit/pages/member/mypage.jsp" class="button large fit">MYPAGE</a></li>
											<li><a href="/Newit/pages/member/logout.jsp" class="button large fit">LOGOUT</a></li>
										<%		
										}
										%>
									
									
								</ul>
							</section>
							
					</section>
					
					