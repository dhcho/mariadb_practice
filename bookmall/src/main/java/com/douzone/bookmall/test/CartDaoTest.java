package com.douzone.bookmall.test;

import java.util.List;

import com.douzone.bookmall.dao.CartDao;
import com.douzone.bookmall.vo.CartVo;

public class CartDaoTest {
	public static void main(String[] args) {
		// insertTest();
		// findAllTest();
	}

	private static void findAllTest() {
		List<CartVo> list = new CartDao().findAll();
		for(CartVo vo : list) {
			System.out.println(vo);
		}
	}

	public static void insertTest() {
		CartVo vo = null;
		
		vo = new CartVo();
		vo.setQty(5);
		vo.setMemberNo(1);
		vo.setBookNo(2);
		new CartDao().insert(vo);

		vo = new CartVo();
		vo.setQty(3);
		vo.setMemberNo(2);
		vo.setBookNo(1);
		new CartDao().insert(vo);
	}
}
