package com.itea.problem.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dao.ProblemDAO;
import com.itea.dto.ProblemDTO;
import com.itea.dto.QaDTO;
import com.itea.dto.licenseDTO;
import com.itea.util.PageUtil;

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
	public List<String> selectPnoList(HashMap tinfo) {
		return problemDAO.selectPnoList(tinfo);
	}
	//해당 문제의 기본정보
	public ProblemDTO problemInfo(int pno) {
		return problemDAO.problemInfo(pno);
	}
	//객관식 선지리스트 구하기
	public List<Object> selectChoice(int pno) {
		return problemDAO.selectChoice(pno);
	}
	//객관식 답 구하기
	public String selectChoiceCorrect(int pno) {
		return problemDAO.selectChoiceCorrect(pno);
	}
	//주관서술 답리스트 구하기
	public List<Object> selectCorrectList(int pno) {
		return problemDAO.selectCorrectList(pno);
	}

	public void problemCountUp(int pno, int correct) {
		problemDAO.problemCountUp(pno,correct);
	}
	//페이징관련 정보


	public void problemLike(int pno) {
		problemDAO.problemLike(pno);
	}

	public void problemHate(int pno) {
		problemDAO.problemHate(pno);
		
	}

	public int selectPlike(int pno) {
		return problemDAO.selectPlike(pno);
	}

	public int selectPhate(int pno) {
		return problemDAO.selectPhate(pno);
	}

	public int pScrap(HashMap map) {
		return problemDAO.pScrap(map);
	}

	public void problemScrap(HashMap map) {
		problemDAO.problemScrap(map);
		
	}

	public void problemNonScrap(HashMap map) {
		problemDAO.problemNonScrap(map);
		
	}

	public void problemError(HashMap map) {
		problemDAO.problemError(map);
		
	}


	public PageUtil getPageInfo(int nowPage, HashMap cert) {
		int totalCount= problemDAO.getmyTotalCnt(cert);
		PageUtil pInfo = new PageUtil(nowPage, totalCount,10,5);
		System.out.println(pInfo);
		return pInfo;
	}

	public ArrayList<ProblemDTO> myProblemList(PageUtil pInfo, HashMap cert) {
		
		
			int start= (pInfo.getNowPage()-1)*pInfo.getLineCount();
			int end  = start+pInfo.getLineCount()-1;
			
			ProblemDTO ProblemDTO = new ProblemDTO();
			
			cert.put("start", start);
			cert.put("size", ProblemDTO.getSize());
			
			ArrayList<ProblemDTO> list = problemDAO.myProblemList(cert);
			return list;
	}

	public List<String> selectPnoCorrects(int pno) {
		return problemDAO.selectPnoCorrects(pno);
	}

	//문제 삭제
	public void deleteProblem(int pno) {
		problemDAO.deleteProblem(pno);
	}
	  
	
	
			
			
	

}
