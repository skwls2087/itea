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

	//질문 개수
	public int getTotalCnt() {
		int qcnt=session.selectOne("qa.selectQuestionCnt");
		return qcnt;
	}
	
	public int getmyTotalCnt(int mno) {
		int qcnt=session.selectOne("qa.selectmyQuestionCnt",mno);
		return qcnt;
	}
	
	public int getfieldCnt(String qclass) {
		int qcnt=session.selectOne("qa.selectfieldQuestionCnt",qclass);
		return qcnt;
	}

	//질문 리스트
	public ArrayList<QaDTO> getListView(QaDTO qaDTO) {
		return  (ArrayList)session.selectList("qa.questionList", qaDTO);
	}

	public ArrayList<QaDTO> getmyListView(QaDTO qaDTO) {
		return  (ArrayList)session.selectList("qa.myquestionList", qaDTO);
	}

	public ArrayList<QaDTO> getfieldListView(QaDTO qaDTO) {
		return  (ArrayList)session.selectList("qa.fieldquestionList", qaDTO);
	}

	//질문-답변 CRUD
	public void insertQuestion(QaDTO qaDTO) {
		session.insert("qa.insertQuestion", qaDTO);
	}
	
	public void deleteQuestion(int qno) {
		session.delete("qa.deleteQuestion",qno);
	}
	public void insertAnswer(QaDTO qaDTO) {
		session.insert("qa.insertAnswer",qaDTO);
		
	}
	
	
}
