<%@page import="qna.QnaDAO"%>
<%@page import="qna.QnaDTO"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("UTF-8");

	QnaDTO dto = new QnaDTO();
	QnaDAO dao = new QnaDAO();
	
	String category = request.getParameter("category");
	String content = request.getParameter("content");
	String id = (String)session.getAttribute("id");
	int password = Integer.parseInt(request.getParameter("password"));
	
	dto.setCategory(category);
	dto.setContent(content);
	dto.setId(id);
	dto.setPassword(password);
	
	dao.insertBoard(dto);
	
	response.sendRedirect("qna.jsp");
	
%>

