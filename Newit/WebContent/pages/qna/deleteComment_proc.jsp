<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <%
	request.setCharacterEncoding("utf-8");
	String refresh = request.getHeader("Referer");
%>

<jsp:useBean id="c_dao" class="qna.CommentDAO"/>

<%
	c_dao.deleteComment(Integer.parseInt(request.getParameter("no")));	
	response.sendRedirect(refresh);
%>

<script>
</script>
