<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${dao.selectOne(param.idx) }" />

<div>
	<a href="${cpath }/delete.jsp?idx=${dto.idx}"><button>삭제</button></a>
</div>

<div>
	<a href="${cpath }/modify.jsp?idx=${dto.idx}"><button>수정</button></a>
</div>

<div class="frame tableStyle">
<table width="500px" border="1" cellpadding="10" cellspacing="0">
	<tr bgcolor="#eee">
		<th>제품명</th>
		<th>제품번호</th>
		<th>가격</th>
	</tr>
	
	<tr>
		<td>${dto.idx }</td>
		<td>${dto.name }</td>
		<td>${dto.price }</td>
	</tr>
	
	
</table>
</div>
</body>
</html>