package com.itea.member.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

public class LoginDAO extends SqlSessionDaoSupport {
	
	@Autowired
	SqlSessionTemplate session;
	
	//로그인처리 요청담당  함수
	public void login() {

		System.out.println("DAO옴!");
		int cnt = session.selectOne("member.memberCnt");
		System.out.println(cnt);
	}
	
}
