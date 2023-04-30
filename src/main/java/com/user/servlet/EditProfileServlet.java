package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/edit_profile")
public class EditProfileServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String oldpassword = req.getParameter("password");
			String newpassword = req.getParameter("password1");
			String newpassword1 = req.getParameter("password2");
			String email = req.getParameter("email");
			String phoneNumber = req.getParameter("phoneNumber");
			String address = new String(req.getParameter("address").getBytes("iso-8859-1"), "utf-8");
			
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			
			User user = new User();			
			user.setId(id);
			if (newpassword.isEmpty())
			{
				user.setPassword(oldpassword);
			}
			else if (newpassword.equals(newpassword1))
			{
				user.setPassword(newpassword);
			}else {
				session.setAttribute("failedMsg","Mật khẩu không khớp");
				resp.sendRedirect("edit_profile.jsp");
			}			
			user.setEmail(email);
			user.setPhoneNumber(phoneNumber);
			user.setAddress(address);
			
			boolean f = dao.checkPassword(id, DigestUtils.md5Hex(oldpassword).toUpperCase());
						
			if (f)
			{
				boolean f2 = dao.editProfile(user);
				if (f2)
				{
					session.setAttribute("succMsg","Cật nhật thành công!");
					resp.sendRedirect("edit_profile.jsp");
				}
				else {
					session.setAttribute("failedMsg","Có lỗi xảy ra!");
					resp.sendRedirect("edit_profile.jsp");
				}
			}else {
				session.setAttribute("failedMsg","Sai mật khẩu!");
				resp.sendRedirect("edit_profile.jsp");
			}
					
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	
}
