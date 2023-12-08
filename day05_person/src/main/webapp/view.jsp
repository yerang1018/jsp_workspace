<%@page import="person.PersonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 사용자에게 보여줄게 없는 페이지는 HTML 태그들 다 없애자 -->

<%
	ArrayList<PersonDTO> personList = (ArrayList<PersonDTO>)application.getAttribute("personList");

	PersonDTO data = null;
	String name = request.getParameter("name");		//	파라미터 받아옴
	
	for(PersonDTO dto : personList) {				//  제어문이 들어가 있으면 el 태그 사용 불가능
		if(dto.getName().equals(name)) {
			data = dto;
			break;
		}
	}
	
	request.setAttribute("dto", data);
	request.getRequestDispatcher("view-show.jsp").forward(request, response);	// forward 의 대상은 view-show.jsp
%>
