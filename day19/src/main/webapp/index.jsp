<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>

	<table id="boardList">
		<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>날짜</th>
		</tr>
		</thead>
		
		<c:set var="list" value="${boardDAO.selectList(param.search) }" />

<!--  	<h4>${boardDAO }</h4>
		<h4>${list }</h4> 
		
		: DAO 객체와 함수를 통해 나온 결과물을 확인해보면 
		객체 생성의 문제인지 아니면 다른 문제인지 유추가 가능하다 
-->
		
		<c:forEach var="dto" items="${list }">	<!-- 반복문 : 반복문 태그 내의 내용들을 반복시킴  -->
			<tr>
				<td>${dto.idx }</td>
				<td><a href="${cpath }/view.jsp?idx=${dto.idx }">
					${dto.title }
					${not empty dto.image ? '💾' : '' }
					</a>
				</td>
				<td>${dto.writer }</td>
				<td>${dto.viewCount }</td>
				<td>${dto.writeDate }</td>		
			</tr>
		</c:forEach> <!-- 반복문 끝 -->
	</table>
	
	<div class="sb">
		<div>
			<form>
				<input type="search" name="search" value="${param.search }" placeholder="검색어 입력">
				<input type="submit" value="검색">
			</form>
		</div>
		<div>
			<a href="${cpath }/write.jsp"><button>새글 작성</button></a>
		</div>
	</div>
	
</main>



</body>
</html>