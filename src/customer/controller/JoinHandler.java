package customer.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.dto.Customer;
import customer.service.DuplicateIdException;
import customer.service.JoinService;
import mvc.command.CommandHandler;

//join.do를 통해 접근한 회원가입용 폼 입력값 검사 클래스
public class JoinHandler implements CommandHandler {

	private JoinService joinService = new JoinService();
	
	//joinForm.jsp에서 가입 버튼 눌렀을 때
	public String process(HttpServletRequest req, HttpServletResponse res) {
		
		String customerID = req.getParameter("customerID");
		String customerPW = req.getParameter("customerPW");
		String name = req.getParameter("name");
		
		Customer customer = new Customer(customerID, customerPW, name);
				
		//입력 폼 값에 문제가 없다.
		try {
			//폼 입력값을 joinReq 오브젝트로 만들어서 joinService 클래스의 join 메소드로 넘겨주고 실행
			joinService.join(customer);
			return "index.jsp";
		} catch (DuplicateIdException e) {
			System.out.println("ID 중복" + e.getMessage());
			return "index.jsp";
		}
	}

}
