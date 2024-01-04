<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%
	session.invalidate();			//	세션을 만료 
	response.sendRedirect(request.getContextPath());	//	바로 대문 페이지로 보냄
	
	//	<c:redirect url="/" />
	//	request.getContextPath()  == c:path

%>

</body>
</html>