package controller;

import dao.CustomerDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model2.Controller;
import vo.Customer;

/*
 * localhost/model2/register.hta 요청을 처리하는 컨트롤러다.
 */
public class RegisterController implements Controller {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RegisterController의 process(request, response) 실행됨");
		
		// 입력폼에서 서버로 전달한 요청파라미터값 조회하기
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		System.out.println("RegisterController 폼 입력값 확인 - id : " + id);
		System.out.println("RegisterController 폼 입력값 확인 - password : " + password);
		System.out.println("RegisterController 폼 입력값 확인 - name : " + name);
		System.out.println("RegisterController 폼 입력값 확인 - tel : " + tel);
		System.out.println("RegisterController 폼 입력값 확인 - email : " + email);
		
		CustomerDao customerDao = new CustomerDao();
		// 아이디 중복체크하기
		Customer savedCustomer = customerDao.getCustomerById(id);
		if (savedCustomer != null) {
			return "redirect:registerform.hta?error=id";
		}
		
		// 이메일 중복체크하기
		savedCustomer = customerDao.getCustomerByEmail(email);
		if (savedCustomer != null) {
			return "redirect:registerform.hta?error=email";
		}
		
		// 고객 정보 저장하기
		Customer customer = new Customer();
		customer.setId(id);
		customer.setPassword(password);
		customer.setName(name);
		customer.setTel(tel);
		customer.setEmail(email);
		
		customerDao.insertCustomer(customer);		
		
		return "redirect:complete.hta";
	}
}
