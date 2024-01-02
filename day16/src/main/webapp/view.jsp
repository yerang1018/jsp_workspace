<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h3>게시글 상세 보기</h3>

<fieldset>
	<c:set var="dto" value="${boardDAO.selectOne(param.idx) }" />
	<h4>${dto.title } | ${dto.writer } | ${dto.writeDate }</h4>
	<pre>${dto.content }</pre>
</fieldset>


<form method="POST" action="reply-write.jsp">
	<h3>댓글 작성</h3>
	<c:if test="${empty login }">
		<c:set var="replyComment">로그인 후에 댓글 작성이 가능합니다</c:set>
	</c:if>
	<c:if test="${not empty login }">
		<c:set var="replyComment">바르고 고운말을 사용합시다</c:set>
	</c:if>
	<div style="display:flex; align-items: center;">
	<textarea name="content" rows="5" cols="80"
				placeholder="${replyComment }" ${empty login ? 'disabled' : '' }
				style="resize: none; height: 100px;
				padding: 10px; box-sizing: border-box;"></textarea>
	<input type="submit" value="댓글쓰기"
			style="margin: 10px; height: 100px;">
	</div>
	
	<input type="hidden" name="board_idx" value="${param.idx }">
	<input type="hidden" name="writer" value="${login.userid }">
	
</form>


<div id="reply">
	<c:forEach var="reply" items="${replyDAO.selectList(param.idx) }">
	<div class="replyItem" style="border: 1px solid grey; margin: 20px; padding: 10px; box-sizing: border-box; justify-content: space-between;">
		<div>${reply.writer }</div>
		<div><fmt:formatDate value="${reply.writeDate }" pattern="yyyy-MM-dd a hh:mm" /></div>
		<div><pre>${reply.content }</pre></div>
		<c:if test="${login.userid == reply.writer }">
			<a href="delete.jsp?idx=${reply.idx }&board_idx=${dto.idx }"><button>삭제</button></a>
		</c:if>
		
	</div>
	</c:forEach>
</div>


<br>
<a href="${cpath }/board.jsp"><button>목록으로</button></a>

</body>
</html>