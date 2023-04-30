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

@WebServlet("/delete_book")
public class deleteBook extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));

			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteBook(id);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Xóa thành công");
				resp.sendRedirect("admin/all_book.jsp");
			} else {
				session.setAttribute("failedMsg", "Có lỗi xảy ra!");
				resp.sendRedirect("admin/all_book.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
