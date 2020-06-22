package com.itea.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.itea.member.dto.MemberDTO;

public class MemberDAO {
	
	@Autowired
	SqlSession session;
	
	private MemberDAO memberDAO;
	
	public void setMemberDAO(MemberDAO memberDAO) {
		  this.memberDAO = memberDAO;
	}

	
	// 이메일 중복 검사
	public int check_mmail(String mmail) throws Exception{
		return session.selectOne("member.check_mmail", mmail);
	}
	
	// 회원가입
	@Transactional
	public int join_member(MemberDTO member) throws Exception{
		return session.insert("member.join_member", member);
	}


}
