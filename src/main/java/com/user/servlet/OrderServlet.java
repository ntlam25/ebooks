package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session = req.getSession();
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			String name = new String(req.getParameter("name").getBytes("iso-8859-1"), "utf-8");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String address = new String(req.getParameter("address").getBytes("iso-8859-1"), "utf-8");
			
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			List<Cart>	list =	dao.getBookByUser(id);
			
			if (list.isEmpty())
			{
				session.setAttribute("failedMsg", "Giỏ hàng trống");
				resp.sendRedirect("cart.jsp");
			}else
			{
				BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
				
				Book_Order o = null;
				
				ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();
				Random r = new Random();
				
				for (Cart c: list)
				{	
					o = new Book_Order();
					o.setOrderId("BOOK-ORD"+r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhone(phone);
					o.setAddress(address);
					o.setBookname(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					orderList.add(o);
				}
				
				boolean f = dao2.saveOrder(orderList);
				
				if (f)
				{
					resp.sendRedirect("order_success.jsp");
				}else
				{
					session.setAttribute("failedMsg","Đặt hàng thất bại!" );
					resp.sendRedirect("cart.jsp");
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
