<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 세션은 사용자가 있어야 세션이 생긴다.
	세션은 일정시간이 지나면 로그아웃된다

	각각의 사용자를 전담마크하는것이 세션이다. 

	세션은 리퀘, 리폰을 처리하는등의 역할을 하는 것이 아니라,
	사용자에 대한 내용이다.  ( 세션은 각각의 사용자 )
	
	애플리케이션은 사용자 1가 데이터를 삭제한다면
				사용자 2는 데이터를 볼 수 없다 ( 사용자들이 같은 공간을 사용하는 느낌 )
-->


<jsp:useBean id="login" class="ex06.MemberDTO" scope="session" />
<jsp:setProperty property="name" name="login"/>

<%
	//	세션에 객체를 저장하는것 만으로 이 페이지의 역할은 끝.
	//	다음화면으로 연결 시켜주기 위해서 리다이렉트를 사용
	//	페이지가 바뀌면서 요청도 새로 들어가지만,
	//	세션은 같은 세션이기 때문에 attribute 를 사용할 수 있다
	response.sendRedirect("ex06.jsp");

	//	리다이렉트는 주로 세션과 많이 연계한다
%>

</body>
</html>