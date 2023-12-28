<!--  필요한 거 모두 준비  -->

<!--  항상 header 다음에 index 페이지가 이어진다 생각하고
	  상단부에 무엇이 들어갈지 생각해보기 
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="day14.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="dao" value="${MemberDAO.getInstance() }" />
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		background-color: #eee;
		font-size : 17px;
		
	}

	header, section {
		background-color: white;
		padding: 20px;
		box-sizing: border-box;
	}
	h1, h2, h3, h4, h5, h6 {
		margin-top: 0;
		margin-bottom: 0;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: underline;
	}
	h1 {
		text-align: center;
	}
	nav > ul {
		display: flex;
		justify-content: space-between;
		padding-left: 0;
		list-style: none;
		width: 500px;
		margin: 20px auto;
	}
	table {
		text-align: center;
		border: 2px solid black;
		border-collapse: collapse;
		justify-content: center;
	}

	td , th {
		padding: 10px;
	}
	
	tr {
		border-bottom: 1px solid grey;
	}
	div#loginInfo {
		height: 23px;
	}
</style>

</head>
<body>

<!--	loginInfo	: 사용자가 있다면 login.username 을 보여줘라 (= 현재 접속자) -->

<header class="frame">
	<h1><a href="${cpath }">Member CRUD</a></h1>
	<div id="loginInfo" >		
		<c:if test="${not empty login }">	
			<h4 align="right">현재 접속자 : ${login.username }</h4>
		</c:if>
	</div>
	<nav>
		<ul>
			<li><a href="${cpath }/list.jsp">목록</a></li>
			<li><a href="${cpath }/join.jsp">추가(회원가입)</a></li>
			
			<c:if test="${empty login }">
			<li><a href="${cpath }/login.jsp">로그인</a></li>
			</c:if>
			
			<c:if test="${not empty login }">
			<li><a href="${cpath }/logout.jsp">로그아웃</a></li>
			</c:if>
			
		</ul>
	</nav>
</header>



</body>
</html>