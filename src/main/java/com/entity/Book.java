package com.entity;

public class Book {
	private int bookId;
	private String bookName;
	private String author;
	private String price;
	private String category;
	private String photoName;
	public Book() {
		super();
	}
	public Book(String bookName, String author, String price, String category, String photoName) {
		super();
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.category = category;
		this.photoName = photoName;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", bookName=" + bookName + ", author=" + author + ", price=" + price
				+ ", category=" + category + ", photoName=" + photoName + "]";
	}
	
	
	
	
}
