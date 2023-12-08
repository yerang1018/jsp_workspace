<%@page import="book.BookDTO"%>
<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>

<h1>도서 목록</h1>
<hr>

<p>
	<a href="add.jsp"><button>도서 추가</button></a>
</p>

<table border="1" cellpadding="10" cellspacing="0">
	<thead>
		<tr bgcolor="#dadada">
			<th>번호</th>
			<th>제목</th>
			<th>저자</th>
			<th>출판사</th>
			<th>출판일자</th>
		</tr>
	</thead>

	<tbody>

<%
//	BookDAO dao = BookDAO.getInstance();	//	객체 불러오기 (O)     객체 생성 (X)   : 싱글톤 사용시 !! 


	BookDAO dao = (BookDAO) application.getAttribute("dao");	//	어플리케이션 사용 
	
	if(dao == null) {
		dao = new BookDAO();
		application.setAttribute("dao", dao);
	}

	for(BookDTO dto : dao.selectList()) {
	%>
	<tr>
		<td><%=dto.getIdx() %></td>
		<td><a href="view.jsp?idx=<%=dto.getIdx()%>"> 	<!-- idx 는 절대 중복되지 않기 때문에 페이지도 숫자를 이용하여 만들기 -->
		<%=dto.getTitle() %></a></td>
		<td><%=dto.getAuthor() %></td>
		<td><%=dto.getPublisher() %></td>
		<td><%=dto.getPublishDate() %></td>
	</tr>
	<%
	}
	%>
	</tbody>

</table>


</body>
</html>