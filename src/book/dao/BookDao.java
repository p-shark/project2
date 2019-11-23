package book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import book.dto.Book;
import customer.dto.Customer;
import jdbc.JdbcUtil;

public class BookDao {
	
	public Book selectById(Connection conn, int bookno) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from book where bookno = ?");
			pstmt.setInt(1, bookno);
			rs = pstmt.executeQuery();
			Book book = null;
			if (rs.next()) {
				book = new Book(
						rs.getInt("bookno"), 
						rs.getString("title"), 
						rs.getInt("price"), 
						rs.getInt("amount"), 
						rs.getString("photo"));
			}
			return book;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	
	public void insert(Connection conn, Book book) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement("insert into book values(?,?,?,?,?)")) {
			pstmt.setInt(1, book.getBookno());
			pstmt.setString(2, book.getTitle());
			pstmt.setInt(3, book.getPrice());
			pstmt.setInt(4, book.getAmount());
			pstmt.setString(5, book.getPhoto());
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
	
	
	public List<Book> selectAllBooks(Connection conn) {
		//최근 등록한 상품 먼저 출력하기
		String sql = "select * from book order by bookno desc";
		List<Book> list = new ArrayList<Book>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Book book = new Book();
				book.setBookno(rs.getInt("bookno"));
				book.setTitle(rs.getString("title"));
				book.setPrice(rs.getInt("price"));
				book.setAmount(rs.getInt("amount"));
				book.setPhoto(rs.getString("photo"));
				list.add(book);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return list;
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from book");
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<Book> select(Connection conn, int startRow, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from book " +
					"order by bookno desc limit ?, ?");
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			List<Book> result = new ArrayList<>();
			while (rs.next()) {
				result.add(convertArticle(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Book convertArticle(ResultSet rs) throws SQLException {
		return new Book(rs.getInt("bookno"),
				rs.getString("title"),
				rs.getInt("price"),
				rs.getInt("amount"),
				rs.getString("photo")
				);
	}
}
