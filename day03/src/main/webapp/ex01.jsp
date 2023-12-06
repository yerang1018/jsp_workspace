<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>파라미터 입력을 활용한 업다운 게임 구현</h1>
<hr>


<%@ page import="java.util.Random" %>


<%!	//	선언부	
	//	선언부에서는 request 및 response 에 접근 불가능 !!
	//	String test = request (X)
	private Random ran = new Random();				//	매번 생성하는 것이 아니라,
	private int count = 0;							//	진행하는 동안에는 값이 유지되어야함 (== 선언부)
	private int cpu;
	
%> 


<%	//	스크립틀릿
	//	ex01.jsp 를 매번 새로 실행되기 때문에
	//	반복문을 돌리지 않아도 되는 것이다 !! 
	//	(== 프로그램 자체가 이미 반복해서 실행하는 형태)
	
	//	★ 그렇기 때문에 한번 입력했을 때의 상황만 생각해서 코드 작성 
	
	if(request.getParameter("reset") != null) {		//	reset 버튼에 대한 코드 
		count = 0;
	}
	
	String input = request.getParameter("user");	//	사용자 입력값은 매번 새로 바뀐다!!
	int user;										//	또한 사용자 입력값은 request를 받아와야한다 (== 스크립틀릿)		
	String msg = "";
	
	if(count == 0) {								//	횟수가 0 이면 (=시작할때)
		cpu = ran.nextInt(100) + 1;					//	cpu 값을 랜덤으로 할당한다
	}
	if(input != null) {
		count++;
		user = Integer.parseInt(input);
		if(user == cpu) {
			msg = String.format("정답입니다!!	 정답 : %d , 도전 횟수 : %d회", user, count);
		}
		else if (user < cpu) {
			msg = String.format("UP (%d회 도전중)",count);
		}
		else {
			msg = String.format("DOWN (%d회 도전중)",count);
		}
	}
%>



<form>
	<p><input type="number" name="user" min="1" max="100" required autofocus>
		<input type="submit">
		<a href="ex01.jsp?reset=true"><input type="button" value="reset"></a>
	</p>
</form>

<h3><%=msg %></h3>


</body>
</html>