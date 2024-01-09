<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.* , board2.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="memberDAO" value="${MemberDAO.getInstance() }" />
<c:set var="boardDAO" value="${BoardDAO.getInstance() }" />
<c:set var="fileUtil" value="${FileUtil.getInstance() }" />

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	table#boardList {
		border-collapse: collapse;
		width: 900px;
		margin: 20px auto;
	}
	
	table#boardList > thead {
		background-color: black;
		color: white;
	}
	table#boardList > tbody > tr {
		border-bottom: 1px solid grey;
		transition-duration: 1s;
	}
	table#boardList > tbody > tr:hover {
		background-color: #eee;
		transition-duration: 1s;
		
	}
	
	table#boardList td, 
	table#boardList th {
		padding: 10px;
		text-align: center;
	}
	
	table#boardList > thead > tr > th:nth-child(1) { width: 10% }
	table#boardList > thead > tr > th:nth-child(2) { width: 50% }
	table#boardList > thead > tr > th:nth-child(3) { width: 10% }
	table#boardList > thead > tr > th:nth-child(4) { width: 10% }
	table#boardList > thead > tr > th:nth-child(5) { width: 20% }
	
	table#boardList > tbody > tr > td:nth-child(2) { text-align: left; }
	
	.sb {
		width: 900px;
		margin: 20px auto;
		display: flex;
		justify-content: space-between;
	}
	
	a {
		text-decoration: none;
		color: inherit;
		padding-left: 10px;
	}
	a:hover {
		text-decoration: underline;
	}
	table#boardList a {
		display: inline-block;
		width: 90%;
	}
	table#boardList a:hover {
		text-decoration: none;
	}
	div.font {
		font-size: 14px;
		font-weight: bold;
		padding-right: 40px;
		padding-top: 20px;
		padding-bottom: 10px;
	}
	.flex {
		display: flex;
	}
	.center {
		width: 900px;
		padding: 0px auto;
	}
	
	.bold {
		font-weight: bold;
		color: red;
	}
	div.box2 {
		width: 900px;
		margin: 20px auto;
	}
	
	ul > li {
		list-style: none;
		padding-bottom: 10px;
		padding-left: 0px;
	}

</style>

</head>
<body>

<!-- 
		table#boardList a {
			display: block;			//	a 태그는 기본요소가 inline 이기 때문에 
			width: 100%;			//	클릭되는 영역이 한정적임(해당 글자 영역내에서만 클릭됨)

-->
<header>
	<h1><a href="${cpath }">게시판</a></h1>
</header>

<div id="log">
	<c:if test="${login == null }">
		<p><a href="${cpath }/login.jsp">로그인</a></p>
	</c:if>
	<c:if test="${login != null }">
		<div class="sb">
			<p>${login.userid }님 접속중<p>
			<a href="${cpath }/mypage.jsp">마이페이지</a>
			<a href="${cpath }/logout.jsp"><button>로그아웃</button></a>
		</div>
	</c:if>
</div>

<div id="join">
	<p><a href="${cpath }/join.jsp">회원가입</a></p>
</div>




