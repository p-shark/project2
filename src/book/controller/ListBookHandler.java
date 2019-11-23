package book.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.service.BookPage;
import book.service.ListBookService;
import mvc.command.CommandHandler;

public class ListBookHandler implements CommandHandler {

	private ListBookService listService = new ListBookService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
			throws Exception {
		String pageNoVal = req.getParameter("pageNo");
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		BookPage bookPage = listService.getArticlePage(pageNo);
		req.setAttribute("bookPage", bookPage);
		return "/WEB-INF/view/listbook.jsp";
	}

}
