package com.douzone.bookmall.vo;

public class OrderVo {
	private int no;
	private int orderNo;
	private int price;
	private int qty;
	private String shippingDest;
	private int memberNo;
	private int bookNo;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getShippingDest() {
		return shippingDest;
	}
	public void setShippingDest(String shippingDest) {
		this.shippingDest = shippingDest;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	
	@Override
	public String toString() {
		return "OrderVo [no=" + no + ", orderNo=" + orderNo + ", price=" + price + ", qty=" + qty + ", shippingDest="
				+ shippingDest + ", memberNo=" + memberNo + ", bookNo=" + bookNo + "]";
	}
}
