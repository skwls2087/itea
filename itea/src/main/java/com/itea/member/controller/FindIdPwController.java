package com.itea.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.itea.member.dto.MemberDTO;
import com.itea.member.service.FindIdPwService;

import summer.com.dto.FileBoardDTO;


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
	public ModelAndView find_id(HttpServletResponse response,
			HttpServletRequest request,
			ModelAndView mv) throws Exception{
		System.out.println("아이디찾기 진입");
	
		//1.파라미터받기
		String mname  =  request.getParameter("mname");
		String mphone = request.getParameter("mphone");

		//2.비즈니스로직수행
		MemberDTO mdto = findidpwService.find_id(response,mdto);//파일게시판내용조회
		
		//3.Model
		mv.addObject("mname", mname);
		mv.addObject("mphone", mphone);
		
		//4.View
		mv.setViewName("/find_id");
		return mv;
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
