<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>

<c:set var="dto" value="${dao.selectOne(param.idx) }" />

	<h3>수정</h3>
	<form action="modify-action.jsp">
	<p><input type="text" name="name" placeholder="상품명" value="${dto.name }" required="required"></p>
	<p><input type="number" name="price" placeholder="가격" value="${dto.price }" required="required"></p>
	<p><input type="hidden" name="idx" value="${dto.idx}"></p>
	<p><input type="submit"></p>
	</form>

</body>
</html>