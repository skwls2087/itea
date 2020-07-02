package com.itea.qa.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dao.QaDAO;
import com.itea.dto.QaDTO;
import com.itea.util.PageUtil;

public class QaService {

	@Autowired
	QaDAO qaDAO;
	
	public void insertQuestion(QaDTO qaDTO) {
		qaDAO.insertQuestion(qaDTO);
	}

	//페이징관련 정보
	public PageUtil getPageInfo(int nowPage) {
		int totalCount= qaDAO.getTotalCnt();
		
		PageUtil pInfo = new PageUtil(nowPage, totalCount,4,10);
		return pInfo;   
	}

	public ArrayList<QaDTO> getListView(PageUtil pInfo) {

		
		int start= 
			(pInfo.getNowPage()-1)*pInfo.getLineCount()+1;
		int end  = start+pInfo.getLineCount()-1;
		
		QaDTO qaDTO = new QaDTO();
		qaDTO.setStart(start-1);
		qaDTO.setEnd(end);
		
		ArrayList<QaDTO> list = qaDAO.getListView(qaDTO);
		return list;
	}
}
