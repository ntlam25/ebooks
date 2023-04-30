package com.DAO;

import java.util.List;

import com.entity.Book;

public interface BookDAO {
	public boolean addBooks (Book book);
	
	public List<Book> getAllBooks();
	
	public Book getBookById(int id);
	
	public boolean updateEditBook(Book book);
	
	public boolean deleteBook(int id);
	
	public List<Book> getNewBooks();
	
	public List<Book> getOldBooks();
	
	public List<Book> getAllNewBooks();
	
	public List<Book> getAllOldBooks();
	
	public List<Book> getBookBySearch(String ch);
}
