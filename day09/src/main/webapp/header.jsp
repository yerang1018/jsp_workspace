<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<jsp:useBean id="dao" class="day09.ProductDAO" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	div.coupang {
		padding-bottom: 60px;
	}
	nav {
		display: flex;
		justify-content: center;
		padding-bottom: 50px;
	}
	nav > li {
		list-style: none;
	}
	nav > li > a {
		text-decoration: none;
		background-color: #666;
		color: white;
		padding: 10px;
		border-radius: 10px;
		font-size: 17px;
		margin: 0 auto;
	}
	div.box {
		box-sizing: border-box;
		width: 900px;
		text-align: center;
	}
	table {
		text-align: center;
		font-size: 15px;
	}
	div.tableStyle {
		width: 500px;
		margin: 0 auto;
	}
	div.formStyle {
		width: 500px;
		margin: 0 auto;
	}
	div.formStyle > input[type=""] {
		width: 200px;
		padding: 10px;
	}

</style>


</head>
<body>




<header class="frame">
	<div class="coupang">
		<a href="${cpath }"><img src="https://image7.coupangcdn.com/image/coupang/common/logo_coupang_w350.png" width="150px"></a>
	</div>
	<nav>
		<li><a href="list.jsp">쿠팡 제품 관리 프로그램</a><li>
	</nav>
</header>



</body>
</html>