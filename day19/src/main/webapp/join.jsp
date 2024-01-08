<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${pageContext.request.method == 'GET' }" >
	
	<form method="POST">
		<p><input type="text" name="userid" placeholder="ID" required></p>
		<p><input type="password" name="userpw" placeholder="Password" required></p>
		<p><input type="text" name="username" placeholder="Name" required></p>
		<p><input type="email" name="email" placeholder="abc@naver.com" required></p>
		<p>
			<label><input type="radio" name="gender" value="남성" required>남성</label>
		   <label><input type="radio" name="gender" value="여성" required>여성</label>
		</p>
		<p><input type="submit" value="가입"></p>
		
	</form>
	
</c:if>

<c:if test="${pageContext.request.method == 'POST' }" >
	<jsp:useBean id="dto" class="member.MemberDTO" />
	<jsp:setProperty property="*" name="dto" />
	<c:set var="row" value="${memberDAO.insert(dto) }" />
	<c:if test="${row != 0 }">
		<c:redirect url="/login.jsp" />
	</c:if>
</c:if>

</body>
</html>