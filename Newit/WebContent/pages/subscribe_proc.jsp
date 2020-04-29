<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="subscribe.SubscribeDAO"/>
<jsp:useBean id="dto" class="subscribe.SubscribeDTO"/>    
<jsp:setProperty property="*" name="dto"/>
<%
	dao.addSubscribe(dto);
%>
<script type="text/javascript">
	alert("구독 신청이 완료되었습니다.");
	location.href="./index.jsp";
</script>




