<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bugs.*" %>
    
<%-- 다른 페이지에서도 JSTL 태그를 사용할 수 있게 한다 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%-- 다른 페이지에서도 문서 최상위 경로(webapp) 에 접근할 수 있도록 한다 --%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />



<%-- 다른 페이지에서도 dao 객체에 바로 접근할 수 있도록 한다 --%>
<c:set var="dao" value="${BugsDAO.getInstance() }" />




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	body {
		background-color: #eee;
		margin: 0;
		padding: 0;
	}
	header, section {
		background-color: white;
		margin: 0 auto;
		width: 1200px;
		padding: 10px;
		box-sizing: border-box;
	}
	header {
		position: fixed;
		top: 0;
		left: 50%;
		transform: translate(-50%, 0);
		height: 100px;
		z-index: 5;
	}
	section {
		position: absolute;
		top : 100%;
		left : 50%;
		transform: translate(-50%, 0);
	}
	h1, h3 {
		margin: 0;
	}
	table {
		border: 2px solid black;
		border-collapse: collapse;
		width: 100%;
		font-size: 13px;
	}
	tr {
		border-bottom: 1px solid grey;
	}
	th, td {
		border: 1px solid grey;
	}
	thead {
		background-color: #dadada;
	}
	tbody > tr:hover {
		background-color: #eee;
		color: black;
		cursor: pointer;
	}
	.sb {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	

</style>


</head>
<body>
