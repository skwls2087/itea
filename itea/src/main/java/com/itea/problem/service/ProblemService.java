package com.itea.problem.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dao.ProblemDAO;
import com.itea.dto.ProblemDTO;
import com.itea.dto.licenseDTO;

public class ProblemService {

	@Autowired
	ProblemDAO problemDAO;
	
	//자격증 종류
	public List<licenseDTO> selectCkind() {
		return problemDAO.selectCkind();
	}
	
	//시험 유형
	public List<Object> selectLclass(int lno) {
		return problemDAO.selectLclass(lno);
	}

	//선택한 자격증시험의 lqno 구하기
	public int selectLqno(HashMap map) {
		return problemDAO.selectLqno(map);
	}

	//객관식 시험
	public void insertChoice(ProblemDTO pDTO) {
		problemDAO.insertChoice(pDTO);
	}
	//주관식 시험
	public void insertShort(ProblemDTO pDTO) {
		problemDAO.insertShort(pDTO);
		
	}
	//서술형 시험
	public void insertEssay(ProblemDTO pDTO) {
		problemDAO.insertEssay(pDTO);
	}
	//선택한 조건에 맞는 문제리스트 
	public List<ProblemDTO> selectProblem(HashMap tinfo) {
		return problemDAO.selectProblem(tinfo);
	}
	//객관식 선지리스트 구하기
	public List<HashMap> selectChoice(int pno) {
		return problemDAO.selectChoice(pno);
	}
	//객관식 답 구하기
	public String selectChoiceCorrect(int pno) {
		return problemDAO.selectChoiceCorrect(pno);
	}
	//주관서술 답리스트 구하기
	public List<HashMap> selectCorrectList(int pno) {
		return problemDAO.selectCorrectList(pno);
	}

}
