package com.itea.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dto.MemberDTO;
import com.itea.dto.Search;

public class adminDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	@SuppressWarnings("unused")
	private SqlSessionTemplate sqlSession;  
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSession) {  
		this.sqlSession = session;  
	}
	
	//회원검색
	public List<MemberDTO> getMemberList(Search search) throws Exception {
		return session.selectList("admin.getMemberList", search);
	}
	
	//회원검색 수 조회
	public int getMemberListCnt(Search search) throws Exception {
		return session.selectOne("admin.getMemberListCnt", search);
	}

}
