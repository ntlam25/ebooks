package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.Book;

@WebServlet("/edit_books")
public class editBook extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String bookName = new String(req.getParameter("bookname").getBytes("iso-8859-1"), "utf-8");
			String author = new String(req.getParameter("author").getBytes("iso-8859-1"), "utf-8");
			String price = req.getParameter("price");
			String categories = new String(req.getParameter("categories").getBytes("iso-8859-1"), "utf-8");
			
			Book book = new Book();
			book.setBookId(id);
			book.setBookName(bookName);
			book.setAuthor(author);
			book.setPrice(price);
			book.setCategory(categories);
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f = dao.updateEditBook(book);
			
			HttpSession session = req.getSession();
			
			if (f)
			{
				session.setAttribute("succMsg", "Cập nhật thành công!");
				resp.sendRedirect("admin/all_book.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Có lỗi xảy ra!");
				resp.sendRedirect("admin/all_book.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
