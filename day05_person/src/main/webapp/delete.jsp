<%@page import="person.PersonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!--  delete 페이지 : 단일객체를 삭제하고 바로 리다이렉트  -->


<!--  자바가 주된 코드이기 때문에 (= 화면에 보여지지 않음)
	  HTML 코드들은 삭제해도 된다.
	  즉, 이 페이지들은 나중에 자바 클래스로 만들어도 무관하다
 -->


<%	//	만약 같은 이름이 2개 이상이라면 다같이 지워짐
	//	그러나, 어차피 고유한 이름으로 페이지간에 비교를 하여야하기 때문에
	//	동명이인은 입력되지 않도록 제약을 걸어둘 것이다.
	
	ArrayList<PersonDTO> personList = (ArrayList<PersonDTO>)application.getAttribute("personList");
	String name = request.getParameter("name");
	
	personList.removeIf(dto -> dto.getName().equals(name));
	response.sendRedirect("list.jsp");
%>
