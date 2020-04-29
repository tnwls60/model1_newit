<%@page import="qna.QnaDAO"%>
<%@page import="qna.QnaDTO"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("UTF-8");

	QnaDAO dao = new QnaDAO();
	
	int no = Integer.parseInt(request.getParameter("no"));
	int password = Integer.parseInt(request.getParameter("password"));
	
	int chkPass = dao.passCheck(no, password);
	
	if (chkPass == 0) {
%>		
<script type="text/javascript">
	alert("비밀번호가 틀립니다.");
	history.back();
</script>		

<%
      } else {
      	response.sendRedirect("view.jsp?no="+no);
      }
%>

