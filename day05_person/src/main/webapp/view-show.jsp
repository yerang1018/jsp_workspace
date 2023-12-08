<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view-show</title>
</head>
<body>


<!--  
	el 태그   = %{ } 
	
	attribute 를 꺼내쓰고 싶으면, el 태그를 사용하는 것이 좋다 !!
	: 삼항연산자도 가능하면서, 바로 출력할 수 있음
-->

<!--  
	이미 추가되어있는 데이터를 클릭했을 때, 각각의 이름과 나이, 성인여부가 뜨게 만드는 페이지이다.
	
	1번 데이터를 클릭하고 나서 
	2번 데이터를 클릭하면 1번 데이터의 내용은 사라지고, 2번 데이터의 내용만 남는다.
	
	그 이유는 request 가 소멸하기 때문이다
	
	다른 페이지로 이동할때마다, request  가 소멸한다. 
		: request 내부에 있는 dto 역시 소멸 

 -->


<h1>${dto.name } 의 정보 조회</h1>
<hr>

<h3>${dto.name }님은 ${dto.age }세 이고, ${dto.age >= 20? '성인' : '미성년자' } 입니다</h3>

<p>
	<a href="list.jsp"><button>목록</button></a>
	<a href="delete.jsp?name=${dto.name }"><button>삭제</button></a>
</p>

</body>
</html>