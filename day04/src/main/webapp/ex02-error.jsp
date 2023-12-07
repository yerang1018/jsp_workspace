<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>	<!--  이 페이지는 에러 페이지가 맞습니다. 
    
    												isErrorPage="true" 가 활성화 되어 있어야 
    												exception 내장 객체를 사용할 수 있다 
    											 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>ex02-error.jsp</h1>
<h3> 요청은 액션페이지가 하고 처리는 에러페이지가 해주는 </h3>
<h3> 주소창에 뜨는 페이지와 화면에 뜨는 내용을 담은 페이지가 다른 경우. </h3>
<hr>

<%String msg = exception.getMessage(); %>

<h3><%=msg %></h3>
<h3>32 비트의 정수를 입력해주시기 바랍니다.</h3>




<a href="ex02-form.jsp"><button>다시</button></a>

</body>
</html>