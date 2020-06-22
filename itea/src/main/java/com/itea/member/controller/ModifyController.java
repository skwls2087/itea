package com.itea.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itea.member.dto.MemberDTO;
import com.itea.member.service.ModifyService;


@Controller
public class ModifyController {

	@Autowired
	ModifyService modifySV;
	
//	//정보수정 폼 보여주기
	@RequestMapping("member/modifyFrm")
	public void modifyFrm(HttpServletRequest request) {
//		//1.파라미터 받기  mno=회원번호,
//		int mno=Integer.parseInt(request.getParameter("mno"));
//		//2.비즈니스 로직수행
//		MemberDTO mDto=modifySV.modify(mno);
//		//3.Model
//		//4.View
//	}
	}	
	
}
