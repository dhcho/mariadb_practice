package com.douzone.bookmall.vo;

public class CartVo {
	private int qty;
	private int memberNo;
	private int bookNo;
	
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
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
		return "CartVo [qty=" + qty + ", memberNo=" + memberNo + ", bookNo=" + bookNo + "]";
	}
}
