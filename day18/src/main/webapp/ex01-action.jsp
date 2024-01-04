<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>ex01-action.jsp</h1>
<hr>


<%
	//	사용자가 파일을 첨부하여 제출하는 상황이라면
	//	첨부파일의 크기를 미리 예측할 수 없음
	//	큰 용량의 파일을 단일 객체로 전송할 수 없기 때문에, 
	//	여러 파트로 분할하여 전송한 후 재조립한다
	//	form-data 를 여러 파트로 분할하여 전송하는 방식 = multipart/form-data 
	
	//	양식 데이터 전송 시 분할하여 제출하고, 재조립하는 방식을 사용하기 때문에
	//	일반적인 request 형식으로는 파라미터 및 파일을 확인할 수 없음
	//	따라서 특정 라이브러리를 추가로 사용해야함
	//	특정 라이브러리 : com.orilly.servlet.MultipartRequest 
	
	request.setCharacterEncoding("UTF-8");

	String method = request.getMethod();
	String test1  = request.getParameter("test1");
%>

<h3>method : <%=method %></h3>
<h3>test1 : <%=test1 %></h3>


<%	
	//	new MultipartRequest(request, 저장폴더, 최대전송크기, 글자인코딩, 중복처리정책)
	//	기존의 내장객체 request 와 몇가지 옵션을 추가로 전달받아서 
	//	파일을 전송받을 수 있는 새로운 형태의 request 를 생성하는 라이브러리 클래스 
	
	//	즉, 지금까지 써왔던 request 는 사용할 수 없다 !!
	MultipartRequest mpRequest = null;

	String saveDirectory = application.getRealPath("/upload");
	int maxPostSize = 1024 * 1024 * 20;		//	20MB
	String encoding = "UTF-8";
	FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	File dir = new File(saveDirectory);
	if(dir.exists() == false) {
		dir.mkdirs();
	}
	
	//	생성자에 값이 5개 들어간다 
	mpRequest = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
	
	//	ex01-form 에 적었던 이름 사용 
	test1 = mpRequest.getParameter("test1");
	File f = mpRequest.getFile("profileImg");
	
%>

<hr>
<h3>test1 : <%=test1 %></h3>
<h3>저장위치 : <%=saveDirectory %></h3>
<h3>파일이름 : <%=f.getName() %></h3>
<h3>파일크기 : <%=f.length() %></h3>

<div>
	<img src="upload/<%=f.getName()%>" height="250">
</div>
<a href="ex01-form.jsp"><button>다시 입력</button></a>


</body>
</html>