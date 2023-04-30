package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.commons.codec.digest.DigestUtils;

import com.entity.User;

public class UserDAOImpl implements UserDAO{
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User us) {
		boolean f = false;
		
		try {
			String sql = "insert into user(username,password,email,phoneNumber) value(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getUserName());
			String password =  us.getPassword();
			String passwordMH = DigestUtils.md5Hex(password).toUpperCase();
			ps.setString(2, passwordMH);
			ps.setString(3, us.getEmail());
			ps.setString(4, us.getPhoneNumber());
			
			int i = ps.executeUpdate();
			if (i==1)
			{
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public User login ( String username, String password) {
		User us = null;
		try {
			String sql = "select * from user where username=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql); 
			String passwordMH = DigestUtils.md5Hex(password).toUpperCase();
			ps.setString(1, username);
			ps.setString(2, passwordMH);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				us = new User();
				us.setId(rs.getInt(1));
				us.setUserName(rs.getString(2));
				us.setPassword(rs.getString(3));
				us.setEmail(rs.getString(4));
				us.setPhoneNumber(rs.getString(5));
				us.setAddress(rs.getString(6));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return us;
	}

	public boolean checkPassword(int id, String password) {
		boolean f = false;
		try {
			
			String sql = "select * from user where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean editProfile(User user) {
		boolean f = false;
		
		try {
			String sql = "update user set password=?, email=?, phoneNumber=?,address=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			String password =  user.getPassword();
			String passwordMH = DigestUtils.md5Hex(password).toUpperCase();
			ps.setString(1, passwordMH);
			ps.setString(2, user.getEmail());;
			ps.setString(3, user.getPhoneNumber());
			ps.setString(4, user.getAddress());
			ps.setInt(5, user.getId());
			
			int i=ps.executeUpdate();
			if (i==1)
			{
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;		
	}
	
}
