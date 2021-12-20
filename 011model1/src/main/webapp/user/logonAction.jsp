<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="spring.model1.service.user.vo.UserVO" %>
<%@ page import="spring.model1.service.user.dao.UserDao" %>

<%
	UserVO userVO = (UserVO)session.getAttribute("userVO");
	if(userVO == null){
		userVO = new UserVO();
	}
%>

<!-- 로그인한 회원 : home.jsp로 이동 -->
<% if(userVO.isActive()) { %>
	<jsp:forward page="home.jsp"/>
<% } %>

<!-- 미로그인 회원 -->
<% 
    // 한글처리
	request.setCharacterEncoding("UTF-8");

	// Client Form Data 처리
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	// Navigation 디폴트 페이지 지정
	String targetAction = "/user/logon.jsp";
	
	// Client Form Data Value Object Binding
	userVO.setUserId(userId);
	userVO.setUserPwd(userPwd);
	
	// DAO 이용해 DB 확인
	UserDao userDAO = new UserDao();
	userDAO.getUser(userVO);
	
	// 로그인 유무 확인
	if(userVO.isActive()){
		session.setAttribute("userVO", userVO);
		targetAction = "/user/home.jsp";
	}
%>

<!-- Navigation -->
<jsp:forward page='<%= targetAction  %>'/>





