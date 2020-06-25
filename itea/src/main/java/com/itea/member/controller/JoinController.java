package com.itea.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itea.member.dao.JoinDAO;
import com.itea.member.dto.MemberDTO;
import com.itea.member.service.JoinService;

@Controller
public class JoinController {
	
	@Autowired
	JoinDAO jDao;
	
	@Autowired
	JoinService joinSV;
	
	@RequestMapping("/member/joinFrm")
	public void joinFrm() {
		
	}
	
	@RequestMapping("/member/joinProc")
	public void joinProc(MemberDTO mDto) {
		System.out.println("joinProc 진입");
		System.out.println("mDto"+mDto);
		jDao.joinProc(mDto);
		
	}
	@RequestMapping("member/joinProcSNS")
	public String joinProcSNS(MemberDTO mDto) {
		System.out.println("joinProcSNS 진입");
		System.out.println("mDto"+mDto);
		jDao.joinProcSNS(mDto);
		
		return "../../index";
	}

    //이메일이 존재하는 이메일인지 확인
    @RequestMapping("member/checkMail")
	public String doPost(HttpServletRequest request) throws Exception {
		
    	System.out.println("컨트롤러왔어욤!!이메일");
    	String email=request.getParameter("email");
		System.out.println(email);
    	
		MemberDTO mDto=new MemberDTO();
		
		mDto.setMmail(email);
		mDto.setMclass(1);
		
		int isMail=joinSV.checkMail(mDto);
		
		System.out.println(isMail);
    	
		return null;
    }
	
}
