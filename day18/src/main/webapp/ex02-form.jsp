<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex02.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#root {
		width: 900px;
		margin: 20px auto;
		display: flex;
		flex-flow: wrap;
	}
	
	.item {
		width: 200px;
		padding: 10px;
		margin: 10px;
		border: 1px solid grey;
		text-align: center;
		overflow: hidden;
	}



</style>

</head>
<body>

<h1>ex02-form.jsp</h1>
<hr>

<h3>form 작성이 끝나면 DTO 작성</h3>
<!-- accept="image/*"  		:  이미지 파일만 전체로 불러옴 
	 accept="image/jpeg 	:  이미지 파일 중에서도 jpeg 만 
 -->

<form method="POST" action="ex02-action.jsp" enctype="multipart/form-data">
	<p><input type="text" name="title" placeholder="제목"></p>
	<p><input type="file" name="image" accept="image/*"></p>
	<p><input type="date" name="eventDate"></p>
	<p><input type="submit"></p>
</form>


<c:set var="fileUtil" value="${FileUtil.getInstance() }" />		<!-- 객체 만들어주기 == 상단부에 적었던 DAO.getInstance() 와 동일  -->
<c:set var="fileNames" value="${fileUtil.getFileNames() }" />	<!-- 받은 데이터를 저장하기 == setProperty) 와 동일  -->

<div id="root">
	<c:forEach var="name" items="${fileNames }">
	<div id="item">
		<img src="upload/${name }" height="150px">
	</div>
	
	</c:forEach>

</div>


</body>
</html>