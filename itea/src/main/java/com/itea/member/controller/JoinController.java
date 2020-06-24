package com.itea.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itea.member.dao.JoinDAO;
import com.itea.member.dto.MemberDTO;

@Controller
public class JoinController {
	
	@Autowired
	JoinDAO jDao;
	
	@RequestMapping("/member/joinFrm")
	public void joinFrm() {

	}
	
	@RequestMapping("/member/joinProc")
	public void joinProc(MemberDTO mDto) {
		System.out.println("joinProc 진입");
		System.out.println("mDto"+mDto);
		
		jDao.joinProc(mDto);
		
	}
}
