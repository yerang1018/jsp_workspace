<%@page import="person.PersonDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list-show</title>
<style>
	tr:hover {
		background-color: skyblue;
		cursor: pointer;
	}
	table a {
		display: block;
		text-decoration: none;
	}

</style>
</head>
<body>

<h1>person 목록</h1>
<hr>

<p>
	<a href="add-form.jsp"><button>추가</button></a>
</p>

<table border="1" cellpadding="10" cellspacing="0" width="500">
	<thead>
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
	</thead>
	<tbody>
<%
	List<PersonDTO> list = (List<PersonDTO>)request.getAttribute("list");

	for(PersonDTO dto : list) { %>			<!--  제어문이 들어가 있으면 el 태그 사용 불가능  -->
		<tr>
			<td><a href="view.jsp?name=<%=dto.getName()%>"><%=dto.getName() %></a></td>		<!-- 이름을 비교하여, 목록 보여주기 위해서
																							     고유한 필드가 있어야함 (동명이인 불가능) -->
			<td><%=dto.getAge() %></td>
		</tr>
	<% }

%>
	</tbody>
</table>



</body>
</html>