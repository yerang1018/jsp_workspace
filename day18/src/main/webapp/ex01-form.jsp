<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>ex01-form</h1>
<hr>

<h3>파일 첨부하여 form 제출</h3>

<h3>application/x-www-form-urlencoded (method: POST 일때 기본 전송 형식)</h3>
<h3>multipart/form-data (파일을 포함할 경우 변경해주는 전송형식)</h3>


<ul>
	<li>input[type="file"] 요소는 value 를 지정할 수 없다</li>
	<li>파일이 하나라도 포함되어 있으면 multipart/form-data 형식을 지정해야 한다</li>
	<li>multipart/form-data 는 JSP 내장 객체로 request 로 파일을 추출할 수 없다</li>
</ul>


<!-- 1)	input 타입이 file 일때는 value 지정 불가능 !!
	 	보안상 문제 때문에 지정 불가능해짐 
 	
 	 2)	ex01-form 에서 name="test1" 이니까
 	 	ex01-action 에 파라미터 이름을 test1 이라고 지정한 것
 	 
 	 
 	 3)	form 에서 
 	 	enctype="multipart/form-data" 으로 설정해두고 
 	 	값을 입력한 뒤 제출하면
 		파라미터(= test1)가 null 이라고 나옴 
 		즉, request.getParameter 가 제대로 작동하지 않음 
 		
 		enctype="application/x-www-form-urlencoded" 라고 설정해두면
 		파라미터를 잘 받아온다 !! 
 		
 -->
<fieldset>
	<form method="POST" enctype="multipart/form-data" action="ex01-action.jsp">
		<p><input type="text" name="test1" value="calmdownman.jpg"></p>
		<p><input type="file" name="profileImg"></p>
		<p><input type="submit">
	</form>
</fieldset>

</body>
</html>