package com.itea.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.dao.adminDAO;
import com.itea.dto.MemberDTO;
import com.itea.util.Criteria;

public class AdminService {
	
	@Autowired
	adminDAO adminDAO;
	
	public List<MemberDTO> listPage(Criteria cri) throws Exception {
		return adminDAO.listPage(cri);
	}
	
	public int totalCount(Criteria cri) throws Exception {
		return adminDAO.totalCount(cri);
	}
	
	
	
	
}











