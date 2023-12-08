<%@page import="java.util.ArrayList"%>
<%@page import="person.PersonDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta charset="UTF-8">


<title>list</title>


<!-- 리스트를 불러오는 역할만 !!  
	그래서, 그냥 일반 자바 코드로 만들어도 된다

  -->


<%
	//	list 를 attribute 로 넣어두고, 대상을 참조하면서 프로그램 진행 및 데이터 저장
	List<PersonDTO> list = (List<PersonDTO>)application.getAttribute("personList");
	
	if(list == null) {		//	리스트가 없으면 새로 만들고 있으면 불러와라			
		list = new ArrayList<>();
		application.setAttribute("personList", list);	//	리스트를 application 에 넣어라
	}
	
	
	request.setAttribute("list", list);		//	만든 리스트를 request 에 넣어라.
	request.getRequestDispatcher("list-show.jsp").forward(request, response);
	
	
%>
