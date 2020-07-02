package com.itea.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dto.QaDTO;

public class QaDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	@SuppressWarnings("unused")
	private SqlSessionTemplate sqlSession;  

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSession) {  
	    this.sqlSession = session;  
	}

	public void insertQuestion(QaDTO qaDTO) {
		session.insert("qa.insertQuestion", qaDTO);
	}
	
}
