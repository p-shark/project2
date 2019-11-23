package book.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import book.dao.BookDao;
import book.dto.Book;
import customer.service.DuplicateIdException;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

//서비스: 컨트롤러의 호출을 받아 매개변수로 받은 값 등을 이용해 과제 처리 알고리즘
//id 중복 체크하고 아니면 회원으로 등록(db에 insert)
public class BookService {

	private BookDao bookDao = new BookDao();
	
	public void regist(Book book) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			//id 중복 체크: 중복이면 롤백하고 익셉션 처리
			Book b1 = bookDao.selectById(conn, book.getBookno());
			if (b1 != null) {
				JdbcUtil.rollback(conn);
				throw new DuplicateIdException();
			}
			System.out.println("join>>>> gogo");
			//아니면 insert
			bookDao.insert(conn, 
					new Book(
							book.getBookno(), 
							book.getTitle(),
							book.getPrice(),
							book.getAmount(),
							book.getPhoto()));
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
