package customer.service;

import java.sql.Connection;
import java.sql.SQLException;

import customer.dao.CustomerDao;
import customer.dto.Customer;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;


public class ChangePasswordService {

	private CustomerDao memberDao = new CustomerDao();
	
	public void changePassword(String userId, String curPwd, String newPwd) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Customer member = memberDao.selectById(conn, userId);
			if (member == null) {
				throw new MemberNotFoundException();
			}
			member.setCustomerPW(newPwd);
			memberDao.update(conn, member);
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
