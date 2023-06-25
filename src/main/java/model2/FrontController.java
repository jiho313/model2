package model2;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import controller.BoardDetailController;
import controller.BoardInsertController;
import controller.BoardInsertFormController;
import controller.BoardListController;
import controller.BoardReadController;
import controller.BoardUpdateController;
import controller.BoardUpdateformController;
import controller.CompleteController;
import controller.HomeController;
import controller.LoginController;
import controller.LoginformController;
import controller.LogoutController;
import controller.RegisterController;
import controller.RegisterFormController;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "*.hta")
public class FrontController extends HttpServlet {
	
	private Map<String, Controller> controllerMap = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		controllerMap.put("/home.hta", new HomeController());
		controllerMap.put("/registerform.hta", new RegisterFormController());
		controllerMap.put("/register.hta", new RegisterController());
		controllerMap.put("/complete.hta", new CompleteController());
		controllerMap.put("/loginform.hta", new LoginformController());
		controllerMap.put("/login.hta", new LoginController());
		controllerMap.put("/logout.hta", new LogoutController());
		
		controllerMap.put("/board/list.hta", new BoardListController());
		controllerMap.put("/board/insertform.hta", new BoardInsertFormController());
		controllerMap.put("/board/insert.hta", new BoardInsertController());
		controllerMap.put("/board/read.hta", new BoardReadController());
		controllerMap.put("/board/detail.hta", new BoardDetailController());
		controllerMap.put("/board/updateform.hta", new BoardUpdateformController());
		controllerMap.put("/board/update.hta", new BoardUpdateController());
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println();
		System.out.println("### FrontController의 service(request, response) 실행됨.");
		
		// 1. 클라이언트의 요청을 분석해서 요청 URI를 알아낸다.
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
	
		requestURI = requestURI.replace(contextPath, "");
		System.out.println("### FrontController - 요청 URI : " + requestURI);
		
		// 2. 요청 URI와 매핑된 Controller객체를 가져온다.
		Controller controller = controllerMap.get(requestURI);
		System.out.println("### FrontController - 컨트롤러 : " + controller);
		if (controller == null) {
			throw new ServletException("["+requestURI+"]과 매핑되는 컨트롤러가 존재하지 않습니다.");
		}
	
		// 3. 컨트롤러의 process(request, response) 실행하기
		try {
			String path = controller.process(request, response);
			System.out.println("### FrontController - path : " + path);
			if (path == null) {
				throw new Exception("컨트롤러의 반환값은 null일 수 없습니다.");
			}
			
			if (path.startsWith("redirect:")) {
				// 클라이언트에게 재요청 URL을 응답으로 보낸다.
				path = path.replace("redirect:", "");
				System.out.println("### FrontController - 재요청 URL 응답 : " + path);
				response.sendRedirect(path);
			} else {
				// 클라이언트의 요청을 지정된 JSP로 내부 이동시킨다.
				// 결과적으로 클라이언트에게는 JSP 실행결과로 생성된 HTML 컨텐츠가 응답으로 보내진다.
				path = "/WEB-INF/views/" + path;
				System.out.println("### FrontController - JSP로 내부이동 : " + path);
				RequestDispatcher requestDispatcher = request.getRequestDispatcher(path);
				requestDispatcher.forward(request, response);
			}
			
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
		
		
	}
}





















