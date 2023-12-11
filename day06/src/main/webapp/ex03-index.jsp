<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="ex03-header.jsp" %>



<h3>대문 페이지</h3>
<p>${arr[4] }</p>


<%
//	String[] arr = {};

	//	Duplicate local variable arr
	//	중복 생성 오류발생하게 된다
	
	//	두개의 파일이 하나로 합쳐진 후 컴파일
	
	//	index.jsp 에서는 생성하지 않았으나
	//	header.jsp 에서 이미 arr 라는 이름을 사용하기 때문에
	//	같은 이름 사용하면 안됨 

%>
