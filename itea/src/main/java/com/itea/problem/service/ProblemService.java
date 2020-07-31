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

	public PageUtil getPageInfo(int nowPage, int mno) {
		int totalCount= problemDAO.getmyTotalCnt(mno);
		PageUtil pInfo = new PageUtil(nowPage, totalCount,4,5);
		return pInfo;  
	}

	public ArrayList<ProblemDTO> getcProblemList(PageUtil pInfo, int mno) {
			int start= 
				(pInfo.getNowPage()-1)*pInfo.getLineCount()+1;
			int end  = start+pInfo.getLineCount()-1;
			ProblemDTO ProblemDTO = new ProblemDTO();
			ProblemDTO.setStart(start-1);
			ProblemDTO.setEnd(end);
			ProblemDTO.setLogno(mno);
			
			ArrayList<ProblemDTO> list = problemDAO.getcProblemList(ProblemDTO);
			return list;
	}
	  
	
	
			
			
	

}
