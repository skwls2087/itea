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
	
	PageUtil pInfo;
	MemberDTO mdto = new MemberDTO();
	ArrayList<MemberDTO> list=null;
	
	/*//회원목록
	public ArrayList<MemberDTO> memberList(PageUtil pInfo) throws Exception {
		int start= (pInfo.getNowPage()-1)*pInfo.getLineCount()+1;
		int end  = start+pInfo.getLineCount()-1;
			
		mdto.setStart(start-1);
		mdto.setEnd(end);
		
		ArrayList<MemberDTO> list = adminDAO.memberList(mdto);
		return list;
	}*/
	
	//회원 목록
	public PageUtil memberList(int page) throws Exception {
		int size=mdto.getSize();
		int totalCount=adminDAO.getTotalCnt();
		list=adminDAO.memberList(mdto);
		
		PageUtil pageInfo = new PageUtil(totalCount,page,size,list);
		return pageInfo;
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
		
		list=adminDAO.memberSearch(mdto);
		return pInfo;		
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











