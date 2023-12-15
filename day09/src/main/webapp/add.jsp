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

<div class="frame formStyle">
<h3>추가</h3>
	
	<form action="add-action.jsp">
	<p><input type="text" name="name" placeholder="상품명" required="required"></p>
	<p><input type="number" name="price" placeholder="가격" required="required"></p>
	<p><input type="submit"></p>
	</form>
</div>

</body>
</html>