package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet  extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int bookid = Integer.parseInt(req.getParameter("bookid"));
			int userid = Integer.parseInt(req.getParameter("userid"));
					
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			Book book = dao.getBookById(bookid);
			
			Cart cart = new Cart();
			cart.setBookid(bookid);
			cart.setUserid(userid);
			cart.setBookName(book.getBookName());
			cart.setAuthor(book.getAuthor());
			cart.setPrice(Double.parseDouble(book.getPrice()));
			cart.setTotalPrice(Double.parseDouble(book.getPrice()));
			
			
			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
			boolean f = dao2.addCart(cart);
			
			HttpSession session = req.getSession();
			
			if (f)
			{
				session.setAttribute("addCart", "Đã thêm vào giỏ!");
				resp.sendRedirect("allbook.jsp");
			}else
			{
				session.setAttribute("failed", "Lỗi thêm vào giỏ hàng!");
				resp.sendRedirect("allbook.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
