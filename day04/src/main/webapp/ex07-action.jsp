<%@page import="ex06.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	String name = request.getParameter("name");

	if(name == null) {	//	이름이 전달되지 않았다면 입력 페이지로 리다이렉트해라.
		
		response.sendRedirect("ex07.jsp");
	}
	else {	//	이름이 전달되었다면, 객체를 생성하고 request 에 객체를 담아둔다
		MemberDTO dto = new MemberDTO();
		dto.setName(name);
		request.setAttribute("dto", dto);
		
		//	forward 하면서 request 도 함께 전달되기 때문에
		//	action 에서 넣은 dto 를 show 에서 사용할 수 없다
		// 	단, session 과 달리 action 을 반드시 거쳐서 show 로 가야 정상작동한다
		//		(show 를 바로 실행하면 아무그림도 출력되지 않는다)
		RequestDispatcher rd = null;
		rd = request.getRequestDispatcher("ex07-show.jsp");
		rd.forward(request, response);
	}
	
%>

</body>
</html>