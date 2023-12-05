<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	table {
		border-collapse: collapse;
		border: 2px solid black;
	}
	td, th {
		padding: 10px;
		border: 1px solid grey;
	}
	thead {
		backgroud-color: #dadada;
	}
</style>


<body>


<h1>request 와 response 의 내장객체</h1>
<hr>

<h3>스트립틀릿 내부에서는 객체를 별도로 생성하지 않아도 request, reponse에 접근할 수 있다</h3>
<h3>request 와 response 는 JSP의 내장객체에 해당한다 (별도 생성이 필요없음)</h3>

<table>
	<thead>
		<tr>
			<th colspan="3">request 주요메서드</th>
		</tr>
		<tr>
			<td>형식</td>
			<td>기능</td>
			<td>예시</td>
		</tr>
	</thead>	
	<tbody>
		<tr>
			<td>request.getMethod()</td>
			<td>클라이언트가 보낸 요청의 메서드를 문자열로 반환</td>
			<td><%=request.getMethod() %></td>
		</tr>
		<tr>
			<td>request.getLocalAddr()</td>
			<td>클라이언트가 보낸 요청의 대상 주소(서버 주소)를 문자열로 반환</td>
			<td><%=request.getLocalAddr() %></td>
		</tr>
		<tr>
			<td>request.getRemoteAddr()</td>
			<td>요청을 보낸 클라이언트의 주소를 문자열로 반환</td>
			<td><%=request.getRemoteAddr() %></td>
		</tr>
		<tr>
			<td>request.setAttribute(String name, Object o)</td>
			<td>request 내장 객체에 자바 객체를 저장한다</td>
			<td><%	request.setAttribute("today", new java.util.Date()); %></td>
		</tr>
		<tr>
			<td>request.getAttribute(String name)</td>
			<td>request에 저장된 내장 객체를 이름으로 불러와서 Object로 반환한다</td>
			<td><%= request.getAttribute("today") %></td>
		</tr>
		<tr>
			<td>request.getCookies</td>
			<td>요청에 담긴 쿠키를 배열 형태로 반환한다. null을 반환할 수도 있다</td>
			<td><%= request.getCookies() %></td>
		</tr>
		
		<tr>
			<td>request.getContentType()</td>
			<td>request에 담긴 contentType 을 문자열로 반환</td>
			<td><%=request.getContentType() %></td>
		</tr>
		<tr>
			<td>request.getReuestURL()</td>
			<td>클라이언트가 요청한 주소를 반환</td>
			<td><%=request.getRequestURL() %></td>
		</tr>
		<tr>
			<td>request.getProtocol()</td>
			<td>요청 프로토콜을 반환한다. http 혹은 https</td>
			<td><%=request.getProtocol() %></td>
		</tr>
		<tr>
			<td>request.getServerName()</td>
			<td>요청 서버주소를 반환한다. 글자주소를 우선적으로 제공하고, 없으면 IP 반환</td>
			<td><%=request.getServerName() %></td>
		</tr>
		<tr>
			<td>request.getServerPort()</td>
			<td>요청 서버의 포트번호를 반환한다. 범위는 0 ~65535</td>
			<td><%=request.getServerPort() %></td>
		</tr>
		<tr>
			<td>request.getContextPath()</td>
			<td>요청받은 자원의 최상위 폴더경로를 문자열로 반환한다<br>
				이 경로는 JSP 프로젝트의 webapp(WebContent) 폴더에 해당하는 경로이다
			</td>
			<td><%=request.getContextPath() %></td>
		</tr>
		<tr>
			<td>request.getRequestURI()</td>
			<td>요청받은 자원 고유 식별자를 문자열로 반환한다. 서버안의 주소만 나온다. 전체주소가 아님</td>
			<td><%=request.getRequestURI() %></td>
		</tr>
		<tr>
			<td>request.getParameter(String name)</td>
			<td>요청에 담긴 클라이언트의 파라미터를 문자열로 반환한다.<br>
				클라이언트의 입력값이므로, 서버에서 set하는 메서드는 없다
			</td>
			<td><%=request.getParameter("guest") %></td>
		</tr>
		<tr>
			<td>request.getQueryString()</td>
			<td>주소에서 URL을 제외한 쿼리스트링을 문자열로 반환한다.</td>
			<td><%=request.getQueryString() %></td>
	</tbody>
</table>

<form>
	<p><input name="guest" placeholder="손님 이름 입력" required></p>
	<p><input type="submit" value="제출"></p>
</form>


</body>
</html>