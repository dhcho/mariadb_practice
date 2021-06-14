package com.douzone.bookmall.test;

import java.util.List;

import com.douzone.bookmall.dao.*;
import com.douzone.bookmall.vo.*;


public class BookMall {

	public static void main(String[] args) {
		System.out.println("======회원======");
		MemberDao memberDao = new MemberDao();
		MemberVo memberVo = new MemberVo();
		
		// member insert
		memberVo.setName("foo");
		memberVo.setTel("010-1111-1111");
		memberVo.setEmail("foo@douzone.com");
		memberVo.setPwd("foo");
		memberDao.insert(memberVo);
		memberVo.setName("bar");
		memberVo.setTel("010-2222-2222");
		memberVo.setEmail("bar@douzone.com");
		memberVo.setPwd("bar");
		memberDao.insert(memberVo);
		
		// member retrieve
		List<MemberVo> memberList = memberDao.findAll();
		
		for(MemberVo prtMemberVo : memberList) {
			System.out.println(prtMemberVo);
		}
		
		System.out.println("======카테고리======");
		CategoryDao categoryDao = new CategoryDao();
		CategoryVo categoryVo = new CategoryVo();
		
		// category insert
		categoryVo.setCategory("컴퓨터/IT");
		categoryDao.insert(categoryVo);
		categoryVo.setCategory("경제");
		categoryDao.insert(categoryVo);
		categoryVo.setCategory("인문");
		categoryDao.insert(categoryVo);
		
		// category retrieve
		List<CategoryVo> categoryList = categoryDao.findAll();
		
		for(CategoryVo prtCategoryVo : categoryList) {
			System.out.println(prtCategoryVo);
		}
		
		System.out.println("======서적======");
		BookDao bookDao = new BookDao();
		BookVo bookVo = new BookVo();
		
		// book insert
		bookVo.setTitle("트와일라잇");
		bookVo.setPrice(10000);
		bookVo.setCategoryNo(1);
		new BookDao().insert(bookVo);

		bookVo.setTitle("뉴문");
		bookVo.setPrice(15000);
		bookVo.setCategoryNo(2);
		new BookDao().insert(bookVo);

		bookVo.setTitle("이클립스");
		bookVo.setPrice(20000);
		bookVo.setCategoryNo(1);
		new BookDao().insert(bookVo);

		// book retrieve
		List<BookVo> bookList = bookDao.findAll();
		
		for(BookVo prtBookVo : bookList) {
			System.out.println(prtBookVo);
		}
		
		System.out.println("======카트======");
		CartDao cartDao = new CartDao();
		CartVo cartVo = new CartVo();
		
		// cart insert
		cartVo.setQty(5);
		cartVo.setMemberNo(1);
		cartVo.setBookNo(2);
		new CartDao().insert(cartVo);

		cartVo.setQty(3);
		cartVo.setMemberNo(2);
		cartVo.setBookNo(1);
		new CartDao().insert(cartVo);
		
		// cart retrieve
		List<CartVo> cartList = cartDao.findAll();
		
		for(CartVo prtCartVo : cartList) {
			System.out.println(prtCartVo);
		}
		
		System.out.println("======주문/주문도서======");
		OrderDao orderDao = new OrderDao();
		OrderVo orderVo = new OrderVo();
		
		// order insert
		orderVo.setOrderNo(1);
		orderVo.setPrice(35000);
		orderVo.setShippingDest("Korea");
		orderVo.setMemberNo(1);
		new OrderDao().insertOrder(orderVo);

		// orderBook insert
		orderVo.setQty(2);
		orderVo.setOrderNo(1);
		orderVo.setBookNo(1);
		new OrderDao().insertOrderBook(orderVo);
		
		orderVo.setQty(1);
		orderVo.setOrderNo(1);
		orderVo.setBookNo(2);
		new OrderDao().insertOrderBook(orderVo);
		
		// order/orderBook retrieve
		List<OrderVo> orderList = orderDao.findAll();
		
		for(OrderVo prtOrderVo : orderList) {
			System.out.println(prtOrderVo);
		}
	}
}
