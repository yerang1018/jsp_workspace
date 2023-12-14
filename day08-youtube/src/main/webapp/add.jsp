<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="frame">
	<form action="add-action.jsp">
		<p><input type="text" name="title" placeholder="타이틀" required></p>
		<p>
			<label><input type="radio" name="category" value="음악" required>음악</label>
			<label><input type="radio" name="category" value="반려동물" required>반려동물</label>
		</p>
		<p><input type="text" name="name" placeholder="채널명" required></p>
		<p><input type="text" name="imgname" placeholder="썸네일" required></p>
		<p><input type="text" name="tag" placeholder="영상태그" required></p>
		<p><input type="submit"></p>
	</form>
</section>






</body>
</html>