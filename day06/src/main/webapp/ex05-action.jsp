<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05-action</title>
</head>
<body>


<h1>ex05-action</h1>
<hr>

<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String adult = age >= 20? "성인" : "미성년자";
	
	String msg = String.format("%s님은 %d세 이고, %s 입니다" , name, age, adult);
	
	request.setAttribute("msg", msg);
//	request.getRequestDispatcher("ex05-result.jsp").forward(request, response);
%>

<jsp:forward page="ex05-result.jsp" />


</body>
</html>