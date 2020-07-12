package com.itea.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dao.adminDAO;
import com.itea.dto.MemberDTO;
import com.itea.dto.Search;

public class AdminService {
	
	@Autowired
	adminDAO adminDAO;
	
	
	public List<MemberDTO> getMemberList(Search search) throws Exception {
		return adminDAO.getMemberList(search);
	}
	
	public int getMemberListCnt(Search search) throws Exception {
		return adminDAO.getMemberListCnt(search);
	}
	
}











