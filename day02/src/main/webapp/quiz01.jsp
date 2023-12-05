<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>quiz01.jsp - 두 수의 덧셈 결과</h1>
<hr>


<%	//	변수를 선언했을때 출력한다면, 항상 값이 할당되어 있어야 한다 (초기화의 중요성)
	String n1 = request.getParameter("n1");
	String n2 = request.getParameter("n2");
	String msg = "";	//	초기화
	int sum = 0;
	if(n1 != null && n2 != null) {
		sum = Integer.parseInt(n1) + Integer.parseInt(n2); 
	
		msg = String.format("합계 : %d", sum);
	}
%>

<h3>HTML과 Java 코드중에서   항상 Java가 먼저 실행된다</h3>
<h3>Java 코드는 웹서버에서 실행되고, HTML 코드는 클라이언트의 브라우저에서 실행되기 때문이다</h3>
<h3>자바에서 연산이 끝나면 HTML 을 통해서 스타일 지정되고 출력된다 생각하기 </h3>
<form>
	<input type="number" name="n1" placeholder="n1" min="0" max="99" required="required">
	+
	<input type="number" name="n2" placeholder="n2" min="0" max="99" required="required">
	<input type="submit" value="=">
	
	<%=sum %>
	
</form>


</body>
</html>