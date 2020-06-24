package com.itea.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.member.dto.MemberDTO;

public class LoginDAO extends SqlSessionDaoSupport {
	
	@Autowired
	SqlSessionTemplate session;
	
	//로그인처리 요청담당  함수
	public MemberDTO login(MemberDTO mdto) {

		MemberDTO member=session.selectOne("member.login",mdto);
		
		return member;
	}

	public MemberDTO snsLogin(MemberDTO mdto) {
		
		MemberDTO member=session.selectOne("member.snsLogin",mdto);
		
		System.out.println("sql후"+member);
		return member;
	}
	
}
