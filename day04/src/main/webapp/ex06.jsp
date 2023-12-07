<%@page import="ex06.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>ex06  대문 페이지</h1>

<h3> ex06 , ex06-action , ex06-form 은 다 같은 세션을 사용하고 있음 </h3>
<h3> 페이지를 이동하면서 그냥 같은 세션을 돌려 보내준다 </h3>
<hr>

<%
	MemberDTO login = (MemberDTO) session.getAttribute("login");	
	String welcome = String.format("안녕 ~ %s !!", login == null ? "친구" : login.getName());
%>

<div>
	<img src="<%=login == null ? "image/default.png" : login.getImgPath() %>" height="150">
	<h3><%=welcome %></h3>
</div>
<a href="ex06-form.jsp"><button>로그인</button></a>

</body>
</html>