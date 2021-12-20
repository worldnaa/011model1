<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="spring.model1.service.user.vo.UserVO" %>

<% UserVO userVO = (UserVO)session.getAttribute("userVO"); %>

<!-- 미 로그인한 회원 -->
<% if(userVO == null || !userVO.isActive()) { %>
	<jsp:forward page="logon.jsp"/>
<% } %>

<!-- 로그인한 회원 -->
<html>
	<head></head>
	<body>
		<p>Simple Model1 Examples</p>
		<p>환영합니다. : <%= userVO.getUserId() %>님</p>
	</body>
</html>