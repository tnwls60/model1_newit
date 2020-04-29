<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();

	response.sendRedirect("../index.jsp");
	//forward하면 내용만 불러들여서 css가 안됨!! sendRedirect 쓰기
%>
