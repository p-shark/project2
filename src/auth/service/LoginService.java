package auth.service;

import java.sql.Connection;
import java.sql.SQLException;

import customer.dao.CustomerDao;
import customer.dto.Customer;
import jdbc.connection.ConnectionProvider;


public class LoginService {

	private CustomerDao memberDao = new CustomerDao();

	public User login(String id, String password) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			Customer member = memberDao.selectById(conn, id);
			if (member == null) {
				throw new LoginFailException();
			}
			if (!member.getCustomerPW().equals(password)) {
				throw new LoginFailException();
			}
			return new User(member.getCustomerID(), member.getName());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
