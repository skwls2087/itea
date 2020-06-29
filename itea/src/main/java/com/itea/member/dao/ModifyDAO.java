package com.itea.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.member.dto.MemberDTO;

public class ModifyDAO extends SqlSessionDaoSupport {
	
	@Autowired
	SqlSessionTemplate session;
	
	public MemberDTO modifyInfo(int mno) {
		return (MemberDTO)session.selectOne("member.modifyInfo",mno);
	}
	
	
	public MemberDTO modify(MemberDTO mDto) {
		session.update("member.modify",mDto);
		return null;
	
	}



	public void delete(int mno) {
		session.delete("member.delete",mno);
		
	
	}


	public int checkNick(MemberDTO mDto) {
		int isNick=session.selectOne("member.mynickCheck",mDto);
		return isNick;
	}

}
