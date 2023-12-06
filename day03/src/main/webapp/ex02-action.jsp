<%@page import="java.net.URLEncoder"%>
<%@ page import="java.util.Random" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>업다운 게임 처리</h1>
<hr>



<%! //	선언부

	Random ran = new Random();
	int cpu = ran.nextInt(100) + 1;
	int count = 0;
	
%>


<%	//	스크립틀릿
	
	if(request.getParameter("reset") != null) {
		count = 0;
		cpu = ran.nextInt(100) + 1;
		response.sendRedirect("ex02-form.jsp");
		return;		//	return : 코드를 수행하지 않는다
	}

	
	int user = Integer.parseInt(request.getParameter("user"));		//	입력받은 상태를 가정하고 코드를 진행할 수 있음
	count++;
	String msg = "";
	
	
	if(user == cpu) {
		msg = String.format("정답입니다.   정답 : %d  ,  도전횟수 : %d", cpu , count);
	}
	else if (user < cpu) {
		msg = "UP (" + count + "회 도전중)";
	}
	else {
		msg = "DOWN (" + count + "회 도전중)";
	}

	
	String location = "ex02-form.jsp?msg=" + URLEncoder.encode(msg , "UTF-8");	//	입력으로 이동(= form 페이지로) 을 누르지않아도
												
	response.sendRedirect(location);	//	대상 페이지로 이동하도록 브라우저에게 명령 (= 리다이렉트)
										//	화면에 출력할 내용이 있지만, 자바코드가 HTML보다 먼저 수행되기 때문에
										//	사용자는 HTML 태그를 볼 수 없음
										//	-> 처리를 전담하는 JSP 는 사실상 HTML 구문이 필요없다
%>


<a href="ex02-form.jsp?msg=<%=msg %>">  <!-- 여기 a태그는 없어도됨 -->
	<button>입력으로 이동</button>
</a>





</body>
</html>