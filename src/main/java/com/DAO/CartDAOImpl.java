package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO {
	private Connection conn;

	public CartDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCart(Cart cart) {
		boolean f = false;

		try {
			String sql = "insert into cart(userid,bookid,bookname,author,price,total_price) value(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, cart.getUserid());
			ps.setInt(2, cart.getBookid());
			ps.setString(3, cart.getBookName());
			ps.setString(4, cart.getAuthor());
			ps.setDouble(5, cart.getPrice());
			ps.setDouble(6, cart.getTotalPrice());
			
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

	public List<Cart> getBookByUser(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart cart = null;
		double totalPrice = 0;
		try {
			String sql = "select * from cart where userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				cart = new Cart();
				cart.setCartid(rs.getInt(1));
				cart.setUserid(rs.getInt(2));
				cart.setBookid(rs.getInt(3));
				cart.setBookName(rs.getString(4));
				cart.setAuthor(rs.getString(5));
				cart.setPrice(rs.getDouble(6));
				
				totalPrice += rs.getDouble(7);
				cart.setTotalPrice(totalPrice);
				
				list.add(cart);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public boolean deleteBook(int bookid, int userid) {
		boolean f=false;
		
		try {
			
			String sql = "delete from cart where bookid=? and userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,bookid);
			ps.setInt(2,userid);
			
			int i=ps.executeUpdate();
			
			if ( i==1 )
			{
				f = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return f;
	}
	
	

}
