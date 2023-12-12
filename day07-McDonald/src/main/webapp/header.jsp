<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<jsp:useBean id="dao" class="McDonald.McDonaldDAO" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>McDonald</title>

<style>
	a {
		text-align: none;
		color: inherit;
	}
	a:hover {
		text-decoration: none;
	}
	.frame {
		width: 900px;
		margin: 0 auto;
		border: 1px dashed red;
	}
	header {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	nav > ul {
		display: flex;
		width: 300px;
		list-style: none;
		padding: 0;
	}
	nav > ul > li {
		flex: 1;
	}
	div.box {
		display: flex;
		flex-flow: wrap;
		margin: auto;
	}
	div.item {
		box-sizing: border-box;
		width: 200px;
		margin: 10px;
		padding: 10px;
		text-align: center;
	}
	
	
</style>
</head>
<body>

<header class="frame">
	<h1><a href="${cpath }">맥도날드</a></h1>		<!-- 맥도날드를 클릭하면 대문페이지로 이동하게함 -->
	<nav>
		<ul>
			<li><a href="list.jsp">전체</a></li>			<!-- ${cpath }/list.jsp 가 원래 맞는 작성법 -->
			<li><a href="list.jsp?category=버거">버거</a></li>	<!-- category 는 DB 테이블에 있음  -->
			<li><a href="list.jsp?category=음료">음료</a></li>
		</ul>
	</nav>
</header>

</body>
</html>