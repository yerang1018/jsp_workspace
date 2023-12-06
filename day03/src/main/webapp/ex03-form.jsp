<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- Main 과 같은 역할 (View) : 사용자가 볼 화면 -->
<!-- 화면 -->

<h1>업다운 게임 입력</h1>
<hr>

<form action="ex03-action.jsp">
	<input type="number" name="user" required autofocus>
	<input type="submit">
	<a href="ex03-action.jsp?reset=true">
		<input type="button" value="다시">
	</a>
	
</form>


<h3><%=request.getParameter("msg") %></h3>

</body>
</html>