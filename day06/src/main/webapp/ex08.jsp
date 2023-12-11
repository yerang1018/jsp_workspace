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

<h1>JSTL Core</h1>
<hr>

<fieldset>
	<legend>c:set</legend>
	<h3> var 이름으로 value 객체를 생성하여, scope 에 attribute 로 등록한다 (기본값은 page)</h3>
	<c:set var="t1" value="이지은" scope="page" />
	<c:set var="t2" value="홍진호" scope="request"></c:set>
	<c:set var="t3" value="<%=new Integer(10) %>" scope="session"></c:set>
	<c:set var="t4" value="이상혁" scope="application"></c:set>
	
	
	<p>t1 : ${pageScope.t1 }, ${t1 } </p>
	<p>t2 : ${requestScope.t2 }, ${t2 } </p>
	<p>t3 : ${sessionScope.t3 }, ${t3 } </p>
	<p>t4 : ${applicationScope.t4 }, ${t4 } </p>
	
</fieldset>

<br>

<fieldset>
	<legend>c:if</legend>
	<h3>test의 조건이 true 이면 태그 내부코드 수행(else 가 없음)</h3>
	<p>
		${t2 }의 나이는 ${t3 }세 이고
		<c:if test="${t3 > 20 }">성인</c:if>
		<c:if test="${t3 < 20 }">미성년자</c:if>
		입니다
	</p>
</fieldset>
<br>

<fieldset>
	<legend>c:choose</legend>
	<h3>여러 조건 중 하나를 수행한다. 하위태그로 c:when, c:otherwise 가 있다</h3>
	<c:choose>
		<c:when test="${t3 > 0 }">양수</c:when>
		<c:when test="${t3 < 0 }">음수<</c:when>
		<c:otherwise>Zero</c:otherwise>
	</c:choose>
</fieldset>

<fieldset>
	<legend>c:forEach</legend>
	<h3>items 객체의 각 요소를 var 에 저장하여, items 길이만큼 반복문 수행</h3>
	
	<%
		String[] arr = {"짱구", "철수", "맹구", "유리", "훈이"};
		pageContext.setAttribute("arr", arr);
	
	%>
	
	<ul>
		<c:forEach var="name" items="${arr }">
			<li>${name }</li>
		</c:forEach>
	</ul>
</fieldset>
<br>

<fieldset>
	<legend>c:forTokens</legend>
	<h3>문자열을 구분자로 분리하여 (split) 각 값에 대한 반복문 수행</h3>
	<c:set var="text" value="Drop a red light" />
	<c:forTokens var="word" items="${text }" delims="">
		<p>${word }</p>
	</c:forTokens>
</fieldset>

<fieldset>
	<legend>c:redirect</legend>
	<h3>지정한 페이지로 리다이렉트</h3>
	&lt;c:redirect url="https://www.naver.com" />
</fieldset>

</body>
</html>