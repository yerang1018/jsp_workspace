<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

${dao.delete(param.idx) }

<%
	response.sendRedirect("list.jsp"); 	//	삭제가 끝나면, 전체목록으로 이동 	
%>
