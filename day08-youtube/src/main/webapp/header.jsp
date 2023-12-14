<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<jsp:useBean id="dao" class="youtube.YoutubeDAO" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<style>
	div.box {
		width: 1500px;
		margin: 0 auto;
	}
	body {
		background-color: white;
	}
	.frame {
		width: 1200px;
		margin: 0 auto;
	}
	.center {
		justify-content: center;
		align-items: center;
		
	}
	a:hover {
		text-decoration: none;
	}
	header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding-bottom: 40px;
		
	}
	nav > ul {
		display: flex;
		justify-content: space-between;
		width: 300px;
		list-style: none;
		padding: 0;
	}
	nav > ul > li {
		background-color: #333;
		border-radius: 10px;
		padding: 7px;
	}
	nav > ul > li > a {
		color: white;
		font: bold;
		text-decoration: none;
	}
	nav > ul > li:hover {
		background-color: #ccc;
		font: bold;
	}
	
	div.contents {
		display: flex;
		flex-flow: wrap;
		margin: auto;
		
		border-radius: 5px;
	}
	div.item {
		box-sizing: border-box;
		width: 200px;
		margin: 10px;
		padding: 10px;
		text-align: center;
	}	
	div.imgname {
		display: flex;
		padding-top: 20px;
		padding-bottom: 10px;
	}
	
	iframe {
		border-radius: 10px;
	}
	
	p > input[type="search"] {
		width: 1000px;
		padding-top: 10px;
		padding-bottom: 10px;
		border-radius: 5px;
		align-items: center;
	}
	div.title {
		font-size: 16px;
		font: bold;
	}
	div.name {
		font-size: 12px;
		padding-top: 20px;
	}
	div.addData {
		border-top: 2px solid #eee;
		padding-top: 40px;
		padding-bottom: 10px; 
	}
	div.item {
		width: 214px;
	}
	div.img > a > img {
		border-radius: 10px;
	}
	.sbIndex {
		display: flex;
		justify-content: space-between;
	}
	.sbIndex > div > img {
		width: 40px;
	}
	

</style>

<body>

<div class="box">
	<div class="sbIndex">
		<a href="${cpath }/list.jsp"><img src="image/유튜브.png"></a>
		<div>
			<img src="image/녹화1.png">
			<img src="image/알림1.png">
			<img src="image/내 이름.png">
		</div>
	</div>
	
	<div class="frame">
		<div class="center">
			<p><input type="search" placeholder="검색"></p>
		</div>
	</div>
	<header class="frame">
		<nav>
			<ul>
				<li><a href="list.jsp">전체</a></li>
				<li><a href="list.jsp?category=음악">음악</a></li>
				<li><a href="list.jsp?category=반려동물">반려동물</a></li>
			</ul>
	
		</nav>	
	</header>
</div>

</body>
</html>