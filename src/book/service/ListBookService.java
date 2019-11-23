package book.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import book.dao.BookDao;
import book.dto.Book;
import jdbc.connection.ConnectionProvider;

public class ListBookService {

	private BookDao articleDao = new BookDao();
	private int size = 10;

	public BookPage getArticlePage(int pageNum) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int total = articleDao.selectCount(conn);
			List<Book> content = articleDao.select(
					conn, (pageNum - 1) * size, size);
			return new BookPage(total, pageNum, size, content);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
