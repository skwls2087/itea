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
		session.insert("problem.insertProblem",pDTO);
		int pno= session.selectOne("problem.selectPno");
		pDTO.setPno(pno);
		session.insert("problem.insertChoicePchoice",pDTO);
		session.insert("problem.insertChoiceCorrect",pDTO);
		
	}

	public void insertShort(ProblemDTO pDTO) {
		session.insert("problem.insertProblem",pDTO);
		int pno= session.selectOne("problem.selectPno");
		pDTO.setPno(pno);
		session.insert("problem.insertCorrectList",pDTO);
	}

	public void insertEssay(ProblemDTO pDTO) {
		session.insert("problem.insertProblem",pDTO);
		int pno= session.selectOne("problem.selectPno");
		pDTO.setPno(pno);
		session.insert("problem.insertCorrectList",pDTO);
		
	}

	public List<String> selectPnoList(HashMap tinfo) {
		return session.selectList("problem.selectPnoList",tinfo);
	}
	public ProblemDTO problemInfo(int pno) {
		return session.selectOne("problem.problemInfo",pno);
	}

	public List<Object> selectChoice(int pno) {
		return session.selectList("problem.selectChoice",pno);
	}

	public String selectChoiceCorrect(int pno) {
		return session.selectOne("problem.selectChoiceCorrect",pno);
	}

	public List<Object> selectCorrectList(int pno) {
		return session.selectList("problem.selectCorrectList",pno);
	}

	public void problemCountUp(int pno, int correct) {
		session.update("problem.problemCountUp",pno);
		if(correct==1) {
			session.update("problem.problemCorrectUp",pno);
		}
	}

	public void problemLike(int pno) {
		session.update("problem.problemLike",pno);
	}

	public void problemHate(int pno) {
		session.update("problem.problemHate",pno);
	}

	public int selectPlike(int pno) {
		return session.selectOne("problem.selectPlike",pno);
	}

	public int selectPhate(int pno) {
		return session.selectOne("problem.selectPhate",pno);
	}

	public int pScrap(HashMap map) {
		return session.selectOne("problem.pScrap",map);
	}

	public void problemScrap(HashMap map) {
		session.update("problem.problemScrap",map);
	}

	public void problemNonScrap(HashMap map) {
		session.delete("problem.problemNonScrap",map);
	}

	
}
