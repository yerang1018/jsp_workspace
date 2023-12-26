<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.net.URLEncoder, java.net.URLDecoder" %>


<%

	String memo = request.getParameter("memo");

	//	new Cookie(쿠키이름, 쿠키 값)
	//	어떤 문자열이든 쿠키로 저장할 수 있다 
	//	단, 띄어쓰기를 하면 에러가 난다
	//	특수문자와 띄어쓰기를 사용하고 싶다면 import URLEncoding 을 수행하기 
	Cookie cookie = new Cookie("memo" , memo);
	
	//	쿠키의 유효시간을 설정한다.	60초, 60분, 24시간, 7일
	//	만료된 시간이 모두 지나면 쿠키는 소멸한다
	cookie.setMaxAge(60 * 60 * 24 * 7);
	
	//	서버에서 생성한 쿠키 객체를 클라이언트에게 보내기 위해서 응답에 추가
	response.addCookie(cookie);
	
	//	쿠키는 클라이언트에 저장되므로, 포워드 및 리다이렉트에 의한 차이가 없다
	//	오히려, "재방문" 시에 쿠키가 적용되기 때문에 리다이렉트를 지정해야한다
	response.sendRedirect("ex01.jsp");
%>


</body>
</html>