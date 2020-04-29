 <%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberDAO dao = new MemberDAO();
	int chkLogin = dao.checkMember(id, password);
	
	// chkLogin = 1 (모두일치)
	// chkLogin = 0 (아이디 불일치)
	// chkLogin = -1 (아이디 일치, 비밀번호 불일치)
	
	if(chkLogin == 0){
%>	

<script type="text/javascript">
	alert("등록된 아이디가 없습니다.");
	history.back();
</script>

<%	
	}else if(chkLogin == -1){
%>

<script type="text/javascript">
	alert("비밀번호가 틀립니다.");
	history.back();
</script>

<%	
	}else{
		session.setAttribute("id", id);
		response.sendRedirect("../index.jsp");
	}
%>