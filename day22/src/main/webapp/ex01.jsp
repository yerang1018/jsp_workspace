<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#wrap {
		width: 500px;
		height: 500px;
		background-color: lightpink;
		margin: auto;
		position: relative;
		padding: 20px;
		text-align: right;
	}
	.item1 , .item2, .item3 {
		position: absolute;
		top: 20px;
		left: 20px;
		width: 300px;
		height: 300px;
		background-color: red;
		color: white;
		font-size: 20px;
		z-index: 2;
		
	}
	.item2 {
		top: 120px;
		left: 120px;
		z-index: 3;
		background-color: green;
	}
	.item3 {
		top: 220px;
		left: 220px;
		z-index: 4;
		background-color: blue;
	}
</style>

</head>
<body>


<h3>JSP (model 1 의 장단점)</h3>
<ul>
	<li>HTML 과 Java 코드를 함께 사용할 수 있다</li>
	<li>Java 코드를 편리하게 사용하기 위한 라이브러리가 있다 (EL / JSTL)</li>
	<li>개발 로직과 화면 구성을 동시에 수행할 수 있다 (개발이 빠름)</li>
</ul>

<ul>
	<li>사이트 규모가 커지면, 파일 관리가 어려워진다</li>
	<li>개발 로직과 화면 구성을 동시에 수행할 수 있다 (유지 보수가 까다로움)</li>
	<li>HTML과 Java 코드를 분리하여 처리 및 표현을 별도로 개발하는 편이 더 좋다</li>
</ul>


<h3>모델과 뷰의 분리가 가장 중요 <br>
	무조건 사용자가 직접 DB에 접근할 수 있으면 안되기 때문<br>
	
	MVC 패턴 사용이유	<br>	
	1) 유지보수 편리	<br>	
	
	2) 모델과 뷰를 분리시켜서 컨트롤러에서 통제하게 만들기 위해서 (== 사용자는 항상 프로그램을 통해서 데이터에 접근하고 처리)

</h3>

<div id="wrap">
	<div class="item1">Model(Database)</div>
	<div class="item2">View(HTML)</div>
	<div class="item3">Controller(Java)</div>
</div>	


</body>
</html>