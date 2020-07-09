package com.itea.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dto.AskDTO;

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
}

