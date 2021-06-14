package com.douzone.bookmall.test;

import java.util.List;

import com.douzone.bookmall.dao.BookDao;
import com.douzone.bookmall.dao.OrderDao;
import com.douzone.bookmall.vo.BookVo;
import com.douzone.bookmall.vo.OrderVo;

public class OrderDaoTest {
	public static void main(String[] args) {
		// insertOrder();
		// insertOrderBook();
		// findAllTest();
	}

	private static void findAllTest() {
		List<OrderVo> list = new OrderDao().findAll();
		for(OrderVo vo : list) {
			System.out.println(vo);
		}
	}

	public static void insertOrder() {
		OrderVo vo = null;
		
		vo = new OrderVo();
		vo.setOrderNo(1);
		vo.setPrice(35000);
		vo.setShippingDest("Korea");
		vo.setMemberNo(1);
		new OrderDao().insertOrder(vo);
	}
	
	public static void insertOrderBook() {
		OrderVo vo = null;
		
		vo = new OrderVo();
		vo.setQty(2);
		vo.setOrderNo(2);
		vo.setBookNo(1);
		new OrderDao().insertOrderBook(vo);
		
		vo = new OrderVo();
		vo.setQty(1);
		vo.setOrderNo(2);
		vo.setBookNo(2);
		new OrderDao().insertOrderBook(vo);
	}
}
