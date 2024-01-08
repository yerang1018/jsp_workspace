<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="dto" value="${boardDAO.selectOne(param.idx) }" />

<div class="flex ">
	<div class="font">${dto.idx }</div>
	<div class="font">${dto.title }</div>
	<div class="font">${dto.writer }</div>
	<div class="font">${dto.writeDate }</div>
</div>
<div class="flex">
	<div><img src="${cpath }/reviewImage/${dto.image }"></div>
	<div class="font"><pre>${dto.content }</pre></div>
	<div class="font">${dto.ipaddr }</div>
</div>					




</body>
</html>