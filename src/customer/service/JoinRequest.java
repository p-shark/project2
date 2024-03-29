package customer.service;

import java.util.Map;
//회원가입 폼, member table에 대한 DTO이자 입력폼의 값을 검증(validation) 클래스
public class JoinRequest {

	private String id;
	private String name;
	private String password;
	private String confirmPassword;
	
	//getter & setter
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
		
	// 두 번 입력 받은 패스워드가 서로 일치하는지 검증
	public boolean isPasswordEqualToConfirm() {
		return password != null && password.equals(confirmPassword);
	}
	
	//폼 입력값 검증 - 보통 javascript에서 하는 일을 jsp에서 처리
	public void validate(Map<String, Boolean> errors) {
		//폼에서 입력받은 값이 있는지 체크하고 없으면 errors에 항목 이름과 TRUE 입력
		checkEmpty(errors, id, "id");
		checkEmpty(errors, name, "name");
		checkEmpty(errors, password, "password");
		checkEmpty(errors, confirmPassword, "confirmPassword");
		//패스워드 두 번 입력 받은 패스워드가 서로 일치하는지 검증
		if (!errors.containsKey("confirmPassword")) {
			if (!isPasswordEqualToConfirm()) {
				errors.put("notMatch", Boolean.TRUE);
			}
		}
	}
	
	//폼의 각 항목에 값이 있는지 확인하고 없으면 errors라는 맵에 항목 이름과 True를 입력
	private void checkEmpty(Map<String, Boolean> errors, 
			String value, String fieldName) {
		if (value == null || value.isEmpty())
			errors.put(fieldName, Boolean.TRUE);
	}
}
