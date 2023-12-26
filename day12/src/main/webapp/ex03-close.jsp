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
	String makeCookie = request.getParameter("makeCookie");

	if(makeCookie != null) {
		Cookie cookie = new Cookie("donotpopup", "1234");	//	값은 무엇이든 상관없음(에러가 안날만한 값으로 .. 문자열이기만 하면 됨)
		cookie.setMaxAge(180);
		response.addCookie(cookie);
	}
%>


<script>
	window.close()
</script>

</body>
</html>