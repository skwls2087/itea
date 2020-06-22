package com.itea.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.member.dto.MemberDTO;

public class LoginDAO extends SqlSessionDaoSupport {
	
	@Autowired
	SqlSessionTemplate session;
	
	//로그인처리 요청담당  함수
	public void login(MemberDTO mdto) {

		System.out.println("DAO옴!");
		session.selectOne("member.login",mdto);
		
	}
	
}
