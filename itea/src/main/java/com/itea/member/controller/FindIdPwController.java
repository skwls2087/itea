package com.itea.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping("/find_id")
	public String find_id(MemberDTO mdto, HttpSession session,
			HttpServletResponse response) 
					throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//해당 이름과 휴대폰번호가 존재하는지 검색
		MemberDTO member=findidpwService.find_id(mdto);
		String mmail = member.getMmail();
		
		System.out.println(mdto);
		if (member == null) { //일치하는 회원 없음
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else { //일치하는 회원 존재함
			//out.println("<script>");
			//out.println("alert('아이디는'+${mmail}+'입니다.');");
			//out.println("</script>");
			//out.close();
			session.setAttribute("MNAME",member.getMname());
			session.setAttribute("MPHONE",member.getMphone());
			return "/find_id.co";
		}
	}
	
	
	
/*	// 아이디 찾기
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	public void find_id(HttpServletResponse response, MemberDTO mdto, Model md) throws Exception{
		md.addAttribute("mdto", findidpwService.find_id(response, mdto));
		System.out.println(mdto);
	}*/
	
	/*// 아이디 찾기
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	@ResponseBody
	public String userIdSearch(@RequestParam("inputName_1") String mame, 
			@RequestParam("inputPhone_1") String mphone) {
		
		String result = findidpwService.find_id(mame, mphone);
		return result;
	}*/


	
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
