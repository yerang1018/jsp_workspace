<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<section>
	<h3>회원목록 list.jsp</h3>
	
	<table>
		<thead>
		<tr>
			<th>ID</th>
			<th>Password</th>
			<th>Name</th>
			<th>Gender</th>
			<th>Email</th>
		</tr>
		</thead>
		<tbody>
		<c:set var="list" value="${dao.selectList() }" />
		<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.userid }</td>
			<td>${dto.userpw }</td>
			<td>${dto.username }</td>
			<td>${dto.gender }</td>
			<td>${dto.email }</td>
			<td>
				<a href=""><button>수정</button></a>
				<a class="deleteLink" href="${cpath }/delete.jsp?userid=${dto.userid}"><button>삭제</button></a>
			</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	
	
</section>


<script>
	function deleteHandler(event) {		//	발생한 행위가 event
		event.preventDefault()			//	event의 기본 작동을 막는다
										//	: a를 클릭했을때 기본작동(페이지 이동)을 막아버린다
										
		const flag = confirm('정말 삭제하시겠습니까')	//	삭제할 것인지 물어보고 대답에 따라 true / false 를 저장
		if(flag) {		
			location.href = event.target.parentNode.href
			//	클릭당한 태그 요소가 event.target	
			//	클릭당한 요소는 button 이며, 
			//	button 의 상위 요소는 a태그이다
			//	a태그의 href 속성으로 이동시킴
		}
	}
	
	
	//	문서 내부의 a태그 중에서 클래스가 deleteLink 인 모든 요소를 불러와서
	const aList = document.querySelectorAll('a.deleteLink')
	
	
	//	aList 내부의 각 요소를 a라고 할때,
	//	a 를 클릭하면 실행되는 함수자리에 deleteHandler 를 할당한다 
	aList.forEach(a => a.onclick = deleteHandler)
	
	
</script>



</body>
</html>