package com.itea.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dto.AskDTO;
import com.itea.dto.ReplyDTO;

public class AskDAO {

	
	@Autowired
	SqlSessionTemplate session;
	
	@SuppressWarnings("unused")
	private SqlSessionTemplate sqlSession;  
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSession) {  
	    this.sqlSession = session;  
	}

	//게시판 리스트 
	public ArrayList askList(AskDTO askDTO) {
		return (ArrayList)session.selectList("ask.list",askDTO);
		
	}

	//총 게시물수 
	public int getTotalCnt() {
		return session.selectOne("ask.getTotalCnt"); 
	}

	//글 입력 처리
	public void aWriteProc(AskDTO askDTO) {
		session.insert("ask.aWriteProc",askDTO);
	}

	//글 상세보기
	public AskDTO askDetail(int ano) {
		return session.selectOne("ask.askDetail", ano);
	}
	
	//글 수정 처리
	public void askModifyProc(AskDTO askDTO) {
		session.update("ask.askModifyProc", askDTO);
	}

	//글 삭제
	public void askDelete(int ano) {
		session.delete("ask.askDelete", ano);
	}

	//조회수 증가
	public void askCnt(int ano) {
		session.update("ask.askCnt",ano);
	}
	
	//검색
	public ArrayList askSearch(AskDTO askDTO) {
		return (ArrayList) session.selectList("ask.search",askDTO);
	}

	//댓글 리스트
	public ArrayList replyList(int ano) {
		return (ArrayList) session.selectList("ask.replyList",ano);
	}

	//댓글 삽입
	public void askReplyInsert(ReplyDTO replyDTO) {
		session.insert("ask.askReplyInsert",replyDTO);
	}

	//댓글 삭제
	public void askReplyDelete(int acno) {
		session.delete("ask.askReplyDelete",acno);
	}

	//대댓글 삽입
	public void askcoReplyInsert(ReplyDTO replyDTO) {
		session.insert("ask.askcoReplyInsert",replyDTO);
	}

	//대댓글 삭제
	public void askcoReplyDelete(int acno) {
		session.delete("ask.askcoReplyDelete",acno);
	}


}

