<%@page import="library.LibraryDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no"); 
	
	LibraryDAO dao = new LibraryDAO();

	dao.deleteBoard(Integer.parseInt(no));
	response.sendRedirect("library.jsp");
%>

