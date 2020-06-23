package com.itea.member.dao;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.itea.member.dto.MemberDTO;

public class FindIdPwDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	private SqlSessionTemplate sqlSession;  

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSession) {  
	    this.sqlSession = session;  
	}
	
	// 아이디 찾기
	public HashMap find_id(HashMap map) throws Exception{
		HashMap result = (HashMap)session.selectOne("member.find_id", map);
		return result;
	}
	
	// 비밀번호 변경
	@Transactional
	public int update_pw(MemberDTO member) throws Exception{
		return session.update("member.update_pw", member);
	}

	//이름 확인
	public int check_name(String mname, HttpServletResponse response) {
		return 0;
	}

	
	

}
