package com.douzone.bookmall.test;

import java.util.List;

import com.douzone.bookmall.dao.BookDao;
import com.douzone.bookmall.vo.BookVo;

public class BookDaoTest {
	public static void main(String[] args) {
		// insertTest();
		// findAllTest();
	}

	private static void findAllTest() {
		List<BookVo> list = new BookDao().findAll();
		for(BookVo vo : list) {
			System.out.println(vo);
		}
	}

	public static void insertTest() {
		BookVo vo = null;
		
		vo = new BookVo();
		vo.setTitle("트와일라잇");
		vo.setPrice(10000);
		vo.setCategoryNo(1);
		new BookDao().insert(vo);

		vo = new BookVo();
		vo.setTitle("뉴문");
		vo.setPrice(15000);
		vo.setCategoryNo(2);
		new BookDao().insert(vo);

		vo = new BookVo();
		vo.setTitle("이클립스");
		vo.setPrice(20000);
		vo.setCategoryNo(1);
		new BookDao().insert(vo);
	}
}
