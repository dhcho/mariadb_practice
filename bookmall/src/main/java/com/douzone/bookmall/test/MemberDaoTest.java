package com.douzone.bookmall.test;

import java.util.List;

import com.douzone.bookmall.dao.MemberDao;
import com.douzone.bookmall.vo.MemberVo;

public class MemberDaoTest {

	public static void main(String[] args) {
		// insertTest();
		// findAllTest();
	}

	private static void findAllTest() {
		List<MemberVo> list = new MemberDao().findAll();
		for(MemberVo vo : list) {
			System.out.println(vo);
		}
	}

	public static void insertTest() {
		MemberVo vo = null;
		 
		vo = new MemberVo();
		vo.setName("foo");
		vo.setTel("010-1111-1111");
		vo.setEmail("foo@douzone.com");
		vo.setPwd("foo");
		new MemberDao().insert(vo);
		
		vo = new MemberVo();
		vo.setName("bar");
		vo.setTel("010-2222-2222");
		vo.setEmail("bar@douzone.com");
		vo.setPwd("bar");
		new MemberDao().insert(vo);
	}
}
