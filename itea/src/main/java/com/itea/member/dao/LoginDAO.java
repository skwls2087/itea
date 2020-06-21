package com.itea.member.dao;

import org.springframework.beans.factory.annotation.Autowired;

public class LoginDAO extends SqlSessionDaoSupport {
	
	@Autowired
	sqlSessionTemplate session;

	public void selectMember() {
		session.selectOne("member.loginProc");
		
	}

}
