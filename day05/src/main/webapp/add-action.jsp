<%@page import="book.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- 
	jsp:useBean 태그는 자바 객체를 생성함과 동시에 내장객체에 attribute 로 등록한다
	따라서, useBean 으로 생성한 객체는 
	EL Tag 로 참조 가능하다
	
	
	list.jsp 에서 dao 객체를 application 에 attribute 로 등록했다
	따라서, dao 객체도 EL Tag 로 참조가능하다 
	
	
	attribute 로 등록하는 이유는 EL 태그를 쓰기 위해서임
	EL태그 : 함수 호출 , 화면에 출력 등의 역할을 다 수행해줄 수 있다 
	
 --%>


<jsp:useBean id="dto" class="book.BookDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>     <!--  모든 내용을 dto 에게 넣어주어라  -->

${dao.insert(dto) }		<!--  EL 태그  -->

<%
	int lastIdx = BookDTO.getSeq();

	response.sendRedirect("view.jsp?idx=" + lastIdx);		//	추가가 끝나면 리다이렉트를 이용하여 강제로 list.jsp 로 페이지 이동 
%>
