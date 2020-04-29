<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <%
	request.setCharacterEncoding("utf-8");
 	String refresh = request.getHeader("Referer");
%>

<jsp:useBean id="c_dao" class="qna.CommentDAO"/>
<jsp:useBean id="c_dto" class="qna.CommentDTO"/>
<jsp:setProperty property="*" name="c_dto"/>

<%
	c_dao.insertComment(c_dto);
	response.sendRedirect(refresh);
%>

<script>
</script>
