<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>include</h1>
<hr>


<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<td>&lt;%@ include file="" %></td>
		<td>서로 다른 JSP 파일의 소스를 먼저 합치고 컴파일 수행</td>
		<td>지역변수가 서로 공유된다. 변수의 이름을 중복시키면 안됨</td>
	</tr>
	<tr>
		<td>&lt;jsp:include page="" /></td>
		<td>각 JSP 를 컴파일하고, 결과를 합친다</td>
		<td>지역변수가 공유되지 않음. 변수 충돌을 막기 위해 사용</td>
	</tr>	
	
	<h3>자바 소스 코드 관점에서 내용을 합치려면 지시자를 사용</h3>
	<h3>단순히 결과물의 모양만 합치려면 액션태그를 사용</h3>

</table>

</body>
</html>