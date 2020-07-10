package com.itea.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dto.MemberDTO;
import com.itea.util.Criteria;

public class adminDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	@SuppressWarnings("unused")
	private SqlSessionTemplate sqlSession;  
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSession) {  
		this.sqlSession = session;  
	}
	
    //listPage 구현
	public List<MemberDTO> listPage(Criteria cri) throws Exception {
		return session.selectList("admin.listPage",cri);
	}
	
	public int totalCount(Criteria cri) throws Exception {
		return session.selectOne("admin.totalCount",cri);
	}

}
