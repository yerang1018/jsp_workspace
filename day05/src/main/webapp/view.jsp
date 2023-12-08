<%@page import="book.BookDTO"%>
<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--  
<h1>${dao.selectOne(param.idx).title }</h1>

 
	//		param.idx	==	request.getParameter("idx") 
	//		: idx 의 파라미터를 가져온다 


<h2>

스크립틀릿 열고 !!!

	((BookDAO)application.getAttribute("dao")).selectOne(
		Integer.parseInt(request.getParameter("idx"))		
	).getTitle()

	//	application 에 등록된 dao 객체를 불러온다
	//	Object 타입에서 BookDAO 타입으로 다운 캐스팅한다
	//	불러온 dao의 selectOne 을 호출   (= selectOne 함수는 BookDAO 에 있음)
	//	호출하면서 전달해야하는 인자는 파라미터에서 가져온다
	//	파라미터는 문자열 이므로 Integer.parseInt() 를 이용하여 파싱한다
	//	불러온 dto 의 title 을 getter 로 호출하여 화면에 출력 
	
스크립틀릿 닫고 !!!

</h2>
--%>



<%
	BookDAO dao = (BookDAO) application.getAttribute("dao");
	int idx = Integer.parseInt(request.getParameter("idx"));
	BookDTO dto = dao.selectOne(idx);
	
	request.setAttribute("dto", dto);
	request.getRequestDispatcher("view-show.jsp").forward(request, response);

%>

