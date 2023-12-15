<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>


<c:set var="list" value="${dao.selectList() }" />

<div>
	<a href="${cpath }/add.jsp"><button>추가</button></a>
</div>



<div class="frame tableStyle">
<table border="1" cellpadding="20" cellspacing="0">
	<tr bgcolor="#eee">
		<th>번호</th>
		<th>제품명</th>
		<th>가격</th>
	</tr>
	<c:forEach var="dto" items="${list }">
		<tr>
	
			
		<td><a href="${cpath }/view.jsp?idx=${dto.idx}">${dto.idx}</a></td>	
		<td>${dto.name }</td>
		<td>${dto.price }</td>
		
		</tr>
		
	</c:forEach>
</table>
</div>

</body>
</html>