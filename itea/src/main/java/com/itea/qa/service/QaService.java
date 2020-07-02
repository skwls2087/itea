package com.itea.qa.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dao.QaDAO;
import com.itea.dto.QaDTO;

public class QaService {

	@Autowired
	QaDAO qaDAO;
	
	public void insertQuestion(QaDTO qaDTO) {
		qaDAO.insertQuestion(qaDTO);
	}

	//페이징관련 정보
	public PageUtil getPageInfo(int nowPage) {
		int totalCount= fbDAO.getTotalCnt();
		
		//PageUtil(보고싶은페이지,   전체게시물수);
		//PageUtil(int nowPage, int totalCount);
		PageUtil pInfo = new PageUtil(nowPage, totalCount);
		//PageUtil객체생성자에서는 내부적으로
		//	한페이지당 보여주고 싶은 게시물의 개수는 3
		//	페이지 이동 기능은 3개까지 지정
		return pInfo;
	}
}
