package com.itea.member.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.itea.member.dao.JoinDAO;
import com.itea.member.dto.MemberDTO;

public class JoinService {

	@Autowired
	JoinDAO joinDAO;
	
	//이메일 유무 확인하기
	public int checkMail(MemberDTO mdto) {
		
		int isMail=joinDAO.checkMail(mdto);
		
		return isMail;
	}
	
}
