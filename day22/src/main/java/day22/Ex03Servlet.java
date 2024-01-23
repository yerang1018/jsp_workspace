package day22;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ex03")
public class Ex03Servlet extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
	
	private final String prefix = "/WEB-INF/views/";
	private final String suffix = ".jsp";
	
	
	//	서블릿은 요청메서드에 따라 doGet 및 doPost 함수를 별도로 사용할 수 있다
	
	
	
	@Override	//	처리 내용 없이 JSP만 보여주면 된다 (곧바로 포워드)
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String viewName = "ex03-form";
		req.getRequestDispatcher(prefix + viewName + suffix).forward(req, resp);
	}
	
	
	@Override	//	처리만 수행하고 JSP로 넘기지 않는다 (다른 주소로 리다이렉트)
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");
		HttpSession session = req.getSession();
		
		if("test".equals(userid) && "1234".equals(userpw)) {
			session.setAttribute("login", "테스트");
		}
		String cpath = req.getContextPath();
		resp.sendRedirect(cpath + "/ex03");
	}
	
	
	
	
}
