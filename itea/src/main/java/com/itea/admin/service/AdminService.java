package com.itea.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dao.adminDAO;
import com.itea.dto.MemberDTO;
import com.itea.util.PageUtil;

public class AdminService {
	
	@Autowired
	adminDAO adminDAO;
	
	
	//회원 목록
	public PageUtil memberList(int page) throws Exception {
		MemberDTO mdto = new MemberDTO();
		int size=mdto.getSize();
		int start=(page-1)*size;
		mdto.setStart(start);
		int totalCount=adminDAO.totalCount();
		ArrayList<MemberDTO> list=null;
		list=adminDAO.memberList(mdto);
		PageUtil pInfo = new PageUtil(totalCount,page,size,list);
		return pInfo;
	}
		
	//회원 검색
	public PageUtil memberSearchMnick(int page,MemberDTO mdto) throws Exception {
		int size=mdto.getSize();
		int start=(page-1)*size;
		mdto.setStart(start);
		int totalCount=adminDAO.mCntMnick(mdto);
		ArrayList<MemberDTO> list=null;
		list=adminDAO.memberSearchMnick(mdto);
		PageUtil pInfo = new PageUtil(totalCount,page,size,list);
		return pInfo;		
	}
	
	//회원 검색
	public PageUtil memberSearchMmail(int page,MemberDTO mdto) throws Exception {
		int size=mdto.getSize();
		int start=(page-1)*size;
		mdto.setStart(start);
		int totalCount=adminDAO.mCntMmail(mdto);
		ArrayList<MemberDTO> list=null;
		list=adminDAO.memberSearchMmail(mdto);
		PageUtil pInfo = new PageUtil(totalCount,page,size,list);
		return pInfo;		
	}
	
	
	//강제탈퇴
	public void deleteMember(String mnick) throws Exception {
		adminDAO.deleteMember(mnick);
	}
		
	
}











