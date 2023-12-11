<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="dto" class="phonebook.PhoneBookDTO" />
<jsp:setProperty property="*" name="dto"/>

<c:set var="row" value="${dao.insert(dto) }" />

<c:if test="${row != 0 }">
	<c:redirect url="/list.jsp" />
	<%-- c:redirect 에서 cpath 경로를 명시하지 않는다 --%>
</c:if>

<c:if test="${row == 0 }">
	<script>
		alert('추가 실패')
		history.back()		//	브라우저의 "뒤로가기" 버튼과 동일
							//	입력했던 값이 그대로 남아있음 
	</script>
</c:if>

<!-- dto의 모든 데이터를  -->
</body>
</html>