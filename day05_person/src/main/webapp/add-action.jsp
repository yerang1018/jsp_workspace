<%@page import="java.net.URLEncoder"%>
<%@page import="person.PersonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- add.action.jsp --%>


<jsp:useBean id="paramDTO" class="person.PersonDTO" />
<jsp:setProperty property="*" name="paramDTO" />

${personList.add(paramDTO) }	<%-- param 은 el태그에서 
									파라미터를 꺼내오는 예약어이기 때문에 
									param 이라는 이름은 쓰지 않아야함 
									
									el태그의 주목적 : 어트리뷰트에 등록되어 있는 것을 불러오는 작업
									
									el태그에서 불가능한 것 : 어떤 객체를 어트리뷰트에 넣는 것
									
									--%>
									
									
						 		

<%
//	ArrayList<PersonDTO> personList = (ArrayList<PersonDTO>)application.getAttribute("personList");
//	personList.add(param);
	
//	response.sendRedirect("list.jsp");		: 각 객체를 고유 식별할 값이 없으면 목록으로 이동

	String name = URLEncoder.encode(paramDTO.getName(), "UTF-8");
	response.sendRedirect("view.jsp?name=" + name);	//	이름으로 고유식별이 가능하므로, 단일 조회로 이동 가능
	//	단, 중복되는 이름이 없다는 가정하에 정상적으로 작동
	

%>
