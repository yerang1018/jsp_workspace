<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<header>
	<h1><a href="${cpath }">LOGO</a></h1>
	<div align="right">
		<c:if test="${not empty login }">
			<h3>${login.userid } 님 안녕하세요</h3>
			<a href="${cpath }/logout"><button>로그아웃</button></a>
		</c:if>
	</div>
	<nav>
		<ul>
			<li><a href="${cpath }/login">로그인</a></li>
			<li><a href="${cpath }/board">게시판</a></li>
		</ul>
	
	</nav>
</header>

</body>
</html>