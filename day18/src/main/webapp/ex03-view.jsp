<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex03.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<c:set var="reviewDAO" value="${ReviewDAO.getInstance() }" />
<c:set var="dto" value="${reviewDAO.selectOne(param.idx) }" />

<div>
	<div>순번 	| 	${dto.idx } </div> 
	<div>가게명 	| 	${dto.storeName } 
	<div>날짜 	| 	${dto.visitDate }</div>
	<div><img src="${cpath }/reviewImage/${dto.image }"></div>
	<div><pre>${dto.content }</pre></div>
</div>

<div>
	<a href="${cpath }/ex03-form.jsp"><button>목록 및 추가</button></a>
</div>

</body>
</html>