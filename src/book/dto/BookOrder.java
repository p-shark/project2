package book.dto;

import java.sql.Date;

public class BookOrder {
	
	private int orderID; /* 주문번호 */
	private int bookno; /* 도서번호 */
	private String customerID; /* 고객번호 */
	private Date orderDate; /* 주문일자 */
	private int orderAmount; /* 주문수량 */
	
	public BookOrder() {
		// TODO Auto-generated constructor stub
	}

	public BookOrder(int orderID, int bookno, String customerID, Date orderDate, int orderAmount) {
		super();
		this.orderID = orderID;
		this.bookno = bookno;
		this.customerID = customerID;
		this.orderDate = orderDate;
		this.orderAmount = orderAmount;
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public int getBookno() {
		return bookno;
	}

	public void setBookno(int bookno) {
		this.bookno = bookno;
	}

	public String getCustomerID() {
		return customerID;
	}

	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	@Override
	public String toString() {
		return "BookOrder [orderID=" + orderID + ", bookno=" + bookno + ", customerID=" + customerID + ", orderDate="
				+ orderDate + ", orderAmount=" + orderAmount + "]";
	}
	
	
}
