<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
	div.imgname {
		display: flex;
		align-items: center;
	}
	div.imgname > img {
		width: 30px;
		height: 30px;
		border-radius: 50%;	
		margin-right: 10px;
	}
	div.imgname > h3 {
		color : #777;
	}
	div.chat {
		align-items: center;
		margin-right: 20px;
		
	}
	div.chat > img {
		width: 30px;
		margin-top: 10px;
	}
	div.memo {
		background-color: #eee;
		padding-top: 10px;
		padding-bottom: 10px;
		border-radius: 10px;
	}
	div.memo > h5 {
		font: #bbb;
	}
	div.space {
		padding-top : 20px;
		padding-bottom: 40px;
	}
	div.space_2 {
		padding-top: 10px;
	}
	div.space_2 > a {
		padding-right: 5px;
	}
	
	
	div.chat > input[type="search"] {
		width: 700px;
		padding-top: 5px;
		padding-bottom: 5px;
		border-radius: 5px solid grey;
	}
	div.chat {
		padding-top: 50px;
		padding-bottom: 60px;
		display: flex;
	}
	div.chat > div > img {
		padding-right: 20px;
	}
	div.space {
		float: right;
		padding-right: 40px;
	}

	



</style>

<section class="frame">


	<c:set var="dto" value="${dao.selectOne(param.idx) }" />
		<div class="space">
			<div>
				<a href="${cpath }/list.jsp"><button>목록</button></a>
			</div>
		
			<div class="space_2">
				<a href="${cpath }/delete.jsp?idx=${dto.idx }"><button>삭제</button></a>
			</div>
		</div>
	
	<div class="detail">
		<div class="radius">${dto.tag }</div>
		<div><h1>${dto.title }</h1></div>
		<div class="imgname">
			<img src="${dto.imgname }">
			<h3>${dto.name }</h3>
		</div>
	</div>
	
	<div class="frame memo">
		<h5>여기는 영상 설명</h5>
	</div>
	
	<div class="chat">
		<div><img src="image/내 이름.png"></div>
		<input type="search" placeholder=" 댓글">
	</div>
</section>


</body>
</html>