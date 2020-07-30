package com.itea.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dto.ChatDTO;

public class ChatDAO {

	@Autowired
	SqlSessionTemplate session;
	
	@SuppressWarnings("unused")
	private SqlSessionTemplate sqlSession;  
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSession) {  
	    this.sqlSession = session;  
	}

	//채팅 내용 삽입
	public void chatInsert(ChatDTO chatDTO) {
		session.insert("chat.chatInsert", chatDTO);
	}

	
	
}
