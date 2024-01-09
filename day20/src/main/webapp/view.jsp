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

<div class="box2">
<div class="flex">
	<div class="font">${dto.idx }</div>
	<div class="font">${dto.title }</div>
	<div class="font">${dto.writer }</div>
	<div class="font">${dto.writeDate }</div>
	<div class="font">${dto.ipaddr }</div>
</div>
<div class="flex">
	<div class="font"><img src="${cpath }/reviewImage/${dto.image }"></div>
	<div class="font"><pre>${dto.content }</pre></div>
</div>					
</div>
<div class="sb">
	<div>
		<a href="${cpath }"><button>목록</button></a>
	</div>
		<c:if test="${dto.writer == login.userid }">
			<a href="${cpath }/modify.jsp?idx=${dto.idx }"><button>수정</button></a>
			<a class="deleteBtn" 
				idx="${dto.idx }"
				href="${cpath }/delete.jsp?idx=${dto.idx }"><button>삭제</button></a>
		</c:if>
</div>

<script>
	const deleteBtnList = document.querySelectorAll('a.deleteBtn')
	const deleteHandler = function(event) {
		event.preventDefault()
		let target = event.target
		while(target.classList.contains('deleteBtn') == false) {
			target = target.parentNode
		}
		console.log(target)
		const idx = target.getAttribute('idx')
		const url = target.href
		const flag = confirm(idx + '번 게시글을 삭제하시겠습니까?')	//	사용자에게   확인 / 취소 여부 묻기
		if(flag) {		//	만약 확인을 클릭했다면 (flag == true)
			location.href = url		//	브라우저의 주소창을 <a href="">의 값으로 변경한다 (= 페이지 이동)
		}
	}
	deleteBtnList.forEach(element => element.onclick = deleteHandler)
</script>

<%--		getAttribute('idx') : request.getAttribute 랑 동일하다			--%>


</body>
</html>