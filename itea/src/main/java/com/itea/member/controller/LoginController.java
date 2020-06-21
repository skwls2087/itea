package com.itea.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itea.member.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService loginService;
	
	//로그인 폼 보여주기
	@RequestMapping("loginFrm")
	public String loginFrm() {
		return "member/login";
	}
	
	//로그인 로직 수행
	@RequestMapping("loginProc")
	public String loginProc(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		loginService.selectMember();
		
		response.sendRedirect(".");
		
		return "member/login";
	}
}
