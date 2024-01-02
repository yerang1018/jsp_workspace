<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<!--  전달받은 값이 get 이면 폼을 띄우고 (= login.jsp)  -->
<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST">
		<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
		<p><input type="password" name="userpw" placeholder="Password" required></p>
		<p><input type="submit" value="로그인"></p>
	</form>
</c:if>


<!--  전달받은 값이 post 이면 객체 만들어서 값 받기 (= login-action.jsp)  -->
<c:if test="${pageContext.request.method ==  'POST' }">
	<jsp:useBean id="dto" class="member.MemberDTO" />
	<jsp:setProperty property="*" name="dto" />
	<c:set var="login" value="${memberDAO.login(dto) }" scope="session" />
	<c:redirect url="/" />
</c:if>

</body>
</html>