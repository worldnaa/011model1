<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="spring.model1.service.user.vo.UserVO" %>

<!-- 
	1. 로그인 유무 확인 :: Work Flow Control (방어적 코딩)
		- 비로그인 : 로그인 화면 display
		- 로그인 : 이미 로그인한 회원임을 display
	2. 로그인 확인은..
		- 로그인한 회원은 session Object Scope에 UserVO 객체를 갖고, active는 true
		- UserVO 객체의 유무 및 UserVO의 active 값의 true/false 판단 
 -->
 
<!-- UserVO를 import 했기 때문에 자세한 패키지 경로 없이 UserVO 사용 가능 -->
<% UserVO userVO = (UserVO)session.getAttribute("userVO"); %> 

<html>
	<head></head>
	<body>
		
		<% if(userVO == null || userVO.isActive() != true) { %>
			
			<form id="login" method="post" action="logonAction.jsp">
				
				아이디 : <input id="userId" type="text" name="userId" value=""><br/><br/> 
				패스워드 : <input id="userPwd" type="text" name="userPwd" value=""><br/><br/>
				<input id="submit" type="submit" name="submit" value="Enter"/>
			
			</form>
			
		<% }else{ %>
				<%= userVO.getUserId() %>님은 이미 로그인 하셨습니다.		
		<% } %>
		
	</body>
</html>