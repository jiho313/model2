package controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model2.Controller;

public class LoginformController implements Controller {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LoginformController의 process(request, response) 실행됨");
		
		return "loginform.jsp";
	}
}
