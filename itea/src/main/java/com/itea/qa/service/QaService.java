package com.itea.qa.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dao.QaDAO;
import com.itea.dto.QaDTO;
import com.itea.util.PageUtil;

public class QaService {

	@Autowired
	QaDAO qaDAO;
	
	//페이징관련 정보
	public PageUtil getPageInfo(int nowPage) {
		int totalCount= qaDAO.getTotalCnt();
		
		PageUtil pInfo = new PageUtil(nowPage, totalCount,5,5);
		return pInfo;   
	}
	
	//내 질문 페이징관련 정보
	public PageUtil getmyPageInfo(int nowPage,int mno) {
		int totalCount= qaDAO.getmyTotalCnt(mno);
		PageUtil pInfo = new PageUtil(nowPage, totalCount,5,5);
		return pInfo;   
	}
	
	//선택 필드 페이징관련 정보
	public PageUtil getfieldPageInfo(int nowPage,String field) {
		int totalCount= qaDAO.getfieldCnt(field);
		
		PageUtil pInfo = new PageUtil(nowPage, totalCount,5,5);
		return pInfo;   
	}

	//전체 질문 리스트
	public ArrayList<QaDTO> getListView(PageUtil pInfo) {

		
		int start= 
			(pInfo.getNowPage()-1)*pInfo.getLineCount();
		int end  = start+pInfo.getLineCount()-1;
		
		QaDTO qaDTO = new QaDTO();
		qaDTO.setStart(start);
		qaDTO.setEnd(end);
		
		ArrayList<QaDTO> list = qaDAO.getListView(qaDTO);
		return list;
	}

	//내가 쓴 질문 리스트
	public ArrayList<QaDTO> getmyListView(PageUtil pInfo,int mno) {
		
		int start= (pInfo.getNowPage()-1)*pInfo.getLineCount()+1;
		int end  = start+pInfo.getLineCount()-1;
		
		QaDTO qaDTO = new QaDTO();
		qaDTO.setStart(start-1);
		qaDTO.setEnd(end);
		
		qaDTO.setLogno(mno);
		
		ArrayList<QaDTO> list = qaDAO.getmyListView(qaDTO);
		return list;

	}

	//선택한 필드에 맞는 질문 리스트
	public ArrayList<QaDTO> getListView(PageUtil pInfo, String field) {
		
		int start= (pInfo.getNowPage()-1)*pInfo.getLineCount()+1;
		int end  = start+pInfo.getLineCount()-1;
		
		QaDTO qaDTO = new QaDTO();
		qaDTO.setStart(start-1);
		qaDTO.setEnd(end);
		
		qaDTO.setQclass(field);
		
		ArrayList<QaDTO> list = qaDAO.getfieldListView(qaDTO);
		return list;
	}
	
	//질문 입력
	public void insertQuestion(QaDTO qaDTO) {
		qaDAO.insertQuestion(qaDTO);
	}
	
	//질문 삭제
	public void deleteQuestion(int qno) {

		qaDAO.deleteQuestion(qno);
	}

	//답변 입력
	public void insertAnswer(QaDTO qaDTO) {

		qaDAO.insertAnswer(qaDTO);
	}
}
