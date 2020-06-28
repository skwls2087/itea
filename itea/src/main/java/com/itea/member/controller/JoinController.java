package com.itea.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String joinProc(MemberDTO mDto) {
		System.out.println("joinProc 진입");
		System.out.println("mDto"+mDto);
		mDto.setMclass(1);
		jDao.joinProc(mDto);
		
		return "member/loginFrm";
		
	}
	
	@RequestMapping("member/joinProcSNS")
	public String joinProcSNS(MemberDTO mDto) {
		System.out.println("joinProcSNS 진입");
		System.out.println("mDto"+mDto);
		jDao.joinProcSNS(mDto);
		
		return "../../index";
	}
	
	@RequestMapping("snsjoin")
	public String snsjoin(@RequestParam String email,HttpServletRequest request) {
		
		request.setAttribute("email", email);
		
		return "member/joinFrmSNS";
	}
	
    //이메일이 존재하는 이메일인지 확인하고 인증코드 발송
    @RequestMapping("member/checkMail")
    @ResponseBody
	public int checkMail(HttpServletRequest request) throws Exception {
		
    	String email=request.getParameter("email");
    	
		int isMail=joinSV.checkMail(email);
		
		if(isMail==0) {//같은 이메일이 없으면 -> 코드번호 전송
			
			String scode=joinSV.getCode();//코드생성
			joinSV.sendMail(scode,email);//메일전송
			
			int code=Integer.parseInt(scode);
			
			return code;
		}else {//같은 이메일이 있으면 -> 1 전송
			
			return 1;
		}
    }
    
    //이메일이 존재하는 이메일인지 확인하고 인증코드 발송
    @RequestMapping("member/checkNick")
    @ResponseBody
	public int checkNick(HttpServletRequest request) throws Exception {
		
    	String mnick=request.getParameter("nick");
    	
		int isNick=joinSV.checkNick(mnick);
		
		if(isNick==0) {//같은 닉네임이 없을 때
			
			return 0;
		}else {//같은 닉네임이 있을 때
			
			return 1;
		}
    }
	
}
