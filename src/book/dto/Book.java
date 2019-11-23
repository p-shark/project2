package book.dto;

public class Book {
	
	private int bookno; /* 도서번호 */
	private String title; /* 도서이름 */
	private int price; /* 도서 가격 */
	private int amount; /* 도서 수량 */
	private String photo; /* 사진 경로 */
	
	
	public Book() {
		// TODO Auto-generated constructor stub
	}
	
	public Book(int bookno, String title, int price, int amount, String photo) {
		this.bookno = bookno;
		this.title = title;
		this.price = price;
		this.amount = amount;
		this.photo = photo;
	}
	
	

	public int getBookno() {
		return bookno;
	}

	public void setBookno(int bookno) {
		this.bookno = bookno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "Book [bookno=" + bookno + ", title=" + title + ", price=" + price + ", amount=" + amount + ", photo="
				+ photo + "]";
	}

	
	
	
}
