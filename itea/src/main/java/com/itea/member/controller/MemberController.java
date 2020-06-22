package com.itea.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itea.member.dto.MemberDTO;
import com.itea.member.service.MemberServiceImp;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberServiceImp service;

	// 이메일 중복 검사(AJAX)
	@RequestMapping(value = "/check_email.co", method = RequestMethod.POST)
	public void check_mmail(@RequestParam("email") String mmail, HttpServletResponse response) throws Exception{
		service.check_mmail(mmail, response);
	}
	
	// 회원 가입
	@RequestMapping(value = "/join_member.do", method = RequestMethod.POST)
	public String join_member(@ModelAttribute MemberDTO member, RedirectAttributes rttr, HttpServletResponse response) throws Exception{
		rttr.addFlashAttribute("result", service.join_member(member, response));
		return "redircet:./memberJoinForm.do";
	}
	
	// 회원 가입 폼 이동
	@RequestMapping(value = "/memberJoinForm.do")
	public String memberJoinForm() throws Exception{
		return "/member/memberJoinForm";
	}
}

