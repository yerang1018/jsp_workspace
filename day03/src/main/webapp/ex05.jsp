<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays , java.util.List , food.FoodDTO" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>parameter   VS   attribute</h1>
<hr>



<h3>parameter</h3>
<ul>
	<li>파라미터는 사용자의 입력값을 말한다(= 키보드로 입력하니까 무조건 문자열)</li>
	<li>쿼리스트링 형태로 있을 수 있으며, 문자열로 구성된다</li>
	<li>HTTP Method가 POST 인 경우, 문자열 혹은 파일 객체로 구성될 수 있다</li>
	<li>사용자 입력값이므로, 서버 개발자가 값을 강제로 넣는 것은 불가능 (setParameter 가 없다)</li>
</ul>

<h3>attribute</h3>
<ul>
	<li>프로그램에서 활용되는 객체를 말한다</li>
	<li>Object 타입으로 정의되어 있음. (= 자바의 모든 객체 사용 가능)</li>
	<li>JSP 내장 객체에 저장해둘 수 있으며, 내장객체에 따라서 유효범위는 다르다</li>
	<li>서로 다른 JSP 페이지라도 attribute 를 공유할 수 있다</li>
	<li>서버 개발자가 값을 set 혹은 get 할 수 있다 (= 값을 얻거나, 저장할 수 있다)</li>
	<li>Object 타입을 원하는 형태로 바꾸려면, 형변환(down-casting)을 해야한다</li>
</ul>


<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<td>request.setAttribute(String name, Object o)</td>
		<td>name 이름으로 객체를 request 에 저장</td>
	</tr>
	<tr>
		<td>request.getAttribute(String name)</td>
		<td>name 이름으로 request에 저장된 객체를 (복사하여) 꺼낸다</td>
	</tr>
	<tr>
		<td>request.removeAttribute(String name)</td>
		<td>name 이름으로 request에 저장된 객체를 제거</td>
	</tr>
</table>


<%
	String test1 = "Hello";
	FoodDTO test2 = new FoodDTO();
	Integer[] test3 = { 2, 7, 8, 4, 6 };
	List<Integer> test4 = Arrays.asList(test3);
	
	test2.setCategory("치킨");
	test2.setMenuName("굽네 순살");
	test2.setMenuPrice(16000);
	test2.setStoreName("굽네치킨 광안점");
	
	test4.sort(null);
	
	request.setAttribute("test1", test1);		//	"test1" (= 이름)
	request.setAttribute("test2", test2);		//	이름은 값을 꺼내거나, 값을 지울 때에 사용된다 
	request.setAttribute("test3", test3);
	request.setAttribute("test4", test4);
	
	String ob1 = (String) request.getAttribute("test1");
	FoodDTO ob2 = (FoodDTO) request.getAttribute("test2");
	Integer[] ob3 = (Integer[]) request.getAttribute("test3");
	List<Integer> ob4 = (List<Integer>) request.getAttribute("test4");	
	
	request.removeAttribute("test3");
	
	out.print("<p>ob1 : " + ob1 + "</p>");
	out.print("<p>ob2 : " + ob2 + "</p>");
	out.print("<p>ob3 : " + ob3 + "</p>");
	out.print("<p>ob4 : " + ob4 + "</p>");
	
	out.print("<br>");
	
	
	out.print("<p>ob1 : " + request.getAttribute("test1") + "</p>");
	out.print("<p>ob2 : " + request.getAttribute("test2") + "</p>");
	out.print("<p>ob3 : " + request.getAttribute("test3") + "</p>");
	out.print("<p>ob4 : " + request.getAttribute("test4") + "</p>");
	
	
%>

<h3>Attribute 와 4개의 내장객체를 이용하면 선언부의 코드가 점점 줄어들것이다 </h3>
<table border="1" cellpadding="10" cellspacing="0">
	
	<tr>
		<th>내장객체</th>
		<th>유효범위</th>
	</tr>
	<tr>
		<td>pageContext</td>
		<td>현재 페이지에서만 사용할 attribute를 저장</td>
	</tr>
	<tr>
		<td>request</td>
		<td>
			현재 요청에 대해서만 사용할 Attribute 를 저장 <br>
			forward 를 이용하면, forward 대상 페이지에서도 attribute 를 참조할 수 있다
		</td>
	</tr>
	<tr>
		<td>session</td>
		<td>현재 사용자가 요청하는 모든 페이지에 대해 공유할 수 있는 attribute 저장소</td>
	</tr>
	<tr>
		<td>application</td>
		<td>모든 사용자가 요청하는 모든 페이지에 대해 공유할 수 있는 attribute 저장소</td>
	</tr>
</table>

</body>
</html>