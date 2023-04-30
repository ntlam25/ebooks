package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;


@WebServlet("/remove_book")
public class RemoveBookServlet extends HttpServlet {
	

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bookid = Integer.parseInt(req.getParameter("bookid"));
		int userid = Integer.parseInt(req.getParameter("userid"));
		
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		boolean f = dao.deleteBook(bookid, userid);
		HttpSession session = req.getSession();
		
		if (f)
		{
			session.setAttribute("succMsg","Xoá sách khỏi giỏ thành công!");
			resp.sendRedirect("cart.jsp");
		}else {
			session.setAttribute("failedMsg","Có lỗi xảy ra!");
			resp.sendRedirect("cart.jsp");
		}
	}
	
}
