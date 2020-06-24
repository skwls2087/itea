package com.itea.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itea.member.dto.MemberDTO;
import com.itea.member.service.FindIdPwService;

@Controller
@RequestMapping("/member")
public class FindIdPwController {
	
	@Autowired
	FindIdPwService findidpwService;
	
	// 아이디 찾기 폼
	@RequestMapping(value = "/find_id_form.co")
	public String find_id_form() throws Exception{
		return "/member/find_id_form";
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/find_id.co", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, MemberDTO mdto, Model md) throws Exception{
		md.addAttribute("MMAIL", findidpwService.find_id(response, mdto));
		return "/member/find_id";
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping(value = "/find_pw_form.co")
	public String find_pw_form() throws Exception{
		return "/member/find_pw_form";
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/find_pw.do", method = RequestMethod.POST)
	public void find_pw(@ModelAttribute MemberDTO member, HttpServletResponse response) throws Exception{
		findidpwService.find_pw(response, member);
	}
	
	
		
}
