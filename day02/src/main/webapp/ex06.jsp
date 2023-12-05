<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>문자열 입력 및 저장, 목록 출력하기</h1>
<hr>

<form>
	<p><input type="text" name="studentName" placeholder="학생 이름 입력" required autofocus></p>
	<p><input type="submit" value="등록">
</form>


<%@ page import="java.util.ArrayList" %>

<%!
	ArrayList<String> list = new ArrayList<>();
%>

<%
	String studentName = request.getParameter("studentName");

	if(studentName != null) {	//	studentName 에 이름값이 들어가있으면서  
																		//	list 내부에 이름값이 들어가 있지않으면(중복이 아니라면)
		if(list.contains(studentName)) {
			//System.out.println("이미 추가되어 있는 값입니다");
			out.println("<script>alert('이미 추가되어있는 값입니다')</script>");
		}
		else {
			list.add(studentName);
			list.sort(null);				//	String 은 Comparable 하기 때문에 null 을 전달하면 된다 
		}
	}

%>

<ol>
<%
	for(String name : list) {
		out.println("<li>" + name + "</li>");		//	이 부분은 표현식으로 처리 해도 된다 !!
	}
%>
</ol>

</body>
</html>