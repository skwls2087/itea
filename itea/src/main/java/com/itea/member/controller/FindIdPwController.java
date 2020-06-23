package com.itea.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itea.member.dto.MemberDTO;
import com.itea.member.service.FindIdPwService;

@Controller
@RequestMapping("/member")
public class FindIdPwController {
	
	@Autowired
	FindIdPwService findidpwService;
	
	// 아이디 찾기 폼
	@RequestMapping("/find_id_form")
	public void find_id_form() throws Exception{
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	public void find_id(HttpServletResponse response, MemberDTO mdto, Model md) throws Exception{
		md.addAttribute("mdto", findidpwService.find_id(response, mdto));
		System.out.println(mdto);
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping("/find_pw_form")
	public void find_pw_form() throws Exception{
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	public void find_pw(@ModelAttribute MemberDTO member, HttpServletResponse response) throws Exception{
		findidpwService.find_pw(response, member);
	}
		
}
