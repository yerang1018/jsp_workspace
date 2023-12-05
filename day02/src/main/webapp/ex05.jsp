<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>사용자의 입력값을 리스트에 추가하고 화면에 출력</h1>

<hr>


<!-- form 에 action 이 없으면, [현재주소]로 새로운 요청을 보낸다 -->
<form>
	<p>
		<select name="category" required>
			<option value="">=== 카테고리 ===</option>
			<option value="족발/보쌈">족발/보쌈</option>
			<option value="찜/탕/찌개">찜/탕/찌개</option>
			<option value="돈까스/회/일식">돈까스/회/일식</option>
			<option value="피자">피자</option>
			<option value="고기/구이">고기/구이</option>
			<option value="야식">야식</option>
			<option value="양식">양식</option>
			<option value="치킨">치킨</option>
			<option value="중식">중식</option>		
		</select>
	</p>
	
	<p><input type="text" name = "storeName" placeholder="식당이름" required></p>
	<p><input type="text" name = "menuName" placeholder="메뉴이름" required></p>
	<p><input type="number" name = "menuPrice" placeholder="주문금액" min="0" step="100" required></p>
	<p><input type="submit"></p>
</form>



<%@ page import="java.util.ArrayList , food.FoodDTO" %>


<%!	//	선언부 : 멤버필드 및 멤버 메서드를 정의

	private ArrayList<FoodDTO> list = new ArrayList<>();

%>



<%	//	스크립틀릿의 내부코드 	==  	service() 함수 내부의 내용
	//	지역 변수는 함수가 호출될 때마다 새로 만들어진다 -> 값이 유지되지 않는다 
	//	리스트를 멤버 필드로 생성해두면, 객체가 소멸하기 전까지(= 서버가 재시작하기 전까지) 값이 유지된다 (= 선언부를 이용하자!)
	
	

	//	4개의 파라미터를 전달받는다
	String category = request.getParameter("category");			//	<select name="category">
	String storeName = request.getParameter("storeName");		//	<input name="storeName">
	String menuName = request.getParameter("menuName");			//	<input name="menuName">
	String menuPrice = request.getParameter("menuPrice");		//	★ 파라미터를 받을때에는 웬만하면 String 으로 받고, set(Integer.parseInt)
	
	
	//	전달받은 파라미터를 변수에 저장한다
	if(category != null) {
		FoodDTO dto = new FoodDTO();
		dto.setCategory(category);
		dto.setStoreName(storeName);
		dto.setMenuName(menuName);
		dto.setMenuPrice(Integer.parseInt(menuPrice));
		
		//	리스트에 추가하기
		list.add(dto);
		
		
		//	리스트 정렬하기
		//	list.sort((a, b) -> a.getCategory().compareTo(b.getCategory()));	//	등록 후 카테고리 별로 정렬하고 화면에 출력 
		
		list.sort((a, b) -> a.getMenuPrice() - b.getMenuPrice());				//	등록 후 가격 별로 정렬하고 화면에 출력 
		
	}

%>

<table border="1" cellpadding="10" cellspacing="0">
	<tr bgcolor="#dadada">
		<th>카테고리</th>
		<th>식당이름</th>
		<th>메뉴이름</th>
		<th>메뉴가격</th>
	</tr>
	<%for(FoodDTO dto : list) { %>
	<tr>
		<td><%=dto.getCategory() %></td>
		<td><%=dto.getStoreName() %></td>
		<td><%=dto.getMenuName() %></td>
		<td><%=dto.getMenuPrice() %></td>
	</tr>
	<% } %>
</table>


</body>
</html>