package customer.dto;

public class Customer {
	
	private String customerID; /*고객아이디*/
	private String customerPW; /*고객비밀번호*/
	private String name; /* 이름 */
	
	public Customer() {
		// TODO Auto-generated constructor stub
	}

	public Customer(String customerID, String customerPW, String name) {
		super();
		this.customerID = customerID;
		this.customerPW = customerPW;
		this.name = name;
	}

	public String getCustomerID() {
		return customerID;
	}

	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}

	public String getCustomerPW() {
		return customerPW;
	}

	public void setCustomerPW(String customerPW) {
		this.customerPW = customerPW;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Customer [customerID=" + customerID + ", customerPW=" + customerPW + ", name=" + name + "]";
	}
	
	
}
