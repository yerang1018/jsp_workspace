<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* , ex06.TestDTO"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>EL Tag</h1>
<hr>

<h3>expression language</h3>
<h3>기존 표현식에서 attribute 및 parameter 값을 "출력할 때" 코드가 긴 점을 개선함</h3>

<fieldset>
	<legend>attribute</legend>
	<p>내장객체에 저장된 attribute 의 이름을 지정하면 값을 출력한다</p>
	<p>Object 타입의 객체가 저장되므로, 출력시에는 객체의 toString() 결과를 출력한다</p>
	<p>배열 및 List 에는 [] 형태로 index 를 지정할 수 있다 </p>
	<p>자바 빈즈 객체는  . 연산자를 이용하여 필드 이름을 지정하면 getter 를 호출하여 출력</p>
	<p>Map 형태의 객체는 [''] 안에 key 이름을 넣어서 value 를 출력</p>
	
	<%
		String t1 = "Hello, world";
		Integer[] arr = { 4, 8, 2, 7, 6 };
		List<Integer> list = Arrays.asList(arr);
		HashMap<String, String> map = new HashMap<>();
		map.put("apple", "사과");
		map.put("banana", "바나나");
		
		TestDTO ob1 = new TestDTO();
		ob1.setName("이지은");
		ob1.setAge(31);
		
		TestDTO ob2 = new TestDTO();
		ob1.setName("홍진호");
		ob1.setAge(42);
		
		ArrayList<TestDTO> arrayList = new ArrayList<>();
		arrayList.add(ob1);
		arrayList.add(ob2);
		
		pageContext.setAttribute("t1", t1);
		pageContext.setAttribute("arr", arr);
	%>
	
	<fieldset>
		<legend>String</legend>
		<p>표현식	: <%=t1 %></p>
		<p>EL tag : ${t1 }</p>
	</fieldset>
	
	<fieldset>
		<legend>Array</legend>
		<p>표현식	: <%=arr[0] %>, <%=arr[1] %>, <%=arr[2] %>, <%=arr[3] %>, <%=arr[4] %></p>
		<p>EL tag : ${arr[0] }, ${arr[1] }, ${arr[2] }, ${arr[3] }, ${arr[4] }</p>
	</fieldset>
	<br>
	
	
	<% pageContext.setAttribute("list", list); %>
	<fieldset>
		<!--  
				list 도 list[인덱스] 형태로 접근 가능하다
				대신 어트리뷰트로 생성했을 경우에만  !!
		 -->
		<legend>List</legend>
		<p>표현식 : <%=list.get(0) %>, <%=list.get(1) %>, <%=list.get(2) %></p>
		<p>EL tag : ${list[0] }, ${list[1] }, ${list[2] }</p>
	</fieldset>
	<br>
	
	<% pageContext.setAttribute("map", map); %>
	<fieldset>
		<legend>Map</legend>
		<p>표현식 : <%=map.get("apple") %>, <%=map.get("banana") %></p>
		<p>EL tag : ${map.apple }, ${map['banana']}</p>
	</fieldset>
	<br>
	
	
	<% pageContext.setAttribute("ob1", ob1); %>
	<fieldset>
		<legend>DTO</legend>
		<p>표현식 : <%=ob1.getName() %>, <%=ob1.getAge() %> <br>
					<%=((TestDTO)pageContext.getAttribute("ob1")).getName() %>,
					<%=((TestDTO)pageContext.getAttribute("ob1")).getAge() %>
		</p>
		<p>EL tag : ${ob1.name} , ${ob1.age }</p>
	</fieldset>
	
	
	<% pageContext.setAttribute("arrayList", arrayList); %>
	<fieldset>
		<legend>List&lt;DTO</legend>
		<p>표현식 : <%=arrayList.get(1).getName() %>
					<%=((ArrayList<TestDTO>)pageContext.getAttribute("arrayList")).get(1).getAge() %>
					
		</p>
		<p>EL tag : ${arrayList[1].name } , ${arrayList[1].age }</p>
	</fieldset>
	
	<fieldset>
		<legend>Parameter</legend>
		<form>
			<input name="name">
		</form>
		<p>표현식 :  <%=request.getParameter("name") %></p>
		<p>EL Tag : ${param.name }</p>
	</fieldset>


	
</fieldset>







</body>
</html>