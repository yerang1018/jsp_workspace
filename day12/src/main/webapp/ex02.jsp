<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	.black {
		background-color: black;
		color: #dadada;
	}
	.lime {
		background-color: black;
		color: #00FF00;
	}
	.aqua {
		background-color: black;
		color: #00FFFF;
	}
	.orange {
		background-color: black;
		color: orange;
	}
	pre {
		font-size: 16px;
	}
</style>

</head>
<body class="${cookie.theme.value }">

<h1>쿠키를 활용한 색상 테마 설정</h1>
<hr>

<form action="ex02-action.jsp">
	<select name="theme">
	
		<option>white</option>
		<option ${cookie.theme.value == 'black' ? 'selected' : '' }>black</option>
		<option ${cookie.theme.value == 'lime' ? 'selected' : '' }>lime</option>
		<option ${cookie.theme.value == 'aqua' ? 'selected' : '' }>aqua</option>
		<option ${cookie.theme.value == 'orange' ? 'selected' : '' }>orange</option>
	</select>
	<input type="submit">
</form>


<fieldset>
	<legend>lorem</legend>
	<pre>
	1979년 10월 26일 약 18년간 장기집권한 박정희가 믿었던 심복 김재규에게 사살당하면서 민주화를 열망하는 국민들의 목소리가 크게 터져나오기 시작했다. 
	이에 당시 대통령 권한대행 최규하는 1979년 11월 10일 특별담화를 통해 일단 유신헌법에 따라 대통령을 선출하되[2] 
	새 대통령은 가능한 한 빠른 기간 안에 민주헌법으로 개정한 후 이에 따라 다시 선거를 실시하여야 할 것이라고 밝혔다.

	참고로 이 담화문은 야당 정치인을 포함해 거의 모든 국민들의 환영을 받았으며 12월 6일 통일주체국민회의에서 최규하 권한대행이 제10대 대통령으로 선출되면서 차례차례 현실화될 것으로 여겨졌다. 
	</pre>
	
</fieldset>

<div>
	<button id="checkCookie">쿠키 확인</button>
</div>


<script>
	checkCookie.onclick = function() {
		alert(document.cookie)
	}
</script>


</body>
</html>