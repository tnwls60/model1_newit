<%@ page contentType="text/html; charset=UTF-8"
	 pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>	
<jsp:useBean id="dao" class="qna.QnaDAO"/>
<jsp:useBean id="dto" class="qna.QnaDTO"/>   
<jsp:setProperty property="*" name="dto"/> 

<%	
	dao.modifyBoard(dto);
%>		

<script type="text/javascript">
	alert("수정되었습니다.");
	location.href="qna.jsp";
</script>		
