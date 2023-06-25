package controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model2.Controller;
import vo.Product;

/*
 * localhost/model2/home.hta 요청을 처리하는 컨트롤러다.
 */
public class HomeController implements Controller {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HomeController의 process(request, response)가 실행됨.");
		
		// home.jsp에서 표현한 데이터를 요청객체에 저장하기
		request.setAttribute("message", "홈페이지 방문을 환영합니다");
		
		// home.jsp에서 표현한 데이터를 요청객체에 저장하기
//		Product product1 = new Product(100, "연필", "모나미", 1500, 0.15, 10, new Date());
//		Product product2 = new Product(200, "지우개", "모나미", 1200, 0.15, 10, new Date());
//		request.setAttribute("p1", product1);
//		request.setAttribute("p2", product2);
		
		// home.jsp에서 표현할ㅎ 데이터를 요청객체에 저장하기
//		request.setAttribute("items1", List.of(product1, product2));
//		request.setAttribute("items2", List.of());
//		request.setAttribute("items3", Map.of("name", "홍길동", "email", "hong@gmil.com"));
//		request.setAttribute("items4", Map.of());
		
		
		return "home.jsp";
	}
}
