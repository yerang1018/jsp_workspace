<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<h1>추가하기</h1>
<hr>

<form action="add-action.jsp">
	<jsp:useBean id="dto" class="bugs.BugsDTO" />
	<jsp:setProperty property="*" name="dto" />
	
	
	<p><input type="text" name="artist_name" placeholder="아티스트 이름" ></p>
	<p><input type="text" name="album_name" placeholder="앨범 이름" ></p>
	<p><input type="text" name="name" placeholder="곡 이름" ></p>
	<p><input type="text" name="genre" placeholder="장르" ></p>
	<p><input type="number" name="playTime" placeholder="플레이타임" ></p>
	
	<p>
		<select name="isTitle" required>
			<option value="">타이틀/수록곡 선택하기</option>
			<option value="1">타이틀</option>
			<option value="0">수록곡</option>
		</select>	
	</p>
	
	<p><textarea name="lyrics" 
			placeholder="가사"
			rows="10" cols="80" 
			style="resize: none;"></textarea></p>
	
	<p><input type="submit" value="추가하기"></p>
	

</form>


</body>
</html>