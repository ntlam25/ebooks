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


@WebServlet("/login")
public class LoginServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		try {
			
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			
			if ("admin".equals(username) && "123456".equals(password))
			{
				User us = new User();
				us.setUserName("admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/home.jsp");
			}else {
				User us = dao.login(username, password);
				if (us!=null) {
				session.setAttribute("userobj", us);
				resp.sendRedirect("index.jsp");
				}
				else {
					session.setAttribute("failedMsg", "Tên người dùng hoặc mật khẩu không đúng!");
					resp.sendRedirect("login.jsp");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
