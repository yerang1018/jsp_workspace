package com.itbank.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeAction implements CommandAction {

	@Override		//		"/" 주소(최상위주소)로 GET 요청을 받으면 home이 반환된다 (home.jsp)
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		
		request.setAttribute("message", "ddsEwegW");
		return "home";		//	jsp 페이지 이름 == home
	}

	@Override		//		"/" 주소(최상위주소)로 POST 요청을 받으면 GET 과 동일한 규격으로 반환된다 
	public String doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		// TODO Auto-generated method stub
		return doGet(request, response);
	}

}
