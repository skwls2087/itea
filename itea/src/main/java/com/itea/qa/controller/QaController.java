package com.itea.qa.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itea.member.service.LoginService;

@Controller
public class QaController {
	
	@Autowired
	LoginService loginSV;
	
	//qa게시판 폼 보여주기
	@RequestMapping("qa/qaFrm")
	public void loginFrm() {
		
		System.out.println("Q&A 폼 보여주기");
		
	}
	
	//qa게시판 폼 보여주기
	@RequestMapping("qa/qInsert")
	public String qInsert() {
		
		System.out.println("Q&A 질문 등록하기");
		
		return "qa/qaFrm";
		
	}
	
}
