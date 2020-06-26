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

	public int checkMail(String mail) {
		int isMail=session.selectOne("member.mailCheck",mail);
		return isMail;
	}

	public int checkNick(String mnick) {
		int isNick=session.selectOne("member.nickCheck",mnick);
		return isNick;
	}
}
