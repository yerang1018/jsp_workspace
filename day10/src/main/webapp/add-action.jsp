<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--  모든 파라미터를 dto 에 넣어준다.  -->
<jsp:useBean id="dto" class="bugs.BugsDTO" />
<jsp:setProperty property="*" name="dto" />


<!--  모든 파라미터를 dao 에 넣어준다.  -->
<jsp:useBean id="dao" class="bugs.BugsDAO" />


<c:set var="row" value="${dao.insert(dto) }" /> <!-- 이 한줄만 있어도 추가 가능 -->

<c:if test="${row != 0 }">
	<c:redirect url="list.jsp" />
</c:if>

<script>
	alert('추가 실패')
	history.back()
</script>







</body>
</html>