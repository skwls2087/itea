package com.itea.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.itea.member.dto.MemberDTO;
import com.itea.member.service.ModifyService;


@Controller
public class ModifyController {

	@Autowired
	ModifyService modifySV;
	
	//정보수정 폼 보여주기
	@RequestMapping("member/modifyFrm")
	public String modifyFrm(HttpServletRequest request, HttpSession session) {
	System.out.println("폼보기 진입");	
	//1.파라미터 받기
//	int mno=Integer.parseInt(request.getParameter("mno"));
	int mno= (Integer) session.getAttribute("MNO");
	//2.비즈니스로직수행
	MemberDTO mDto = modifySV.modifyInfo(mno);
	//3.Mdoel
	request.setAttribute("mDto", mDto);
	//4.View
	return "member/modifyFrm";
	}
	
	
//	//정보수정 로직 수행
	@RequestMapping("member/modify")
	public ModelAndView modify(HttpSession session,
			ModelAndView mv,
			MemberDTO mDto
			) {
		System.out.println("정보수정함수 진입");
		//1.파라미터 받기  mno=회원번호,
//		int mno=Integer.parseInt(request.getParameter("mno"));
		int mno= (Integer) session.getAttribute("MNO");
		System.out.println("회원번호"+mDto.getMno());
//		//2.비즈니스 로직수행
			modifySV.modify(mDto);
//		//3.Model
		
//		//4.View
			RedirectView rv = new RedirectView("../index.jsp");
			mv.setView(rv);	
			return mv;
		//	}
	}	
	//로그아웃 처리
		@RequestMapping("/member/logout")
		public String logout(HttpSession session) {
			System.out.println("logout 함수 진입");
			session.invalidate();
			return "../../index";
		}
}