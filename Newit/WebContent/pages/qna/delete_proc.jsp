<%@page import="qna.QnaDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no"); 
	
	QnaDAO dao = new QnaDAO();

	dao.deleteBoard(Integer.parseInt(no));
	response.sendRedirect("qna.jsp");
%>

