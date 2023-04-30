package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			String email = req.getParameter("email");
			String phoneNumber = req.getParameter("phoneNumber");
			String check = req.getParameter("check");
			
			User us = new User();
			us.setUserName(username);
			us.setPassword(password);
			us.setEmail(email);
			us.setPhoneNumber(phoneNumber);
			
			HttpSession session = req.getSession();
			
			if (check != null)
			{
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				boolean f = dao.userRegister(us);
				
				if (f)
				{
					//System.out.println("Đăng ký thành công!");
					session.setAttribute("succMsg","Đăng ký thành công!");
					resp.sendRedirect("register.jsp");
				}
				else {
					//System.out.println("Đăng ký không thành công!");
					session.setAttribute("failedMsg","Đăng ký không thành công!");
					resp.sendRedirect("register.jsp");
				}
			}
			else {
				//System.out.println("Bạn chưa đồng ý với điều khoản!");
				session.setAttribute("failedMsg","Bạn chưa đồng ý với điều khoản!");
				resp.sendRedirect("register.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
