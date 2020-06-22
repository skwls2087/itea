package com.itea.member.controller;

import java.io.IOException;

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

import com.itea.member.dto.MemberDTO;
import com.itea.member.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService loginSV;
	
	// 비밀번호 찾기
		@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
		public void find_pw(@ModelAttribute MemberDTO member, HttpServletResponse response) throws Exception{
			loginSV.find_pw(response, member);
		}
	
	// 비밀번호 찾기 폼
	@RequestMapping(value = "/find_pw_form")
	public String find_pw_form() throws Exception{
		return "/member/find_pw_form";
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception{
		md.addAttribute("id", loginSV.find_id(response, email));
		return "/member/find_id";
	}

	// 아이디 찾기 폼
	@RequestMapping(value = "/find_id_form")
	public String find_id_form() throws Exception{
		return "/member/find_id_form";
	}

	//로그인 폼 보여주기
	@RequestMapping("loginFrm")
	public String loginFrm() {
		return "member/login";
	}
	
	//로그인 로직 수행
	@RequestMapping("loginProc")
	public String loginProc(MemberDTO mdto, HttpSession session,
			HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		//해당 이메일과 비밀번호가 존재하는지 검색
		MemberDTO member=loginSV.login(mdto);
		
		if(member==null) { //일치하는 회원 없음 -> 로그인폼으로 다시 이동
			return "member/login";
		}else{ //일치하는 회원 존재함 -> 회원정보를 가지고 메인화면으로 이동
			session.setAttribute("MNO", member.getMno());
			session.setAttribute("MNICK", member.getMnick());
		}
		
		return "../../index";
	}
}
