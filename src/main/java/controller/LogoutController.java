package controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model2.Controller;

/*
 * localhost/model2/logout.hta 요청을 처리하는 컨트롤러다.
 */
public class LogoutController implements Controller {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LogoutController의 process(request, resonse) 실행됨");
		
		// 세션객체를 폐기시키기
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		
		return "redirect:home.hta";
	}
}
