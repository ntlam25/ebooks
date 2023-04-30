package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book;

public class BookDAOImpl implements BookDAO {

	private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBooks(Book book) {
		boolean f = false;

		try {
			String sql = "insert into book(bookname,author,price,category,photo) value(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, book.getBookName());
			ps.setString(2, book.getAuthor());
			ps.setString(3, book.getPrice());
			ps.setString(4, book.getCategory());
			ps.setString(5, book.getPhotoName());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Book> getAllBooks() {
		List<Book> list = new ArrayList<Book>();
		Book book = null;
		try {
			String sql = "SELECT * FROM book";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				book = new Book();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setPhotoName(rs.getString(6));
				list.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public Book getBookById(int id) {
		Book book = null;

		try {

			String sql = "select * from book where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				book = new Book();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setPhotoName(rs.getString(6));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}

	public boolean updateEditBook(Book book) {
		boolean f = false;

		try {
			String sql = "update book set bookname=?, author=?,price=?,category=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, book.getBookName());
			ps.setString(2, book.getAuthor());
			ps.setString(3, book.getPrice());
			ps.setString(4, book.getCategory());
			ps.setInt(5, book.getBookId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteBook(int id) {
		boolean f = false;

		try {
			String sql = "insert into temp_c_b SELECT * FROM cart where bookid = ?";
			String sql1 = "delete cart from cart inner join temp_c_b on temp_c_b.bookid = cart.bookid WHERE cart.bookid=?";
			String sql2 = "	";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			PreparedStatement ps1 = conn.prepareStatement(sql1);
			ps1.setInt(1, id);
			ps1.executeUpdate();
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			ps2.setInt(1, id);
			int i = ps2.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Book> getNewBooks() {

		List<Book> list = new ArrayList<Book>();
		Book book = null;

		try {

			String sql = "select * from book where category=? limit 4";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Mới");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				book = new Book();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setPhotoName(rs.getString(6));
				list.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Book> getOldBooks() {

		List<Book> list = new ArrayList<Book>();
		Book book = null;

		try {

			String sql = "select * from book where category=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Cũ");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				book = new Book();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setPhotoName(rs.getString(6));
				list.add(book);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Book> getAllNewBooks() {
		List<Book> list = new ArrayList<Book>();
		Book book = null;

		try {

			String sql = "select * from book where category=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Mới");

			ResultSet rs = ps.executeQuery();
		
			while (rs.next()) {
				book = new Book();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setPhotoName(rs.getString(6));
				list.add(book);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Book> getAllOldBooks() {
		List<Book> list = new ArrayList<Book>();
		Book book = null;

		try {

			String sql = "select * from book where category=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Cũ");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				book = new Book();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setPhotoName(rs.getString(6));
				list.add(book);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Book> getBookBySearch(String ch) {
		List<Book> list = new ArrayList<Book>();
		Book book = null;

		try {
			String key = new String(ch.getBytes("iso-8859-1"), "utf-8");
			String sql = "select * from book where bookname like ? or author like ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(key);
			ps.setString(1,"%"+key+"%");
			ps.setString(2,"%"+key+"%");

			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				book = new Book();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setPhotoName(rs.getString(6));
				list.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
