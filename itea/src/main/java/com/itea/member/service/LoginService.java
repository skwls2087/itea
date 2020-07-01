package com.itea.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itea.dao.memberDAO;
import com.itea.dto.MemberDTO;

@Service
public class LoginService {
	
	@Autowired
	memberDAO loginDAO;
	
	//로그인처리 요청담당  함수
	public MemberDTO login(MemberDTO mdto) {
		
		MemberDTO member=loginDAO.login(mdto);
		
		return member;
	}

	public MemberDTO snsLogin(MemberDTO mdto) {
		
		MemberDTO member=loginDAO.snsLogin(mdto);
		
		return member;
	}
	
}
