package com.itea.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itea.member.dto.MemberDTO;
import com.itea.member.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService loginSV;
	
	//로그인 폼 보여주기
	@RequestMapping("member/loginFrm")
	public void loginFrm() {
	}
	
	//로그인 로직 수행
	@RequestMapping("member/loginProc")
	public String loginProc(MemberDTO mdto, HttpSession session,
			HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		//해당 이메일과 비밀번호가 존재하는지 검색
		MemberDTO member=loginSV.login(mdto);
		
		if(member==null) { //일치하는 회원 없음 -> 로그인폼으로 다시 이동
			return "member/loginFrm";
		}else{ //일치하는 회원 존재함 -> 회원정보를 가지고 메인화면으로 이동
			session.setAttribute("MNO", member.getMno());
			session.setAttribute("MNICK", member.getMnick());
		}
		
		return "../../index";
	}
	
	//로그아웃 로직 수행
	@RequestMapping("member/logoutProc")
	public String logoutProc(HttpSession session) {
		session.invalidate();
		System.out.println("로그아웃 됨");
		return "../../index";
	}
}



