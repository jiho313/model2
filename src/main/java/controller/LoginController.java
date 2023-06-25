package controller;

import dao.CustomerDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model2.Controller;
import vo.Customer;

/*
 * localhost/model2/login.hta 요청을 처리하는 컨트롤러다.
 */
public class LoginController implements Controller {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LoginConroller의 process(request, response) 실행됨");
		
		// 요청객체에서 요청파라미터값(id, password) 조회하기
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		System.out.println("요청파라미터값 id -> " + id);
		System.out.println("요청파라미터값 password -> " + password);
		
		// 아이디로 고객정보 조회하기
		CustomerDao customerDao = new CustomerDao();
		Customer customer = customerDao.getCustomerById(id);
		// 아이디에 해당하는 고객정보가 존재하는지 확인하기
		if (customer == null) {
			return "redirect:loginform.hta?error=fail";
		}
		// 삭제된 고객인지 확인하기
		if ("Yes".equals(customer.getDisabled())) {
			return "redirect:loginform.hta?error=disabled";			
		}
		// 비밀번호가 일치하는지 확인하기
		if (!customer.getPassword().equals(password)) {
			return "redirect:loginform.hta?error=fail";
		}
		
		// 세션객체에 인증된 고객정보 저장하기
		HttpSession session = request.getSession();
		session.setAttribute("loginCustomer", customer);
		
		return "redirect:home.hta";
	}
}
