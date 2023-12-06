<%@ page import="ex03.UpdownGame" %>		<!-- 자바 클래스와 연결해준다 -->
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Handler 과 같은 역할 (Controller) -->
<!-- 기능들을 제어 -->

<%!
	UpdownGame game = new UpdownGame();
%>

<%	//	스크립틀릿  ( == service() )
	//	웹 프로그램으로써 수행해야할 전체적인 로직만 나타내고 있음
	//	상세한 기능의 내용은 game 객체 내부에 메서드로 존재 
	//	JSP 의 역할 : request 와 response 를 사용하는 것 !!
	//				즉, 이걸 사용안할 것이면 일반 자바 클래스에 작성하기 
	
	
	
	if(request.getParameter("reset") != null) {
		game.reset();
		response.sendRedirect("ex03-form.jsp?msg=");
		return;		
	}
	
	String user = request.getParameter("user");
	String msg = game.handle(user);
	
	String location = "ex03-form.jsp?msg=" + URLEncoder.encode(msg , "UTF-8");	
												
	response.sendRedirect(location);	
%>
