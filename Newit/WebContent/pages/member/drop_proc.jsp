<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("id");
	String password = request.getParameter("password");
	
	MemberDAO dao = new MemberDAO();
	int chkDrop = dao.checkDrop(id, password);
	
 if(chkDrop == 1){ 
 	 dao.dropMember(id, password);
 	 session.invalidate();
 %>
<script type="text/javascript">
	alert("회원 탈퇴가 완료되었습니다.");
	location.href="../index.jsp";
</script>
<%
}else{
%>
<script type="text/javascript">
	alert("비밀번호를 확인해주세요.");
	history.back();
</script>
<%
}
%>