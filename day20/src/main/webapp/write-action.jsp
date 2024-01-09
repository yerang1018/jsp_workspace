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

<c:set var="dto" value="${fileUtil.getDTO(pageContext.request) }" />
<c:set var="row" value="${boardDAO.insert(dto) }" />

<script>
	const row = '${row}'
	if(row != 0) {
		alert('작성 성공')
		location.href = '${cpath}'
	}
	else {
		alert('작성 실패')
		history.go(-1)
	}
</script>


</body>
</html>