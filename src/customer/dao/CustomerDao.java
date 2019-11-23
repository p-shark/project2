package customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import customer.dto.Customer;
import jdbc.JdbcUtil;

public class CustomerDao {
	
	//id로 회원 정보 가져오기 - 로그인 등에 사용
	public Customer selectById(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from customer where customerID = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			Customer customer = null;
			if (rs.next()) {
				customer = new Customer(
						rs.getString("customerID"), 
						rs.getString("customerPW"), 
						rs.getString("name"));
			}
			return customer;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	/* 회원 등록 : service로부터 커넥션과 멤버 객체를 받아서 처리 - 커넥션 닫는 일은 service에서 함*/
	public void insert(Connection conn, Customer ct) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement("insert into customer values(?,?,?)")) {
			pstmt.setString(1, ct.getCustomerID());
			pstmt.setString(2, ct.getCustomerPW());
			pstmt.setString(3, ct.getName());
			pstmt.executeUpdate();
		}
	}
	
	/* 회원정보 수정: id로 확인하여 이름과 패스워드 수정 */
	public void update(Connection conn, Customer customer) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(
				"update customer set customerID = ?, customerPW = ? where name = ?")) {
			pstmt.setString(1, customer.getCustomerID());
			pstmt.setString(2, customer.getCustomerPW());
			pstmt.setString(3, customer.getName());
			pstmt.executeUpdate();
		}
	}
}
