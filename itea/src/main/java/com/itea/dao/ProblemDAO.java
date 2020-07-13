package com.itea.dao;

import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dto.ProblemDTO;
import com.itea.dto.licenseDTO;

public class ProblemDAO {

	@Autowired
	SqlSessionTemplate session;
	
	@SuppressWarnings("unused")
	private SqlSessionTemplate sqlSession;  

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSession) {  
	    this.sqlSession = session;  
	}
	
	//자격증 종류 전부 가져오기
	public List<licenseDTO> selectCkind() {
		return session.selectList("problem.selectCkind");
	}
	//단일 시험이 아닌경우의 시험 유형 가져오기
	public List<Object> selectLclass(int lno) {
		return session.selectList("problem.selectLclass",lno);
	}

	public int selectLqno(HashMap map) {
		return session.selectOne("problem.selectLqno",map);
	}

	public void insertChoice(ProblemDTO pDTO) {
		session.insert("problem.insertChoiceProblem",pDTO);
		int pno= session.selectOne("problem.selectPno");
		pDTO.setPno(pno);
		session.insert("problem.insertChoicePchoice",pDTO);
		session.insert("problem.insertChoiceCorrect",pDTO);
		
	}
	
}
