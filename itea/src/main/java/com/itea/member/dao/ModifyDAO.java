package com.itea.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.member.dto.MemberDTO;

public class ModifyDAO extends SqlSessionDaoSupport {
	
	@Autowired
	SqlSessionTemplate session;
	
//	public MemberDTO modify(int mno) {
//		session.update("member.modify",mno);
//		return null;
//	
//	}
	
}
