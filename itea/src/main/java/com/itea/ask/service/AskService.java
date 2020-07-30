package com.itea.ask.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itea.dao.AskDAO;
import com.itea.dto.AskDTO;
import com.itea.dto.ReplyDTO;
import com.itea.util.PageUtil;


@Service
public class AskService {
	
	@Autowired
	AskDAO askDAO;


	//페이징처리
	public PageUtil getPageInfo(int nowPage) {
		int totalCount=askDAO.getTotalCnt();
		PageUtil pInfo = new PageUtil(nowPage,totalCount,5,3);
		return pInfo;
	}
	
	//게시판 리스트
	public ArrayList<AskDTO> askList(PageUtil pInfo) {
		int start = 
				(pInfo.getNowPage()-1)*pInfo.getLineCount();
		int end   = start+pInfo.getLineCount()-1;
		AskDTO askDTO = new AskDTO();
		askDTO.setStart(start);
		askDTO.setEnd(end);
		
		ArrayList<AskDTO> list = 
				askDAO.askList(askDTO);
		return list;
	}

	//글 쓰기 처리
	public void aWriteProc(AskDTO askDTO) {
		askDAO.aWriteProc(askDTO);
	}

	//글 상세보기
	public AskDTO askDetail(int ano) {
		AskDTO askDTO = askDAO.askDetail(ano);
		return askDTO;
	}

	//글 수정 처리
	public void askModifyProc(AskDTO askDTO) {
		askDAO.askModifyProc(askDTO);
	}

	//글 삭제
	public void askDelete(int ano) {
		askDAO.askDelete(ano);
	}
	
	//조회수 증가
	public void askCnt(int ano,HttpSession session) {
		boolean isUpdate =false;
		ArrayList askCntList = (ArrayList) session.getAttribute("askCnt");
		if(askCntList==null || askCntList.size()==0) {
			isUpdate=true;
			askCntList=new ArrayList();
			askCntList.add(ano);
			session.setAttribute("askCtnList", askCntList);
		}else if(!askCntList.contains(ano)) {
			isUpdate=true;
			askCntList.add(ano);
			session.setAttribute("askCtnList", askCntList);
		}else {
			isUpdate=false;
		}
		
		if(isUpdate==true) {
			askDAO.askCnt(ano);
		}
		
	}
	
	//검색 제목
	public ArrayList<AskDTO> askSearchT(String search, PageUtil pInfo) {
		int start = 
				(pInfo.getNowPage()-1)*pInfo.getLineCount();
		int end   = start+pInfo.getLineCount()-1;
		AskDTO askDTO = new AskDTO();
		askDTO.setStart(start);
		askDTO.setEnd(end);
		askDTO.setSearch(search);
		ArrayList<AskDTO> list = 
				askDAO.askSearchT(askDTO);
		return list;
		
	}
	
	//검색 번호
	public ArrayList<AskDTO> askSearchA(String search,PageUtil pInfo) {
		int start = 
				(pInfo.getNowPage()-1)*pInfo.getLineCount();
		int end   = start+pInfo.getLineCount()-1;
		AskDTO askDTO = new AskDTO();
		askDTO.setStart(start);
		askDTO.setEnd(end);
		askDTO.setSearch(search);
		ArrayList<AskDTO> list = 
				askDAO.askSearchA(askDTO);
		return list;
		
	}
	
	//댓글 리스트
	public ArrayList<ReplyDTO> replyList(int ano) {
		ArrayList<ReplyDTO> list =  askDAO.replyList(ano);
		return list;
	}

	//댓글 삽입
	public void askReplyInsert(ReplyDTO replyDTO) {
		askDAO.askReplyInsert(replyDTO);
	}

	//댓글 삭제
	public void askReplyDelete(int acno, int acdepth) {
		if(acdepth==0) {
			askDAO.askReplyDelete(acno);
		}else if(acdepth==1) {
			askDAO.askcoReplyDelete(acno);
		}
		
	}
	
	//대댓글 삽입
	public void askcoReplyInsert(ReplyDTO replyDTO) {
		askDAO.askcoReplyInsert(replyDTO);
	}

	//문제풀기에서 질문찾기
	public ArrayList<AskDTO> problemBoard(int pno,PageUtil pInfo) {
		int start = 
				(pInfo.getNowPage()-1)*pInfo.getLineCount();
		int end   = start+pInfo.getLineCount()-1;
		AskDTO askDTO = new AskDTO();
		askDTO.setStart(start);
		askDTO.setEnd(end);
		askDTO.setPno(pno);
		
		ArrayList<AskDTO> list = 
				askDAO.problemBoard(askDTO);
		return list;
		
	}

	

}
