<%@page import="ex06.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>ex07-action 에서 선택한 값 출력</h1>
<hr>

<img src="<%=((MemberDTO)request.getAttribute("dto")).getImgPath() %>" height="150">

<img src="${requestScope.dto.imgPath }" height="150">

<img src="${dto.imgPath }" height="150">

<!-- 	리퀘스트는 그대로 넘어가기 때문에 담고 넣고 다 가능 
		(getter 쓸려면 DTO 로 다운캐스팅 필요) 

		어트리뷰트를 꺼내올때 그 값을 html 에 출력하고 싶다면 el 태그를 쓸 수 있음 (${} 쓰는거 == el 태그)
		el태그는 내장객체에서 값을 출력할때 사용 (el태그 : 어트리뷰트를 바로 꺼내올 수 있기 때문에 get,set 안써도됨 == 다운캐스팅도 필요없음)
		
		el태그는 null 이면 출력 안한다는 장점도 있음 	
			
 -->

</body>
</html>