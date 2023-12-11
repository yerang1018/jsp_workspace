<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ex03-header.jsp" %>


<!-- include 를 이용하여 비슷한 형식으로 여러 페이지를 쉽게 만들 수 있다  -->

<!--  
		참조하는 페이지가 상단에 있고 
		하단에 새로만든 페이지가 뜬다 
		
		합쳐지는 형식 

-->

<h3>로그인</h3>

<form>
	<p><input name="id" placeholder="ID" value="${list[4] }"></p>
	<p><input type="password" name="pw" placeholder="Password" value="${arr[3] }">
	<p><input type="submit"></p>
</form>
</body>
</html>