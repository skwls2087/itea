package com.itea.dao;

import java.util.ArrayList;

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

	public int getTotalCnt() {
		int qcnt=session.selectOne("qa.selectQuestionCnt");
		return qcnt;
	}

	public ArrayList<QaDTO> getListView(QaDTO qaDTO) {
		return  (ArrayList)session.selectList("qa.questionList", qaDTO);
	}
	
}
