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
	@RequestMapping("loginFrm")
	public String loginFrm() {
		return "member/login";
	}
	
	//로그인 로직 수행
	@RequestMapping("loginProc")
	public String loginProc(MemberDTO mdto, HttpSession session,
			HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		System.out.println("컨트롤러옴!");
		System.out.println(mdto);
		
		//해당 이메일과 비밀번호가 존재하는지 검색
		loginSV.login(mdto);
		
		response.sendRedirect(".");
		
		return "member/login";
	}
}
