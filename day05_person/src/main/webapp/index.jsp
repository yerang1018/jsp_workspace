<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>

<!--  
	인원 관리 버튼을 누르면 타이틀은 list-show 인데
	 주소창은 list 로 뜬다
 -->
 
 
<style>
	div.nav {
		width: 100%;
	}
	div.nav > ul {
		width: 900px;
		margin: auto;
		display: flex;
		justify-content: center;
		list-style: none;
		padding: 0;
	}
	div.nav > ul > li {
		text-align: center;
		flex: 1;
	}
	a {
		text-decoration: none;
		color: grey;
	}
	a:hover {
		color: black;
	}
	div.nav a {
		display: black;
	}

</style>

</head>
<body>

<!-- 이 프로젝트를 시작했을때, 주소창에 다른 파일을 넣지 않는다면
	index.jsp가 실행된다.
	즉, 대문 페이지 == index.jsp	
	
	WEB-INF 를 보면 web.xml 이 있다 (스텁을 한번 이상 실행한 경우에만 !!)
	web.xml 내부에 welcome-file-list 를 보면 해당 페이지명을 가지면 애들이 어떤 역할을 하는지 적혀있다. 
-->

<h1>대문 페이지</h1>
<hr>

<div class="nav">
	<ul>
		<li><a href="list.jsp">인원 관리</a>
	</ul>
</div>




</body>
</html>