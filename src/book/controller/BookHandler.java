package book.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import book.dto.Book;
import book.service.BookService;
import customer.dto.Customer;
import customer.service.DuplicateIdException;
import customer.service.JoinService;
import mvc.command.CommandHandler;

//regist.do를 통해 접근한 도서 등록 폼 입력값 검사 클래스
public class BookHandler implements CommandHandler {

	private BookService bookService = new BookService();
	
	//bookRegistForm.jsp에서 가입 버튼 눌렀을 때
	public String process(HttpServletRequest req, HttpServletResponse res) {
		
		String job = req.getParameter("job");
		if(job != null) {
			if(job.equals("regist")) {
				System.out.println(req.getParameter("bookno"));
				String saveDir = req.getServletContext().getRealPath("/images/");
				int maxSize = 1024*1024*100;
				String encType = "UTF-8";
				
				MultipartRequest multipartRequest = null;
				try {
					multipartRequest = new MultipartRequest(req, saveDir, maxSize, encType, new DefaultFileRenamePolicy());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String upload_path = "images/";
				String path = upload_path + multipartRequest.getFilesystemName("photo");
				String result = regist(multipartRequest, path);
				return result;
			}
//			else if(job.equals("showAllBooks")) {
//				String result = showAllBooks();
//				return result
//			}
			return "index.jsp";
		}else {
			return "index.jsp";
		}
		
	}

	private String regist(MultipartRequest multipartRequest, String path) {
		System.out.println(multipartRequest.getParameter("bookno"));
		int bookno = Integer.parseInt(multipartRequest.getParameter("bookno"));
		String title = multipartRequest.getParameter("title");
		int price = Integer.parseInt(multipartRequest.getParameter("price"));
		int amount = Integer.parseInt(multipartRequest.getParameter("amount"));
		String photo = path;
		
		Book book = new Book(bookno, title, price, amount, photo);
				
		//입력 폼 값에 문제가 없다.
		try {
			bookService.regist(book);
			return "index.jsp";
		} catch (DuplicateIdException e) {
			System.out.println("BookID 중복" + e.getMessage());
			return "index.jsp";
		}
		
	}

}
