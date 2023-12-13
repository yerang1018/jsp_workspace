<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>



<!-- 1) 단일 객체를 불러온다 -->
<c:set var="dto" value="${dao.selectOne(param.idx) }" />	<!-- idx 를 이용해 객체 한개를 불러오는 -->


<!-- 2) 항목 추가에 사용했던 form 를 가져온다
		: dto의 값을 이용하여 자동완성 형식으로 채워준다  -->

 
<!-- 3) form의 action은  modify-action.jsp 로 변경  -->



<section class="frame">
	<h3>항목 수정</h3>
	<form action="modify-action.jsp">
		<input type="hidden" name="idx" value="${dto.idx }">  <!--  hidden 형태로 idx 전달하여야 수정가능 : 사용자에게는 안보임 -->
		
		<p>
			<label><input type="radio" name="category"  ${dto.category == '버거' ? 'checked' : '' } value="버거" required>버거</label>
			<label><input type="radio" name="category"  ${dto.category == '음료' ? 'checked' : '' } value="음료" required>음료</label>
		</p>
		<p><input type="text" name="name" placeholder="상품 이름" value="${dto.name }" required></p>
		<p><input type="number" name="price" placeholder="상품 가격" value="${dto.price }"required></p>
		<p><input type="text" name="imgName" placeholder="그림파일 이름" value="${dto.imgName }" required></p>
		<p><textarea name="memo" placeholder="상세 설명" required>value="${dto.memo }"</textarea></p>
		<p><input type="submit"></p>
	</form>
</section>

</body>
</html>