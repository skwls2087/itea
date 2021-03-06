package com.itea.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itea.dto.MemberDTO;
import com.itea.member.service.FindIdPwService;

@Controller
@RequestMapping("/member")
public class FindIdPwController {
	
	@Autowired
	FindIdPwService findidpwSV;
	
	// 아이디 찾기 폼
	@RequestMapping("/find_id_form.co")
	public String find_id_form() throws Exception{
		return "/member/find_id_form";
	}
	
	// 아이디 찾기
	@RequestMapping("/find_id")
	public String find_id
			(HttpServletResponse response,
			HttpServletRequest request,
			MemberDTO mdto) throws Exception{
		String mname  =  request.getParameter("mname");
		String mphone = request.getParameter("mphone");
		ArrayList<MemberDTO> list = findidpwSV.find_id(response,mdto);
		request.setAttribute("LIST", list);
		return "/member/find_id";
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping("/find_pw_form.co")
	public String find_pw_form() throws Exception{
		return "/member/find_pw_form";
	}
	
	// 비밀번호 찾기
	@RequestMapping("/find_pw")
	public String find_pw(HttpServletResponse response,HttpServletRequest request,MemberDTO member) throws Exception{
		String mname  =  request.getParameter("mname");
		String mmail = request.getParameter("mmail");
		System.out.println("controller="+member);
		findidpwSV.find_pw(response, member);
		
		return "/member/loginFrm";
		
	}
	
		
}
