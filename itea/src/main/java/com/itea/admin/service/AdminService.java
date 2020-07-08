package com.itea.admin.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dao.adminDAO;
import com.itea.dto.MemberDTO;
import com.itea.util.PageUtil;

public class AdminService {
	
	@Autowired
	adminDAO adminDAO;
	
	MemberDTO mdto = new MemberDTO();
	ArrayList<MemberDTO> list=null;
	
	//회원목록
	public ArrayList<MemberDTO> memberList(PageUtil pInfo) throws Exception {
		//limit #{start},#{end}에 해당하는 부분이
		//lineCount; //	한페이지당 보여주고 싶은 게시물의 개수로 우리는 3설정
		//보고싶은페이지	start	end
		//1			1		3
		//2			4		6
		int start= (pInfo.getNowPage()-1)*pInfo.getLineCount()+1;
		int end  = start+pInfo.getLineCount()-1;
			
		mdto.setStart(start-1);
		mdto.setEnd(end);
		
		ArrayList<MemberDTO> list = adminDAO.memberList(mdto);
		return list;
	}
		
	//페이징관련 정보
	public PageUtil getPageInfo(int nowPage) {
		int totalCount= adminDAO.getTotalCnt();
		//PageUtil(보고싶은페이지,   전체게시물수);
		PageUtil pInfo = new PageUtil(nowPage, totalCount);
		return pInfo;
	}
	
	//회원 검색
	public PageUtil memberSearch(int page,String column,String value) throws Exception {
		int size=mdto.getSize();
		int totalCount=adminDAO.memberCnt();
		PageUtil pInfo = new PageUtil(totalCount,page,size,list);
		
		int start= (pInfo.getNowPage()-1)*pInfo.getLineCount()+1;
		int end  = start+pInfo.getLineCount()-1;
			
		mdto.setStart(start-1);
		mdto.setEnd(end);
		
		list=adminDAO.memberSearch(mdto);
		return pInfo;		
	}
	
	//회원검색 
	public PageUtil memberSearch(int page) throws Exception {
		int size=mdto.getSize();
		int totalCount=adminDAO.getTotalCnt();
		list=adminDAO.memberList(mdto);
		
		PageUtil pageInfo = new PageUtil(totalCount,page,size,list);
		return pageInfo;
	}
	
	//관리자 비번 확인
	public Boolean checkAdminPw(String mpw) throws Exception {
		Boolean pwCheck=adminDAO.checkAdminPw(mpw);
		return pwCheck;
		
	}
	
	//강제탈퇴
	public void deleteMember(String mnick) throws Exception {
		adminDAO.deleteMember(mnick);
	}
		
	
}











