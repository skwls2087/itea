package com.itea.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.member.dto.MemberDTO;

public class JoinDAO extends SqlSessionDaoSupport{

	@Autowired
	SqlSessionTemplate session;
	
	public void joinProc(MemberDTO mDto) {
		session.insert("member.joinProc", mDto);
	}

	public void joinProcSNS(MemberDTO mDto) {
		session.insert("member.joinProcSNS",mDto);
	}
}