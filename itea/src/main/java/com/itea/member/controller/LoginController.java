package com.itea.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itea.member.dto.MemberDTO;
import com.itea.member.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService loginSV;
	
	//로그인 폼 보여주기
	@RequestMapping("member/loginFrm")
	public void loginFrm(Model model, HttpSession session) {
		
		System.out.println("로그인 폼");
		
	}
	
	//이메일 로그인 로직 수행
	@RequestMapping("member/loginProc")
	public String loginProc(MemberDTO mdto, HttpSession session,
			HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		System.out.println("이메일로 로그인 로직 수행");
		
		mdto.setMclass(1);
		
		//해당 이메일과 비밀번호가 존재하는지 검색
		MemberDTO member=loginSV.login(mdto);
		
		if(member==null) { //일치하는 회원 없음 -> 로그인폼으로 다시 이동
			return "member/loginFrm";
		}else{ //일치하는 회원 존재함 -> 회원정보를 가지고 메인화면으로 이동
			session.setAttribute("MNO", member.getMno());
			session.setAttribute("MNICK", member.getMnick());
		}
		
		return "../../index";
	}
	
	//네이버로그인
	@RequestMapping(value = "/callback")
	public String loginPOSTNaver(HttpSession session) {
		
		return "member/navercallback";
	}
	
	//네아로-회원가입 여부 체크하기
	@RequestMapping(value = "/joincheck")
	public String joinCheck(@RequestParam String email,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		
		MemberDTO mdto=new MemberDTO();
		
		System.out.println("조인체크");
		
		mdto.setMclass(2);
		mdto.setMmail(email);
			
		//해당 이메일이 회원 테이블에 있는지 검색
		MemberDTO member=loginSV.snsLogin(mdto);
		
		if(member!=null) { //회원이면 로그인 처리 완료
			
			session.setAttribute("MNO", member.getMno());
			session.setAttribute("MNICK", member.getMnick());
			
			return ".";
			
		}else { //회원이 아니면 회원가입페이지로 이동
			System.out.println("회원아냐");
			
			request.setAttribute("email", email);

			
			return "member/joinFrmSNS";
		}
	}
	
	//sns로그인
	@RequestMapping("member/snslogin")
	public String snslogin(@RequestParam String email,HttpServletRequest request) {
		
		request.setAttribute("email", email);
		
		return "/index";
	}
	
	//로그아웃 로직 수행
	@RequestMapping("member/logoutProc")
	public String logoutProc(HttpSession session) {
		
		session.invalidate();
		
		System.out.println("로그아웃 됨");
		
		return "/index";
	}
	
	
}



