<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>파라미터를 입력받는 다양한 방법</h1>
<hr>

<fieldset>
	<legend>String request.getParameter(String name)</legend>
	<h4>문자열로 name 을 전달하여 value 를 반환받는다</h4>
	
	<%
		String name = request.getParameter("name");
	%>
	
</fieldset>


<fieldset>
	<legend>String[] 변수명 = request.getParameterValues("String name")</legend>
	<h4>하나의 이름으로 여러 값을 입력받을 때 사용한다 (checkbox 같은 경우)</h4>
	
	
	<form>
		<p>
			<label><input type="checkbox" name="color" value="빨강">빨강</label>
			<label><input type="checkbox" name="color" value="초록">초록</label>
			<label><input type="checkbox" name="color" value="파랑">파랑</label>
		</p>
		<p><input type="submit"></p>
	</form>

	
	<%
		String[] values = request.getParameterValues("color");
		out.print("<p>선택한 값 : ");
		
		//	배열이기 때문에 반복문으로 출력해주자 
		for(int i = 0; values != null && i < values.length; i++) { 
			String value = values[i];
			out.print(value);
			out.print(i != values.length - 1 ? ", " : "</p>");
		}
	%>
</fieldset>

<fieldset>
	<legend>Map&lt;String, String[]> request.getParameterMap()</legend>
	<h4>변수의 개수 및 값의 개수에 상관없이 모든 값을 받아온다</h4>
	<h4>일일이 parameter 를 받아오지 않아도 된다는 장점</h4>
	<%@ page import="java.util.Map" %>
	
	<%
		
		Map<String, String[]> paramMap = request.getParameterMap();
		for(String key : paramMap.keySet()) {
			String[] arr = request.getParameterValues(key);
			out.print("<p>" + key + " : ");
			for(int i = 0; arr != null && i < arr.length; i++) {
				String value = arr[i];
				out.print(value);
				out.print(i != arr.length - 1 ? ", " : "</p>");
			}
		}

	%>
	
</fieldset>

<fieldset>
	<legend>특정 이름의 파라미터만 묶어서 받기</legend>
	<h4>받고 싶은 파라미터를 클래스로 묶어서 만들어두면 "자동으로 받는 태그" 가 있음</h4>
	<form>
		<p><input type="text" name="category" placeholder="category"></p>
		<p><input type="text" name= "storeName" placeholder="식당이름" required></p>
		<p><input type="text" name= "menuName" placeholder="메뉴이름" required></p>
		<p><input type="number" name= "menuPrice" placeholder="주문금액" required></p>
		<p><input type="submit"></p>
	</form>
	
	<jsp:useBean id="ob" class="food.FoodDTO"></jsp:useBean>	<%-- jsp:useBean : 빈 객체 생성 --%>
	<jsp:setProperty property="*" name="ob"/> 	<%-- jsp:setProperty : input name과 필드이름이 동일하면 자동으로 대입 --%>
	
	<ul>
		<li>${ob.category}</li>
		<li>${ob.storeName}</li>
		<li><%=ob.getMenuName() %></li>
		<li><%=ob.getMenuPrice() %></li>
	
	
	</ul>



</fieldset>


</body>
</html>