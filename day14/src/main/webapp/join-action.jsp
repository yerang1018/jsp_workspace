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


<!--  check 제약조건 위배라고 뜬다면		
	  인코딩 UTF-8 해주기   
	
	  action 에 해주지 말고 그냥 바로 헤더에 쓰자! 어차피 반복됨 	
	  
<%--
	request.setCharacterEncoding("UTF-8");
--%>
	
	
	    
-->



<jsp:useBean id="dto" class="day14.MemberDTO" />
<jsp:setProperty property="*" name="dto" />

<c:set var="row" value="${dao.insert(dto) }" />

${row }


<c:if test="${row != 0 }">
	<c:redirect url="/list.jsp" />
</c:if>


<script>
	alert('가입이 처리되지 않았습니다')
	history.go(-1)
</script>




</body>
</html>