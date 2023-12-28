<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<section>
	<h3>login.jsp</h3>
	<form method="POST" action="login-action.jsp">
		<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
		<p><input type="password" name="userpw" placeholder="Password" required></p>
		<p><input type="submit" value="로그인"></p>
	</form>
	
</section>





</body>
</html>