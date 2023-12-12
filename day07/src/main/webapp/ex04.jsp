<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>singleton 과 EL Tag</h1>
<hr>

<h3>어떤 경우에도 단 하나의 객체만 가지게 하는 클래스 디자인 패턴을 싱글톤이라고 한다</h3>
<h3>항상 동일한 객체를 바라보도록 할 수 있음</h3>

<!-- 
	싱글톤 : 함수중심의 객체라면 싱글톤 많이쓴다.
	== DAO 같은 애들 (DTO 는 데이터 중심의 객체니까 싱글톤이 되면 안된다)
	
	함수중심 = 기능 중심
	데이터 중심 = 값 중심
-->

<jsp:useBean id="ob1" class="ex04.Test01" />
<p>${ob1 }  (새로고침할때마다 객체 해시코드가 변함)</p>


<h3>c:set 은 메서드의 호출결과 혹은 내가 지정한 리터럴 상수값이 객체가 됨</h3>
<c:set var="ob2" value="${Test02.getInstance() }" />
<p>${ob2 }  (새로고침을 해도 객체 해시코드가 변하지 않음)</p>


</body>
</html>