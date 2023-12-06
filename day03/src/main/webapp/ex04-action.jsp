<%@ page import="ex03.UpdownGame" %>		<!-- 자바 클래스와 연결해준다 -->
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>ex04-action.jsp</h1>
<hr>


<ol> <!--  가변인자로 받는것은 부적절하다. 
		   DTO 클래스를 만들어 사용하자(이때, 클래스에는 기본생성자가 무조건 있어야한다)-->
	
		   
	<!--  파라미터의 장점
	
		function(param1 , param2 ...)	처럼 개수만큼 일일이 작성해주지 않아도 됨
		
		★ function(ob) 이렇게 파라미터를 사용하면 일일이 자료형을 맞춰주지 않아도 된다
	
	 -->
	 
	 
	<li>ex04-form 에서 보내준 파라미터를 전달받는다</li>
	<li>Model 역할에 해당하는 클래스의 함수를 호출한다</li>
	<li>함수를 호출하면서 파라미터들을 인자로 전달한다</li>
	<li>전달할 파라미터는 단수/복수 둘다 가능</li>
	<li>함수 호출 결과로 반환되는 값을 저장</li>
	<li>반환값이 문자열이라면 쿼리스트링 형식으로 전달할 수 있다</li> 
	<li>(쿼리스트링:   ?name=john&age=20)</li>
	<li>반환값이 객체라면, 다른 방법을 사용해야함</li>
	<li>반환값을 다시 ex04-form 으로 보내서 화면에 출력할 수 있게 한다</li>

</ol>

<jsp:useBean id="dto" class="food.FoodDTO" />	<!--  이 부분은 기본생성자 만든것임 -->
<jsp:setProperty property="*" name="dto"/>

<ul>
	<li>storeName: <%=dto.getStoreName() %></li>
	<li>menuName : <%=dto.getMenuName() %></li>
	<li>category : <%=dto.getCategory() %></li>
	<li>menuPrice: <%=dto.getMenuPrice() %></li>

</ul>

</body>
</html>


