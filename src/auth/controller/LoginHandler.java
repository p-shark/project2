package auth.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.LoginFailException;
import auth.service.LoginService;
import auth.service.User;
import mvc.command.CommandHandler;

public class LoginHandler implements CommandHandler {

	private LoginService loginService = new LoginService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
	throws Exception {
		
		String id = trim(req.getParameter("customerID"));
		String password = trim(req.getParameter("customerPW"));

		
		try {
			User user = loginService.login(id, password);
			//로그인 성공 - 세션에 속성 authUser와 속성값 회원정보를 붙여준다.
			req.getSession().setAttribute("authUser", user);
			//index.jsp 페이지로 돌아감
			return "index.jsp";
//			res.sendRedirect(req.getContextPath() + "/index.jsp");
//			return null;
		} catch (LoginFailException e) {
			System.out.println("로그인 실패");
			return "index.jsp";
		}
	}

	private String trim(String str) {
		return str == null ? null : str.trim();
	}
}
