<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>

	<details open>
		<summary>paging info</summary>
		<br>
		<fieldset>
		<c:set var="boardCount" value="${boardDAO.selectCount(param.search) }" />
		<c:set var="paramPage" value="${empty param.page ? 1 : param.page }" />
		<c:set var="paging" value="${Paging.newInstance(paramPage, boardCount) }" />
		<c:set var="list" value="${boardDAO.selectList(param.search, paging) }" />
		
		<ul>
			<li>게시글 개수 : ${boardCount }</li>
			<li>요청받은 페이지 : ${paramPage }</li>
			<li>paging.offset : ${paging.offset }</li>
			<li>paging.fetch : ${paging.fetch }</li>
			<li>paging.begin : ${paging.begin }</li>
			<li>paging.end : ${paging.end }</li>
		</ul>
		</fieldset>
	</details>



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
	
	
	<!--  페이징 출력   -->
	<div class="center">
		<c:if test="${paging.prev }">
			<a href="${cpath }?page=${paging.begin - 10}&search=${param.search}">[이전]</a>
		</c:if>
	
		<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
			<a class="${paging.page == i ? 'bold' : '' }" 
			href="${cpath }?page=${i}&search=${param.search }">[${i }]</a>
		</c:forEach>
	
		<c:if test="${paging.next }">
			<a href="${cpath }?page=${paging.end + 1}&search=${param.search}">[다음]</a>
		</c:if>
		
		
	</div>
	
	
	
	
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