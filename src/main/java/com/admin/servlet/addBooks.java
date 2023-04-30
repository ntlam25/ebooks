package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.Book;

@WebServlet("/add_books")
@MultipartConfig
public class addBooks extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String bookName = new String(req.getParameter("bookname").getBytes("iso-8859-1"), "utf-8");
			String author = new String(req.getParameter("author").getBytes("iso-8859-1"), "utf-8");
			String price = req.getParameter("price");
			String categories = new String(req.getParameter("categories").getBytes("iso-8859-1"), "utf-8");
			Part part = req.getPart("bookimg");
			String fileName = part.getSubmittedFileName();

			Book book = new Book(bookName, author, price, categories, fileName);

			HttpSession session = req.getSession();

			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			
			req.setCharacterEncoding("UTF-8");
			
			boolean f = dao.addBooks(book);

			

			if (f) {
				String path = getServletContext().getRealPath("") + "img" + File.separator + "book";
				part.write(path + File.separator + fileName);
				session.setAttribute("succMsg", "Thêm thành công!");
				resp.sendRedirect("admin/add_books.jsp");
			} else {
				session.setAttribute("failedMsg", "Có lỗi xảy ra!");
				resp.sendRedirect("admin/add_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
