<%@page import="library.LibraryDAO"%>
<%@page import="library.LibraryDTO"%>
<%@page import="java.util.Date"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.File" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
	String directory = application.getRealPath("/pages/library/file/");
	int maxSize = 1024 * 1024 * 100;
	String encoding = "utf-8";
	
	MultipartRequest multipartRequest = new MultipartRequest(request, directory, 
			maxSize, encoding, new DefaultFileRenamePolicy());
	
	String savefile = multipartRequest.getOriginalFileName("file");
	String originalfile = multipartRequest.getFilesystemName("file");
	
	LibraryDTO dto = new LibraryDTO();
	LibraryDAO dao = new LibraryDAO();
	
	String title = multipartRequest.getParameter("title");
	String content = multipartRequest.getParameter("content");
	String id = (String)session.getAttribute("id");
	
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId(id);
	dto.setSavefile(savefile);
	dto.setOriginalfile(originalfile);
	
	dao.insertBoard(dto);
	
	response.sendRedirect("library.jsp");
	
%>

