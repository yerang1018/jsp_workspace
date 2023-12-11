<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>

<!--  
	header 안에 있는 내용을 불러와서 계속 쓸 수 있음
	
	
	value="${dao.selectList() }
	: 스트립틀릿도 없고, 그냥 바로 dao 로 불러올 수 있다
	  header.jsp 안에 어트리뷰트가 있기 때문이다. 
	  
	header.jsp 의 내용
	1) 링크를 클릭했을때 pageContext 사용
	2) dao 객체를 useBean 으로 생성

 -->


<h3>전체 목록</h3>

<c:set var="list" value="${dao.selectList() }" />

<table border="1" cellpadding="10" cellspacing="0">
	<thead bgcolor="#eee">
		<tr>
			<th>IDX</th>
			<th>NAME</th>
			<th>PNUM</th>
			<th>AGE</th>
			<th>FAVORITE</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.name }</td>
			<td>${dto.pnum }</td>
			<td>${dto.age }</td>
			<td>${dto.favorite }</td>
		</tr>
	</c:forEach>
	</tbody>


</table>

</body>
</html>